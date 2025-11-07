import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/chat_room_model.dart';
import '../models/message_model.dart';

class ChatRepository {
  final _supabase = Supabase.instance.client;

  // Get all chat rooms for current user
  Future<List<ChatRoomModel>> getChatRooms() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) throw Exception('User not authenticated');

    final response = await _supabase
        .from('chat_rooms')
        .select('''
          *,
          chat_participants!inner(user_id),
          messages(content, created_at)
        ''')
        .eq('chat_participants.user_id', userId)
        .order('updated_at', ascending: false);

    final rooms = (response as List)
        .map((room) {
          // Get last message if exists
          final messages = room['messages'] as List?;
          String? lastMessage;
          DateTime? lastMessageAt;
          
          if (messages != null && messages.isNotEmpty) {
            final lastMsg = messages.first;
            lastMessage = lastMsg['content'] as String?;
            lastMessageAt = DateTime.parse(lastMsg['created_at'] as String);
          }

          return ChatRoomModel.fromJson({
            ...room as Map<String, dynamic>,
            'last_message': lastMessage,
            'last_message_at': lastMessageAt?.toIso8601String(),
          });
        })
        .toList();

    return rooms;
  }

  // Get messages for a specific room
  Future<List<MessageModel>> getMessages(String roomId, {int limit = 50}) async {
    final response = await _supabase
        .from('messages')
        .select('''
          *,
          profiles!messages_sender_id_fkey(full_name, avatar_url)
        ''')
        .eq('room_id', roomId)
        .eq('is_deleted', false)
        .order('created_at', ascending: false)
        .limit(limit);

    return (response as List)
        .map((msg) {
          final sender = msg['profiles'];
          return MessageModel.fromJson({
            ...msg as Map<String, dynamic>,
            'sender_name': sender?['full_name'],
            'sender_avatar': sender?['avatar_url'],
          });
        })
        .toList();
  }

  // Send a text message
  Future<MessageModel> sendMessage({
    required String roomId,
    required String content,
  }) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) throw Exception('User not authenticated');

    final response = await _supabase
        .from('messages')
        .insert({
          'room_id': roomId,
          'sender_id': userId,
          'content': content,
        })
        .select('''
          *,
          profiles!messages_sender_id_fkey(full_name, avatar_url)
        ''')
        .single();

    // Update room's updated_at
    await _supabase
        .from('chat_rooms')
        .update({'updated_at': DateTime.now().toIso8601String()})
        .eq('id', roomId);

    final sender = response['profiles'];
    return MessageModel.fromJson({
      ...response as Map<String, dynamic>,
      'sender_name': sender?['full_name'],
      'sender_avatar': sender?['avatar_url'],
    });
  }

  // Listen to new messages in a room (real-time)
  Stream<MessageModel> subscribeToMessages(String roomId) {
    return _supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('room_id', roomId)
        .order('created_at')
        .map((data) async* {
          for (final msg in data) {
            // Fetch sender info
            final senderResponse = await _supabase
                .from('profiles')
                .select('full_name, avatar_url')
                .eq('id', msg['sender_id'])
                .single();

            yield MessageModel.fromJson({
              ...msg as Map<String, dynamic>,
              'sender_name': senderResponse['full_name'],
              'sender_avatar': senderResponse['avatar_url'],
            });
          }
        })
        .expand((stream) => stream);
  }

  // Create a new chat room
  Future<ChatRoomModel> createChatRoom({
    required String name,
    required List<String> participantIds,
    String? orderId,
  }) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) throw Exception('User not authenticated');

    // Create room
    final roomResponse = await _supabase
        .from('chat_rooms')
        .insert({
          'name': name,
          'order_id': orderId,
        })
        .select()
        .single();

    final roomId = roomResponse['id'] as String;

    // Add participants (including current user)
    final allParticipants = {...participantIds, userId}.toList();
    await _supabase.from('chat_participants').insert(
      allParticipants.map((id) => {
        'room_id': roomId,
        'user_id': id,
      }).toList(),
    );

    return ChatRoomModel.fromJson(roomResponse);
  }

  // Mark messages as read
  Future<void> markAsRead(String roomId) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    await _supabase
        .from('chat_participants')
        .update({'last_read_at': DateTime.now().toIso8601String()})
        .eq('room_id', roomId)
        .eq('user_id', userId);
  }
}

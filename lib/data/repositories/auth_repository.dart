import '../models/user_model.dart';
import '../services/supabase_service.dart';

class AuthRepository {
  // Sign in with email and password
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final response = await SupabaseService.signIn(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw Exception('Sign in failed');
    }

    // Fetch user profile
    final profile = await SupabaseService.getUserProfile(response.user!.id);
    
    if (profile == null) {
      throw Exception('User profile not found');
    }

    return UserModel.fromJson(profile);
  }

  // Sign up with email, password, and name
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String fullName,
    String role = 'client',
  }) async {
    final response = await SupabaseService.signUp(
      email: email,
      password: password,
      fullName: fullName,
      role: role,
    );

    if (response.user == null) {
      throw Exception('Sign up failed');
    }

    // Fetch user profile
    final profile = await SupabaseService.getUserProfile(response.user!.id);
    
    if (profile == null) {
      throw Exception('User profile not found');
    }

    return UserModel.fromJson(profile);
  }

  // Sign out
  Future<void> signOut() async {
    await SupabaseService.signOut();
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    await SupabaseService.resetPassword(email);
  }

  // Get current user profile
  Future<UserModel?> getCurrentUserProfile() async {
    final userId = SupabaseService.currentUserId;
    
    if (userId == null) {
      return null;
    }

    final profile = await SupabaseService.getUserProfile(userId);
    
    if (profile == null) {
      return null;
    }

    return UserModel.fromJson(profile);
  }

  // Update user profile
  Future<UserModel> updateProfile({
    required String userId,
    String? fullName,
    String? phone,
    String? avatarUrl,
  }) async {
    final updates = <String, dynamic>{};
    
    if (fullName != null) updates['full_name'] = fullName;
    if (phone != null) updates['phone'] = phone;
    if (avatarUrl != null) updates['avatar_url'] = avatarUrl;
    
    updates['updated_at'] = DateTime.now().toIso8601String();

    await SupabaseService.updateUserProfile(userId, updates);

    final profile = await SupabaseService.getUserProfile(userId);
    
    if (profile == null) {
      throw Exception('Failed to fetch updated profile');
    }

    return UserModel.fromJson(profile);
  }

  // Check if user is authenticated
  bool get isAuthenticated => SupabaseService.isAuthenticated;

  // Get current user ID
  String? get currentUserId => SupabaseService.currentUserId;
}

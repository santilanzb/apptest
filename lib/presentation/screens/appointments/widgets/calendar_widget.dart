import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:go_router/go_router.dart';


class CalendarWidget extends StatefulWidget {
  final String userId;

  const CalendarWidget({
    super.key,
    required this.userId,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final _supabase = Supabase.instance.client;
  List<Appointment> _appointments = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchAppointments();
  }

  Future<void> _fetchAppointments() async {
    try {
      final response = await _supabase
          .from('appointments')
          .select()
          .eq('health_professional_id', widget.userId)
          .order('scheduled_at', ascending: true);
      
      final data = response as List;
      
      final fetched = data.map( (item) {
        final start = DateTime.parse(item['scheduled_at']);
        final duration = (item['duration_minutes'] ?? 60) as int;
        final end = start.add(Duration(minutes: duration));
        return Appointment(
          startTime: start,
          endTime: end,
          subject: item['status'] ?? 'Appointment',
          notes: item['notes'] ?? '',
          location: item['meeting_link'],
          color: _statusColor(item['status']),
        );
      }).toList();
      
      setState(() {
        _appointments = fetched;
        _loading = false;
      });
    } catch (e) {
      debugPrint('error fetching appointments: $e');
      setState(() {
        _loading = false;
      });
    } 
  } // Future

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator(),);
    }
    
    return SfCalendar(
      view: CalendarView.week,
      dataSource: AppointmentDataSource(_appointments),
      showDatePickerButton: true,
      showCurrentTimeIndicator: true,
      todayHighlightColor: Colors.blue,
      appointmentTextStyle: const TextStyle(color: Colors.white),
      onTap: (details) {
        if (details.appointments != null && details.appointments!.isNotEmpty) {
          final appt = details.appointments!.first as Appointment;
          showDialog(context: context, builder: (_) => AlertDialog(
            title: Text(appt.subject),
            content: Text(
              'Start: ${appt.startTime}\n'
              'End: ${appt.endTime}\n'
              'Notes: ${appt.notes ?? "No notes"}\n'
              'Meeting Link: ${appt.location ?? "-"}'
            ),
            actions: [
              TextButton(onPressed: () => context.pop(), child: const Text('Close')),
            ],
          ));
        }
      }
    ); //SfCalendar
  } // Widget

  Color _statusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'confirmed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }
} // _CalendarWidgetState

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}


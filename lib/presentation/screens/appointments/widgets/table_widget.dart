import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:apptest/l10n/app_localizations.dart';

class AppointmentsTableWidget extends StatefulWidget {
  final String clientId;
  const AppointmentsTableWidget({
    super.key,
    required this.clientId,
});
  @override
  State<AppointmentsTableWidget> createState() => _AppointmentsTableWidgetState();
}

class _AppointmentsTableWidgetState extends State<AppointmentsTableWidget> {
  final _supabase = Supabase.instance.client;
  bool _loading = true;
  List<Map<String, dynamic>> _appointments = [];

  @override
  void initState() {
    super.initState();
    _fetchAppointments();
  }

  Future<void> _fetchAppointments() async {
    try {
      final response = await _supabase
          .from('appointments')
          .select('''
          scheduled_at, 
          duration_minutes,
          health_professional:profiles(full_name),
          status,
          notes
         ''')
          .eq('client_id', widget.clientId)
          .order('scheduled_at', ascending: true);

      setState(() {
        _appointments = List<Map<String, dynamic>>.from(response);
        _loading = false;
      });
    } catch (e) {
      debugPrint('Error fetching appointments: $e');
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    if (_loading) return Center(child: CircularProgressIndicator());

    if (_appointments.isEmpty) {
      return Center(child: Text(t.appointmentsTableEmpty));
    }

    return SingleChildScrollView(
      // scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: WidgetStatePropertyAll(Colors.blue.shade50),
        columns: [
          DataColumn(label: Text(t.appointmentsTableDate)),
          DataColumn(label: Text(t.appointmentsTableTime)),
          DataColumn(label: Text(t.appointmentsTableProfessional)),
          DataColumn(label: Text(t.appointmentsTableStatus)),
          DataColumn(label: Text(t.appointmentsTableNotes)),
          DataColumn(label: Text(t.appointmentsTableLocation)),
        ],
        rows: _appointments.map((appt) {
          final start = DateTime.parse(appt['scheduled_at']);
          final duration = appt['duration_minutes'] ?? 60;
          final end = start.add(Duration(minutes: duration));
          final timeRange = '${_formatTime(start)} - ${_formatTime(end)}';

          return DataRow(cells: [
            DataCell(Text(_formatDate(start))),
            DataCell(Text(timeRange)),
            DataCell(Text((appt['health_professional']?['full_name'] as String?) ?? '-')),
            DataCell(Text(appt['status'] ?? '', style: TextStyle(color: _statusColor(appt['status'])),)),
            DataCell(Text(appt['notes'] ?? '-')),
            DataCell(Text(appt['meeting_link'] ?? '-')),
          ]);
        }).toList(),
      ),
    );
  }

  String _formatDate(DateTime dt) =>
      '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';

  String _formatTime(DateTime dt) =>
      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

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

}
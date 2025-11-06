import 'package:flutter/material.dart';
import 'widgets/calendar_widget.dart';


class ClientCalendarScreen extends StatelessWidget {
  final String userId;
  const ClientCalendarScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Appointment')),
      body: CalendarWidget(userId: userId),
    );
  }

}
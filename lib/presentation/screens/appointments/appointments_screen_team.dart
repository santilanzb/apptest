import 'package:flutter/material.dart';
import 'widgets/calendar_widget.dart';


class TeamCalendarScreen extends StatelessWidget {
  final String userId;
  const TeamCalendarScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Appointment')),
      body: CalendarWidget(userId: userId),
    );
  }

}
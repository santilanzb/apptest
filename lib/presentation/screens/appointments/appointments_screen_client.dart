import 'package:flutter/material.dart';
import 'widgets/table_widget.dart';


class AppointmentsClientScreen extends StatelessWidget {
  final String clientId;
  const AppointmentsClientScreen({
    super.key,
    required this.clientId
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Appointments')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppointmentsTableWidget(clientId: clientId)
      )
    );
  }
}
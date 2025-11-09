import 'package:flutter/material.dart';
import 'widgets/table_widget.dart';
import 'package:apptest/l10n/app_localizations.dart';


class AppointmentsClientScreen extends StatelessWidget {
  final String clientId;
  const AppointmentsClientScreen({
    super.key,
    required this.clientId
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.appointmentsClientTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppointmentsTableWidget(clientId: clientId)
      )
    );
  }
}
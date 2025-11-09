import 'package:flutter/material.dart';
import 'widgets/calendar_widget.dart';
import 'package:apptest/l10n/app_localizations.dart';


class TeamCalendarScreen extends StatelessWidget {
  final String userId;
  const TeamCalendarScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.appointmentsTeamTitle)),
      body: CalendarWidget(userId: userId),
    );
  }

}
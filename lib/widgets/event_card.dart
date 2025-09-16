import 'package:flutter/material.dart';
import '../models/event_model.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(event.name),
        subtitle: Text(event.description),
        onTap: () {
          // TODO: Navigate to BetScreen
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Tapped ${event.name}")),
          );
        },
      ),
    );
  }
}

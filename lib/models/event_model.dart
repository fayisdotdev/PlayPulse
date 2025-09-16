import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String name;
  final String description;
  final Timestamp startTime;
  final Timestamp endTime;
  final List<String> teamIds;
  final String status;

  EventModel({
    required this.id,
    required this.name,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.teamIds,
    required this.status,
  });

  factory EventModel.fromMap(Map<String, dynamic> map, String docId) {
    return EventModel(
      id: docId,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      startTime: map['startTime'] as Timestamp,
      endTime: map['endTime'] as Timestamp,
      teamIds: List<String>.from(map['teamIds'] ?? []),
      status: map['status'] ?? 'ongoing',
    );
  }
}

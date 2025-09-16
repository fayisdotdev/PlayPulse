import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/event_model.dart';

class EventProvider with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<EventModel> events = [];

  Future<void> fetchEvents() async {
    final snapshot = await _db.collection('events').get();
    events = snapshot.docs
        .map((doc) => EventModel.fromMap(doc.data(), doc.id))
        .toList();
    notifyListeners();
  }
}

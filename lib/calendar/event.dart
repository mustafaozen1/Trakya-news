import 'package:flutter/foundation.dart';

class Event {
  final String title;
  final DateTime time;
  Event({required this.title, required this.time});

  String toString() => this.title;
}

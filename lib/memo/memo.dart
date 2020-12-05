import 'package:flutter/material.dart';

class Memo {
  Memo(
      {this.id,
      this.title,
      this.subtitle,
      this.description,
      this.imageUrl,
      this.date});

  String id;
  String title;
  String subtitle;
  String description;
  String imageUrl;
  DateTime date;
}

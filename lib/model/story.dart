import 'package:flutter/cupertino.dart';

class Story {
  final int id;
  final String name;
  final String imageUrl;
  final Widget page;

  Story(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.page});
}

import 'dart:convert';
import 'package:flutter/services.dart';

class StoryData {
  Future<dynamic> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/story.json');
    return await json.decode(response);
  }
}

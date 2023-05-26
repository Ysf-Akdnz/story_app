import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:story_app/arayuz_main.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const StoryApp());
}

class StoryApp extends StatelessWidget {
  const StoryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Hikaye Uygulaması',
      home: ArayuzMainIskele(),
    );
  }
}

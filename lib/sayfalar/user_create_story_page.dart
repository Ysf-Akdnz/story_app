import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_app/model/story_name.dart';
import 'package:story_app/model/dialogCards.dart';

import '../butonlar/create_story_button.dart';
import '../model/story_image.dart';

class StoryOlusturma extends StatefulWidget {
  const StoryOlusturma({super.key});

  @override
  State<StoryOlusturma> createState() => _StoryOlusturmaState();
}

class _StoryOlusturmaState extends State<StoryOlusturma> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: CreateStory(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

class CreateStory extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const CreateStory({Key? key});

  @override
  State<CreateStory> createState() => _CreateStoryState();
}

class _CreateStoryState extends State<CreateStory> {
  StoryName storyName = StoryName();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          const CreateStoryButton(),
          storyName.storyName('storyName'.tr),
          const StoryImage(),
          const SizedBox(height: 10),
          const DialogCards()
        ],
      ),
    );
  }
}

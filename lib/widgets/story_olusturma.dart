import 'package:flutter/material.dart';
import 'package:story_app/widgets/temalar/crt_stry.dart';

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
  const CreateStory({super.key});

  @override
  State<CreateStory> createState() => _CreateStoryState();
}

class _CreateStoryState extends State<CreateStory> {
  CrtStryBtn btn1 = CrtStryBtn();
  CrtStryImgView view1 = CrtStryImgView();
  DlgNo dlgNo = DlgNo();
  DialogsView dialogsView = DialogsView();
  AfBfbutton afBfbutton = AfBfbutton();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              btn1.storyButton("Hikayenin Başlığını Giriniz"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  dlgNo.dlgNo(),
                  view1.imageView(),
                ],
              ),
              const SizedBox(height: 10),
              dialogsView.dialogsView(),
              afBfbutton.abButton(),
            ],
          ),
        ),
      ],
    );
  }
}

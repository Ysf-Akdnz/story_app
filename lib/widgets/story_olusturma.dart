import 'package:flutter/material.dart';
import 'package:story_app/widgets/temalar/crt_stry.dart';
import 'package:story_app/widgets/temalar/dialogCards.dart';

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
  CrtStryBtn btn1 = CrtStryBtn();
  CrtStryImgView view1 = CrtStryImgView();
  DlgNo dlgNo = DlgNo();
  //DialogsView dialogsView = DialogsView();
  //AfBfbutton afBfbutton = AfBfbutton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height,
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          btn1.storyButton("Hikayenin Başlığını Giriniz"),
          view1.imageView(),
          const SizedBox(height: 10),
          const DialogCards()
          //dialogsView.dialogsView("Hikayeni Yaz"),
          //afBfbutton.abButton(),
        ],
      ),
    );
  }
}

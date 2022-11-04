import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class storyPage extends StatefulWidget {
  const storyPage({Key? key}) : super(key: key);

  @override
  State<storyPage> createState() => _storyPageState();
}

class _storyPageState extends State<storyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: StoryPageChild(),
      ),
    );
  }
}

class StoryPageChild extends StatefulWidget {
  const StoryPageChild({Key? key}) : super(key: key);

  @override
  State<StoryPageChild> createState() => _StoryPageChildState();
}

class _StoryPageChildState extends State<StoryPageChild> {
  String metinYazisi =
      'Burada hikaye metni geçiyor..asadasdadadsadsadasdasdasdasdasdasdasdasdasdasdaasdasdasdasdasd';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      //color: Colors.grey[900],
      child: Column(
        mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7.5),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadiusDirectional.circular(16.0),
            ),
            child: Image.asset(
              'assets/images/foto.jpeg',
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              //height: 365,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey[800],
                borderRadius: BorderRadiusDirectional.circular(16.0),
              ),
              child: SingleChildScrollView(
                child: Text(
                  //textAlign: TextAlign.center,
                  metinYazisi,
                  style: GoogleFonts.quintessential(
                    fontSize: Theme.of(context).textTheme.headline6?.fontSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Row(
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Colors.grey[900],
                child: Icon(
                  Icons.menu,
                  size: 45,
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.grey[900],
                child: Icon(
                  Icons.volume_up_outlined,
                  size: 45,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

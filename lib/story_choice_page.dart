import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryChoicePage extends StatefulWidget {
  bool showChoice = false;

  StoryChoicePage({Key? key, this.showChoice = false}) : super(key: key);

  @override
  State<StoryChoicePage> createState() => _StoryChoicePageState();
}

class _StoryChoicePageState extends State<StoryChoicePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: GoogleFonts.quintessential(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
    );
    String metinYazisi =
        'Burada Hikaye metni geçecek...adasdasdasasdadasdasdasdaasdasdasdasdasdasdasdasdsdasdasdasdasdasdasdasdasd';
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Container(
          padding: EdgeInsets.all(10.0),
          //constraints: BoxConstraints.tightForFinite(width: 400),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 7.5),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(16.0),
                ),
                child: Image.asset('assets/images/foto.jpeg'),

                //height: 200,
                /*decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadiusDirectional.circular(16.0),
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage('assets/images/foto.jpeg'),
                fit: BoxFit.fill,
              ),
            ),*/
                /*child: Center(
              child: Image.asset('assets/images/foto.jpeg'),
            ),*/
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  //height: MediaQuery.of(context).size.height * 0.40,
                  /*constraints: BoxConstraints.expand(
                height:
                    Theme.of(context).textTheme.headline4!.fontSize! * 1.1 +
                        200.0,
              ),*/
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey[800],
                    borderRadius: BorderRadiusDirectional.circular(16.0),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      metinYazisi,
                      textAlign: TextAlign.center,
                      //softWrap: true,
                      //textAlign: TextAlign.center,
                      style: GoogleFonts.quintessential(
                        fontSize:
                            Theme.of(context).textTheme.headline6?.fontSize,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.showChoice)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: style,
                        onPressed: () {},
                        child: Text('Seçim 1'),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: style,
                        onPressed: () {},
                        child: Text('Seçim 2'),
                      ),
                    ),
                  ],
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.grey[900],
                    child: const Icon(
                      Icons.menu,
                      size: 45,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.grey[900],
                    child: const Icon(
                      Icons.volume_up_outlined,
                      size: 45,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

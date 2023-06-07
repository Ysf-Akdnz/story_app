import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_app/widgets/story_list_widget.dart';
import 'package:story_app/widgets/setting_widgets.dart';
import 'package:story_app/model/setting.dart';
import 'package:get/get.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({super.key});

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.black87,
        body: const GirissSayfasi(),
        bottomNavigationBar: GetSettings(
          sckey: _key,
          menuVisible: false,
          girisVisible: false,
          userStories: false,
        ),
        endDrawer: const Settings(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

class GirissSayfasi extends StatefulWidget {
  const GirissSayfasi({super.key});

  @override
  State<GirissSayfasi> createState() => _GirissSayfasiState();
}

class _GirissSayfasiState extends State<GirissSayfasi> {
  Future<dynamic> exitDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Exit'.tr,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontFamily: 'Quintessential'),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'Nöö'.tr,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quintessential'),
                ),
              ),
              const SizedBox(width: 50),
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: Text(
                  'Yesnt'.tr,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quintessential'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[900],
        borderRadius: BorderRadiusDirectional.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 125),
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.white.withOpacity(0.35),
                width: 1,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.black54,
                  width: 15,
                ),
              ),
              child: const Icon(
                Icons.landscape,
                size: 75,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 150),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StoryListWidget()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 21, 21, 21),
                              Color.fromARGB(221, 68, 68, 68)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topCenter),
                        borderRadius: BorderRadius.circular(13),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0, 6),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: Text(
                        'hg'.tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quintessential(
                            color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      exitDialog();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(221, 157, 0, 0),
                              Color.fromARGB(255, 255, 130, 130)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(13),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0, 6),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: Text(
                        'Çıkış'.tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quintessential(
                            color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

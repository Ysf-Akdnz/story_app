import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:story_app/widgets/get_settings.dart';
import 'widgets/setting.dart';
import 'widgets/cards.dart';

showMenu(GlobalKey<ScaffoldState> kkey) {
  kkey.currentState!.openDrawer();
}

class ArayuzMainIskele extends StatelessWidget {
  ArayuzMainIskele({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //playMusic("assets/musics/main-menu-music.ogg");
    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.black87,
        body: const ArayuzMain(),
        bottomNavigationBar: GetSettings(sckey: _key, menuVisible: false),
        endDrawer: const MySettingDrawer(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

class ArayuzMain extends StatefulWidget {
  const ArayuzMain({super.key});

  @override
  State<ArayuzMain> createState() => _ArayuzMainState();
}

class _ArayuzMainState extends State<ArayuzMain> {
  Future<bool?> showWarning(BuildContext context) async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(
            'Exit'.tr,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Quintessential'),
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
                  onPressed: () => SystemNavigator.pop(),
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldpop = await showWarning(context);
        return shouldpop ?? false;
      },
      child: const CardListView(),
    );
  }
}

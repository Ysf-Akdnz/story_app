import 'package:flutter/material.dart';

void main() {
  runApp(
    HikayeUygulamasi(),
  );
}

class HikayeUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MainMenuWidgets(),
      ),
    );
  }
}

class MainMenuWidgets extends StatelessWidget {
  // const MyButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Column(
        mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(100),
            child: const Text(
              'Hikaye İsmi',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 25),
          TextButton(
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 30)),
              onPressed: () {},
              child: const Text(
                'Devam Et',
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(height: 25),
          TextButton(
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 30)),
              onPressed: () {},
              child: const Text(
                'Yeni Oyun',
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(height: 25),
          TextButton(
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 30)),
              onPressed: () {},
              child: const Text(
                'Çıkış',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
/*home: Scaffold(
backgroundColor: Colors.grey[900],
body: SafeArea(
child: Column(
mainAxisSize: MainAxisSize.min,
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
Container(
margin: EdgeInsets.all(75),
child: const Text(
'Hikaye İsmi',
textScaleFactor: 2,
textAlign: TextAlign.center,
style: TextStyle(
color: Colors.white,
fontSize: 20,
fontWeight: FontWeight.bold),
),
),
SizedBox(height: 20),
TextButton(
style: TextButton.styleFrom(
textStyle: TextStyle(fontSize: 20),
),
onPressed: () {},
child: Text('Devam Et'),
)
/* Container(
                color: Colors.grey[800],
                width: 205,
                height: 75,
                child: Text('Deneme'),
              ), //Birden fazla child eklemeni sağlar
              Container(
                color: Colors.indigo[800],
                width: 205,
                height: 75,
                child: Text('Deneme2'),
              ),
              Container(
                color: Colors.red[900],
                width: 205,
                height: 75,
                child: Text('Deneme2'),
              ),*/
],
),
), //SafeArea; telefonun kullanılan alanlarında tasarım yapılmasını sağlar
), //Tüm tasarım bu alanda yapılır*/

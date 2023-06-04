import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Dil extends Translations {
  static const varsayilan = Locale("tr", "TR");
  static const diller = [
    Locale("tr", "TR"),
    Locale("en", "US"),
  ];
  @override
  Map<String, Map<String, String>> get keys => {
        'tr_TR': {
          'Duraklat': 'Duraklat',
          'Oynat': 'Oynat',
          'Exit': 'Uygulamadan çıkmak istediğinden emin misin?',
          'Nöö': 'Hayır',
          'Yesnt': 'Evet',
          'Devam et': 'Devam Et',
          'Yeni Oyun': 'Yeni Oyun',
          'Çıkış': 'Çıkış',
          'dil': 'tr-TR',
          'speechRate': '0.4',
          'hg': 'Hoş Geldiniz',
          'kf': 'Kapak Fotoğrafı'
        },
        'en_US': {
          'Duraklat': 'Pause',
          'Oynat': 'Play',
          'Exit': 'Are you sure you want to exit the application?',
          'Nöö': 'No',
          'Yesnt': "Yesn't",
          'Devam Et': 'Continue',
          'Yeni Oyun': 'New Game',
          'Çıkış': 'Exit',
          'dil': 'en-US',
          'speechRate': '0.3',
          'hg': 'Welcome',
          'kf': 'Cover Photo'
        },
      };
}

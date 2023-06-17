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
          'kf': 'Kapak Fotoğrafı',
          'storyName': 'Hikayenin Başlığını Giriniz',
          'olustur': 'Oluştur',
          'dialog': 'Diyalog ',
          'ws': 'Hikaye Metni',
          'save': 'Kaydet',
          'choiceText': 'Seçim Yazısı',
          'hikayeleriniz': 'Hikayeleriniz',
          'geri': 'Geri',
          'düzenle': 'Düzenle',
          'sil': 'Sil',
          'sonraki': 'Sonraki...'
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
          'kf': 'Cover Photo',
          'storyName': 'Enter Story Title',
          'olustur': 'Create',
          'dialog': 'Dialog ',
          'ws': 'Story Text',
          'save': 'Save',
          'choiceText': 'Choice Text',
          'hikayeleriniz': 'Your Stories',
          'geri': 'Back',
          'düzenle': 'Edit',
          'sil': 'Delete',
          'sonraki': 'Next...'
        },
      };
}

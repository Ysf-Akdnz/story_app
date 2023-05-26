import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DenemeTTS extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();

  final metin =
      "At arabasının sallantılarıyla gözlerini yavaşça araladın. Gece göğünün altında bulutsuz ve yıldızlı bir manzarayla karşılaştın. Yavaşça doğrulduğunda yanında, senin yaşlarında birkaç gencin daha uyuduğunu gördün. İleride meşale ışıkları gözükmeye başlamıştı. “Uyanın!” Diye bağırdı sürücü ve uyumakta olanlar herkesi uyandırdı. Kısa süre sonra araba durduğunda örme zincir zırh giymiş bir asker arabaya yaklaştı. “İnin ve beni takip edin.” \n\nArabadan inip adamı takip etmeye başladın. Onu takip ederken talim alanlarının etrafından geçtiğinizi fark ettin. İlk talim alanı neredeyse boştu. Sadece birkaç kişi birbirleriyle kılıç mücadelesindeydi ve bir hayli yorulmuş görünüyorlardı. İkinci talim alanına geldiğinizde takip ettiğiniz asker durdu. Yanına iki asker daha geldi ve birisi elindeki parşömen ve kalemi, sizi oraya götüren askere uzattı. Başınızdaki asker parşömen ve kağıdı aldı ve size döndü. “Sıraya girin, sırayla bilgileriniz alınacak.”";

  DenemeTTS({super.key});

  speak(String text) async {
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text(metin),
            ElevatedButton(
              child: const Text("Başlat"),
              onPressed: () => speak(metin),
            )
          ],
        ),
      ),
    );
  }
}

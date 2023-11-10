import 'dart:io';

class Quiz {
  List<Question> questions;
  int userScore = 0;
  Quiz(this.questions);
  void startQuiz() {
    print("Yüzüklerin Efendisi serisinin ilk filmi olan Yüzük Kardeşliği hakkında 20 soruluk quiz\n");
    print("BAŞLIYOR\n\n");
    for (var i = 0; i < questions.length; i++) {
      print("Soru ${i + 1}: ${questions[i].text}");
      print("A) ${questions[i].options[0]}");
      print("B) ${questions[i].options[1]}");
      print("C) ${questions[i].options[2]}");
      print("D) ${questions[i].options[3]}");

      stdout.write("Cevabınızı girin (A/B/C/D): ");
      String userAnswer = stdin.readLineSync()!.toUpperCase();
      if (userAnswer == questions[i].correctAnswer) {
        print("Doğru!");
        userScore++;
      } else {
        print("Yanlış! Doğru cevap: ${questions[i].correctAnswer}");
      }
      print("\n");
    }
    print("Quiz bitti. Toplam puanınız: ${userScore*5} ----- $userScore/${questions.length}");
  }
}

class Question {
  String text;
  List<String> options;
  String correctAnswer;
  Question(this.text, this.options, this.correctAnswer);
}

void main() {
  var question0 = Question("Yüzüklerin Efendisi Yüzük Kardeşliği filmi  hangi yılda çıkmıştır?",
  ["2001", "2002", "2003","2004"], "A");
  var question1 = Question("Yüzüklerin Efendisi’nin yazarı kimdir?",
  ["George R. R. Martin", "J. R. R. Tolkien", "J. K. Rowling","Suzanne Collins"], "B");
  var question2 = Question("Hobbitlerin yaşadığı yer neresidir?",
  ["Mordor", "Rohan", "Ayrıkvadi", "Shire"],      "D");
  var question3 = Question("Karanlıklar lideri kimdir?",
  ["Saruman", "Smaug", "Witch King", "Sauron"], "D");
  var question4 = Question("Ayrıkvadi’yi hangi elf lideri yönetmektedir?",
  ["Galadriel", "Legolas", "Elrond", "Celeborn"], "C");
  var question5 = Question("Gandalf, Balrog ile nerede mücadele etmiştir?",
  ["Ayrıkvadi", "Isengard", "Moria", "Minas Tirith"], "C");
  var question6 = Question("Gandalf, Shire’a geldiğinde kimin doğum günü kutlanıyordu?",
  ["Frodo Baggins", "Bilbo Baggins", "Merry", "Sam"], "B");
  var question7 = Question("Yüzük Kardeşliği kaç kişiden oluşur?",
  ["7", "8", "9", "10"], "C");
  var question8 = Question("Hobbitler ile Aragorn’un karşılaştığı yer neresidir?",
  ["Yürüyen Midilli", "Shire", "Minas Tirith", "Fırtınabaşı"], "A");
  var question9 = Question("Sauron’un şeytani hizmetkarları hangisidir?",
  ["Nazgûl", "Orglar", "Uruk-Hai", "Gollum"], "A");
  var question10 = Question("Frodo, Nazgûllar tarafından nerede saldırıya uğramış ve yaralanmıştır?",
  ["Osgiliath", "Moria Madenleri", "Fırtınabaşı", "Mordor"], "C");
   var question11 = Question("Nazgûllar tarafından yaralanan Frodo’yu kim Ayrıkvadi’ye yetiştirmiştir?",
  ["Aragorn", "Samwise Gamgee", "Gandalf", "Arwen"], "D");
  var question12 = Question("Dokuz yoldaş, öyle olsun. Sizinki yüzük kardeşliği olacak.” sözünü kim söylemiştir?",
  ["Gandalf", "Aragorn", "Galadriel", "Elrond"], "D");
  var question13 = Question("Bilbo Baggins kendisine Thorin Meşekalkan tarafından verilen hangi eşyayı Frodo’ya vermiştir?",
  ["Orcrist", "Elfstone", "Mithril", "Arkenstone"], "C");
  var question14 = Question("Ses yaparak orgları üstüne çeken, Gandalf’ın ‘Seni ahmak!’ diyerek kızdığı hobbit kimdir?",
  ["Frodo", "Pippin", "Sam", "Merry"], "B");
  var question15 = Question("Kimlere yüzük verilmemiştir??",
  ["Elfler", "İnsanlar", "Cüceler", "Hobbitler"], "D");
  var question16 = Question("Güç yüzüğü Sauron tarafından nerede dövülmüştür?",
  ["Sisli Dağlar", "Hüküm Dağları", "Isengard", "Dol Galdur"], "B");
  var question17 = Question("Yüzüğün etkisine kapılıp Frodo’dan yüzüğü almaya çalışan karakter kimdir?",
  ["Gimli", "Aragorn", "Boromir", "Sam"], "C");
  var question18 = Question("Boromir ölmeden önce Aragorn’a ne söylemiştir?",
  ["Seni izlerdim kardeşim, komutanım, kralım.", "Frodo’ya sahip çık ve ondan özür dilediğimi söyle.", "Hiç kimseye güvenme, sana hainlik yapacaklar.", "Kardeşim Faramir’e onu çok sevdiğimi söyle."], "A");
  var question19 = Question("Gimli, Galadriel’den ne istemiştir?",
  ["Altın hançer", "Altın", "Galadriel’in bir tel saçını", "Galadriel’in gözyaşını"], "C");

  var quiz = Quiz([question0,question1, question2, question3,question4,question5,question6, question7, question8,question9,question10,question11, question12, question13,question14,question15,question16, question17, question18,question19]);
  quiz.startQuiz();
}
import '../model/question.dart';

class QuestionBrain {
  int _questionCount = 0;

  List<Question> _questionStorage = [
    Question('Apple', 'リンゴ'),
    Question('Car', '車'),
    Question('Eat','食べる'),
    Question('Cat','ねこ'),
    Question('strawberry','いちご'),
    Question('sleep','寝る'),
    Question('play','~をする'),
    Question('great','すごい'),
    Question('Fight','闘う'),
    Question('Drink','飲む'),
  ];

  void nextQuestion() {
    if(_questionCount < _questionStorage.length - 1) {
      // increment count
      _questionCount++;
    }
  }

  String getWordToEnglish() {
    return _questionStorage[_questionCount].englishWord;
  }

  String getWordToJapanese() {
    return _questionStorage[_questionCount].japaneseWord;
  }

  bool isfinishedQuestion() {
    if(_questionCount == 10) {
      //finish question
      print('Finish Question');
      return true;
    } else {
      return false;
    }
  }

  // reset question
  void resetQuestion() {
    _questionCount = 0;
  }
}
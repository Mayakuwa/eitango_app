import '../model/question.dart';
import 'dart:math' as math;

class QuestionBrain {
  int _questionCount = 0;
  List<int> randomAnswer = [];

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

  //create random answer
  List<int> createRandomAnswer() {
    //  create list to 0~9
    int i;
    for(i = 0; i <= 9; i++) {
      randomAnswer.add(i);
    }
    //shuffle list
    randomAnswer.shuffle();
    List<int> newList = randomAnswer.sublist(0,4);
    return newList;
  }
}
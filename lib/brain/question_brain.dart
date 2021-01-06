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
    Question('Hat','帽子'),
  ];

  void nextQuestion() {
    if(_questionCount < _questionStorage.length - 1) {
      // increment count
      print("$_questionCount回め");
      _questionCount++;
    }
  }

  String getWordToEnglish() {
    return _questionStorage[_questionCount].englishWord;
  }

  String getWordToJapanese() {
    return _questionStorage[_questionCount].japaneseWord;
  }

  String getJapaneseWordByIndex(int index) {
    return _questionStorage[index].japaneseWord;
  }

  int getWordIndex() {
    return _questionCount;
  }

  bool isfinishedQuestion() {
    if(_questionCount == 10) {
      //finish question
      print('Finish Question');
      resetQuestion();
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
  List<int> createRandomAnswer(int getIndex) {
    //initiate list
    randomAnswer = [];
    List<int> newList = [];
    int i;

    //  create list to 0~9
    for(i = 0; i <= 9; i++) {
      // if i == index we would not add that number to list
      if(i == getIndex) {
        continue;
      }
      randomAnswer.add(i);
    }

    //shuffle list
    print(randomAnswer);
    randomAnswer.shuffle();
    print(randomAnswer);
    newList = randomAnswer.sublist(0,3);
    print(newList);

    //add correct answer
    newList.add(getIndex);

    //shuffle again
    newList.shuffle();
    return newList;
  }
}
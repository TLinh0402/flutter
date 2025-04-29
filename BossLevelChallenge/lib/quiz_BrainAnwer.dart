import 'package:iampoor/Answer.dart';

class QuizBrain_Answer {
  int answerNumber = 0;

  List<Answer> _anwerbank = [
    Answer('1', '2'),
    Answer('5', '4'),
    Answer('8', '9'),
    Answer('10', '0')
  ];

  int nextAnswer() {
    if (answerNumber < _anwerbank.length - 1) {
      return answerNumber++;
    }
    return answerNumber;
  }

  String getAnwer_A() {
    return _anwerbank[answerNumber].answerA;
  }

  String getAnwer_B() {
    return _anwerbank[answerNumber].answerB;
  }
}

import 'package:iampoor/Question.dart';

class QuizBrain {
  int questionNumber = 0;
  bool isFinish = false;

  List<Question> _quetionbank = [
    Question('1 + 1', '2'),
    Question('2+2', '4'),
    Question('5 + 4', '9'),
    Question('5 + 5', '10'),
  ];

  int nextQuestion() {
    if (questionNumber < _quetionbank.length - 1) {
      return questionNumber++;
    }
    isFinish = true;
    return questionNumber;
  }

  String getQuestionBank() {
    return _quetionbank[questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _quetionbank[questionNumber].questionAnswer;
  }

  bool addIcon() {
    return isFinish;
  }
}

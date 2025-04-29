import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iampoor/quiz_BrainAnwer.dart';
import 'package:iampoor/quiz_brain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: QuizPage())),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  late QuizBrain quizBrain = QuizBrain();
  late QuizBrain_Answer quizBrain_anwer = QuizBrain_Answer();

  int questionNumber = 0;

  void checkAnswer(String userPickerAnser) {
    String correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (!quizBrain.addIcon()) {
        if (userPickerAnser == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
        quizBrain_anwer.nextAnswer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionBank(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
            onPressed: () {
              setState(() {
                checkAnswer(quizBrain_anwer.getAnwer_A());
              });
            },
            child: Text(
              quizBrain_anwer.getAnwer_A(),
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
            onPressed: () {
              setState(() {
                checkAnswer(quizBrain_anwer.getAnwer_B());
              });
            },
            child: Text(
              quizBrain_anwer.getAnwer_B(),
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        )),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

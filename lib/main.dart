import 'package:flutter/material.dart';
import 'package:flutter_learn/result.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Reed', 'score': 6},
        {'text': 'Green', 'score': 4},
        {'text': 'White', 'score': 2},
      ],
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 7},
        {'text': 'Pussycat', 'score': 10},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor',
      'answers': [
        {'text': 'YouTube', 'score': 1},
        {'text': 'Udemy', 'score': 1},
        {'text': 'StackOverflow', 'score': 1},
        {'text': 'Quora', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print("No more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = [ 'hello'];
    // dummy.add('ivan') ;
    // print(dummy);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Learning'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

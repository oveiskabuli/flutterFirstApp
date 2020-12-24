import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {
          'text': 'black',
          'score': 10,
        },
        {
          'text': 'red',
          'score': 6,
        },
        {
          'text': 'green',
          'score': 3,
        },
        {
          'text': 'white',
          'score': 1,
        },
      ],
    },
    {
      'questionText': 'what\'s your favorite animal',
      'answers': [
        {
          'text': 'cat',
          'score': 10,
        },
        {
          'text': 'dog',
          'score': 8,
        },
        {
          'text': 'cow',
          'score': 5,
        },
        {
          'text': 'ant',
          'score': 1,
        },
      ],
    },
    {
      'questionText': 'who\'s your favorite instructor?',
      'answers': [
        {
          'text': 'she',
          'score': 10,
        },
        {
          'text': 'he',
          'score': 8,
        },
        {
          'text': 'them',
          'score': 5,
        },
        {
          'text': 'all',
          'score': 1,
        },
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Flutter App'),
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

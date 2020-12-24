import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(
    this.resultScore,
    this.resetQuiz,
  );

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'you r awesome';
    } else if (resultScore <= 12) {
      resultText = 'you r good';
    } else if (resultScore <= 16) {
      resultText = ' you r bad';
    } else {
      resultText = 'fuck u';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('restart the quiz'),
            textColor: Colors.blue,
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}

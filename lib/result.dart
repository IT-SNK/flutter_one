import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'Молодец!';
    } else if (resultScore <= 12) {
      resultText = 'Норма!';
    } else if (resultScore <= 16) {
      resultText = 'Серьезно?!';
    } else {
      resultText = 'Хуйло!';
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
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
            ),
            child: Text(
              'Перезапусти!',
            ),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}

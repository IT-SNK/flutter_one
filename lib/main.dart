import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Твой любимый цвет?',
      'answers': [
        {'text': 'Черный', 'score': 10},
        {'text': 'Красный', 'score': 5},
        {'text': 'Зеленый', 'score': 3},
        {'text': 'Белый', 'score': 1},
      ],
    },
    {
      'questionText': 'Твой любое животное?',
      'answers': [
        {'text': 'Заяц', 'score': 3},
        {'text': 'Змея', 'score': 11},
        {'text': 'Слон', 'score': 5},
        {'text': 'Лев', 'score': 9},
      ],
    },
    {
      'questionText': 'Твой любимый фильм?',
      'answers': [
        {'text': 'Игра разума', 'score': 1},
        {'text': 'Форест Гамп', 'score': 1},
        {'text': 'Зеленая милья', 'score': 1},
        {'text': 'Пила', 'score': 1},
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
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
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

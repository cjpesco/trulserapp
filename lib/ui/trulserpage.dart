import 'package:flutter/material.dart';
import 'package:trulserapp/model/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain _quizBrain = QuizBrain();

class TrulserPage extends StatefulWidget {
  @override
  _TrulserPageState createState() => _TrulserPageState();
}

class _TrulserPageState extends State<TrulserPage> {
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                '${_quizBrain.getQuestionText()}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        _buildExpbuttons(
            userChoice: true,
            labelChoice: 'TRUE',
            buttonColor: Colors.greenAccent.shade400),
        _buildExpbuttons(
            userChoice: false,
            labelChoice: 'FALSE',
            buttonColor: Colors.redAccent.shade400),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }

  Expanded _buildExpbuttons(
      {bool userChoice, String labelChoice, Color buttonColor}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: ElevatedButton(
          onPressed: () => _checkAnswer(userChoice),
          child: Text('$labelChoice'),
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
          ),
        ),
      ),
    );
  }

  void _checkAnswer(bool userChoice) {
    setState(() {
      if (!_quizBrain.getIsQuizFinish()) {
        if (userChoice == _quizBrain.getCorrectAnswer()) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));

          _nextQuestion();
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          _nextQuestion();
        }
      } else {
        Alert(
          context: context,
          type: AlertType.success,
          title: "CONGRATULATIONS! QUIZ IS OVER",
          desc: "Would you like to restart the quiz?",
          buttons: [
            DialogButton(
              child: Text(
                "TRY AGAIN",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                _resetQuestion();
                Navigator.pop(context);
              },
              width: 120,
            )
          ],
        ).show();
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _quizBrain.nextQuestion();
    });
  }

  void _resetQuestion() {
    setState(() {
      _quizBrain.resetQuiz();
      scoreKeeper.clear();
    });
  }
}

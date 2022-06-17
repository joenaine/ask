import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:teaching_app/game4/resultScreen.dart';

import 'game4QuestionBrain.dart';

class Game4 extends StatefulWidget {
  final QuestionsBrain questionsBrain = QuestionsBrain();
  @override
  _Game4State createState() => _Game4State();
}

class _Game4State extends State<Game4> {
  final List<Widget> score = [];
  int total = 0;

  void addOkCheck() {
    score.add(
      const Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  }

  void addWrongMark() {
    score.add(
      const Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }

  void checkAnswer(String buttonValue) {
    widget.questionsBrain.showNextQuestion();

    if (widget.questionsBrain.checkEndOfList()) {
      showAlert();
    }
  }

  void showAlert() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ResultScreen(),
    ));
  }

  Widget _createCustomButton(
    Color color,
    String variant,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: RaisedButton(
        color: color,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          variant,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.grey[300]),
        ),
        onPressed: () {
          setState(() => checkAnswer(variant));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Вопрос ' '${widget.questionsBrain.indexOfQuest + 1}',
          style: const TextStyle(color: Colors.black, fontSize: 22),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _createCustomButton(
              Colors.black54, widget.questionsBrain.getQuestionVariant1()),
          _createCustomButton(
              Colors.black54, widget.questionsBrain.getAnswerOfVariant2()),
          score.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.only(
                      left: 16.0, bottom: 16.0, top: 8.0, right: 16.0),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: score,
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                ),
        ],
      ),
    );
  }
}

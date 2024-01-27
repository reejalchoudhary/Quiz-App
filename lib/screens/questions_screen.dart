import 'package:flutter/material.dart';
import 'package:reejal/models/answer_button.dart';
import 'package:reejal/models/data/questions.dart';

class Questions_Screen extends StatefulWidget {
  const Questions_Screen({required this.onSelectAnswer, super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<Questions_Screen> createState() => _Questions_ScreenState();
}

class _Questions_ScreenState extends State<Questions_Screen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: TextStyle(color: Colors.white, fontSize: 26.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.0,
            ),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return Answer_Button(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

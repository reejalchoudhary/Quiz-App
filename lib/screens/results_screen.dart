import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reejal/models/data/questions.dart';
import 'package:reejal/models/questions_summary.dart';

class Results_Screen extends StatelessWidget {
  const Results_Screen(
      {required this.chosenAnswers, super.key, required this.onRestart, required List<String> chosenAnswer});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 230, 200, 253),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.0,
              ),
              Questions_Summary(summaryData: summaryData),
              SizedBox(
                height: 30.0,
              ),
              OutlinedButton(
                onPressed: onRestart,
                child: Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

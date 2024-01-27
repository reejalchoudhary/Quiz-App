import 'package:flutter/material.dart';

class Questions_Summary extends StatelessWidget {
  const Questions_Summary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(data['user_answer'] as String),
                      SizedBox(
                        height: 5.0,
                      ),
                      //Text(data['correct_answer'] as String),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

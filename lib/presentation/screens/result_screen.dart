// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quizapp/data/database/quiz_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.userAnswers,
    required this.quizRestart,
  });

  final List<String> userAnswers;
  final void Function() quizRestart;

  List<Map<String, Object>> getSummery() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < userAnswers.length; i++) {
      summary.add({
        'index': i,
        'Question': quizData[i].question,
        'user_ans': userAnswers[i],
        'correct_ans': quizData[i].listOption[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummery();
    int score = summeryData
        .where(
          (element) => element['user_ans'] == element['correct_ans'],
        )
        .length;
    return Container(
      padding: EdgeInsets.all(15),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You have correctly answer $score out of ${quizData.length}",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: summeryData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundColor:
                          summeryData[index]['user_ans'].toString() ==
                                  summeryData[index]['correct_ans']
                              ? Colors.green
                              : Colors.red,
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      summeryData[index]['Question'].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your answer:  ${summeryData[index]['user_ans'].toString()}",
                          style: TextStyle(
                              color:
                                  summeryData[index]['user_ans'].toString() ==
                                          summeryData[index]['correct_ans']
                                      ? Colors.green
                                      : Colors.red,
                              fontSize: 19),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "Correct Answer:  ${summeryData[index]['correct_ans'].toString()}",
                          style: TextStyle(fontSize: 19, color: Colors.green),
                        )
                      ],
                    ),
                  );
                }),
          ),
          OutlinedButton.icon(
            onPressed: quizRestart,
            icon: Icon(Icons.restart_alt_outlined),
            label: Text(
              "Restart Quiz",
            ),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          ),
        ],
      ),
    );
  }
}

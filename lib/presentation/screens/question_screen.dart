// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quizapp/data/database/quiz_data.dart';
import 'package:quizapp/presentation/widgets/option.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onOptionSelected,
  });

  final void Function(String) onOptionSelected;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;

  void _onTapSelected(String answer){
    widget.onOptionSelected(answer);
    currentIndex++;
    if(currentIndex==quizData.length){
      currentIndex=0;
    }
    setState(() {
      
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container( padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              quizData[currentIndex].question,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
            ),
            SizedBox(
              height: 35,
            ),
            ...quizData[currentIndex].suffeldFunction.map(
                (options) => Option(optionParameter: options, onTap: (){
                  _onTapSelected(options);
                })),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

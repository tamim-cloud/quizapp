import 'package:flutter/material.dart';
import 'package:quizapp/data/database/quiz_data.dart';
import 'package:quizapp/presentation/screens/home_screen.dart';
import 'package:quizapp/presentation/screens/question_screen.dart';
import 'package:quizapp/presentation/screens/result_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Widget? currentScreen;

  List<String> userAnswer=[];

  void switchScreen() {
    setState(() {
      currentScreen = QuestionScreen(onOptionSelected: _addAnswer,);
    });
  }

  void restartQuizFunction(){
    userAnswer.clear();
    currentScreen=HomeScreen(startQuize: switchScreen);
    setState(() {
      
    });
  }

  void _addAnswer(String answer){
    userAnswer.add(answer);
    if(userAnswer.length==quizData.length){
      currentScreen=ResultScreen(userAnswers: userAnswer,
      quizRestart: restartQuizFunction,
      );
      setState(() {
        
      });
    }
  }

  @override
  void initState() {
    currentScreen = HomeScreen(startQuize: switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.lightBlueAccent]),
            ),
          ),
          title: Text("Quiz App"),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.deepPurple, const Color.fromARGB(255, 100, 21, 114)]),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}

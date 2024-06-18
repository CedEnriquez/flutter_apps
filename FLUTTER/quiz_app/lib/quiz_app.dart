import 'package:flutter/material.dart';
import 'package:quiz_app/data/questiondata.dart';
import 'package:quiz_app/pages/initialpage.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/pages/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key, });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'font-page';

  void switchScreen() {
    setState(() {
      activeScreen = 'qustion-page';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-page';
      });
    }
  }

  void restartApp() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'qustion-page';
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 109, 17, 126),
                Color.fromARGB(255, 63, 0, 78)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'font-page'
              ? FrontPage(switchScreen)
              : activeScreen == 'results-page'
                  ? ResultsScreen(selectedAnswers, restartApp)
                  : QuestionsContainer(chooseAnswer),
        ),
      ),
    );
  }
}

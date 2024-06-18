import 'package:flutter/material.dart';
import 'package:quiz_app/data/questiondata.dart';
import 'package:quiz_app/pages/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chooseAnswer,this.restartApp, {super.key});
  final List<String> chooseAnswer;
  final Function() restartApp;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].questions,
          'correct_answer': questions[i].answers[0],
          'user_answer': chooseAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData=getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestions=summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];

    }).length;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('You answered $numCorrectQuestions out of $numTotalQuestions correctly!',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData),
          const SizedBox(
            height: 30,
          ),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              const Icon(Icons.restart_alt_rounded,color: Colors.white,),
              TextButton(
                
                onPressed: restartApp,
                child: const Text("Restart Quiz",style: TextStyle(color: Colors.white),),
              ),
            ],
          )
        ],
        
      ),
    );
  }
}

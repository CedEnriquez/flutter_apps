import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widget.dart';
import 'package:quiz_app/data/questiondata.dart';

class QuestionsContainer extends StatefulWidget {
  const QuestionsContainer(this.onSelectAnswer,{super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsContainer> createState() => _QuestionsContainerState();
}

class _QuestionsContainerState extends State<QuestionsContainer> {
  int currentPageIndex=0;
  
  void answersQuestion(selectedAnswers){
    setState(() {
      widget.onSelectAnswer(selectedAnswers);
      currentPageIndex ++;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[currentPageIndex];

    return Center(
        child: Container(
          
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentquestion.questions,
            style: 
            GoogleFonts.lato(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
              
            ),
            textAlign: TextAlign.center,
            ),
            
          
          const SizedBox(
            height: 24,
          ),
          ...currentquestion.shuffledAnswers().map((answers) {
            return AnswerButton(
              answers,
              (){
                answersQuestion(answers);
              },
            );
          })
        ],
      ),
    ));
  }
}

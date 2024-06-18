import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class FrontPage extends StatelessWidget {
  const FrontPage(this.switchScreen,{super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
    
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: const Color.fromARGB(155, 255, 255, 255),
            width: 400,
          ),
          const SizedBox(
            height: 64,
          ),
           Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 255, 255, 255),fontSize:28 )
           ),
          const SizedBox(
            height: 44,
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_forward),
              onPressed: switchScreen,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                foregroundColor: const Color.fromARGB(255, 45, 0, 90),
                
              ),
              label: const Text(
                "Start Quiz",style: TextStyle(fontSize: 18),
                
              ))
        ],
      ),
    );
  }
}
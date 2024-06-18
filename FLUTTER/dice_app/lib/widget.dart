import 'dart:math';

import 'package:flutter/material.dart';

var randomizer=Random();

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.gradStart, this.gradEnd, {super.key});

  final Color gradStart;
  final Color gradEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradStart, gradEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: DiceRoll(),
      ),
    );
  }
}

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  var activeDice = 'lib/assets/images/dice-1.png';

  var currentPage=1;

  void rollDice() {
    setState(() {
      
      currentPage = randomizer.nextInt(6) + 1;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'lib/assets/images/dice-$currentPage.png',
          width: 200,
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed:  rollDice,
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 250, 75, 31),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              textStyle: const TextStyle(fontSize: 24)),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}

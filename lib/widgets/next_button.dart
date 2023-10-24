import 'package:app_quiz/constants.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.nextQuestion}) : super(key:key);
  final VoidCallback nextQuestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          
          
          borderRadius: BorderRadius.circular(10.0),

          // Adicionando Shawdow no box do botao (Next Question)
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical:10.0),
        child: const Text(
          'Next Question',
          textAlign: TextAlign.center,
           style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
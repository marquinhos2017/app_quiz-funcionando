
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key:key);


  @override
  Widget build(BuildContext context) {
    return Container(
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
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical:10.0),
      child: const Text(
        'Next Question',
        textAlign: TextAlign.center,
         style: TextStyle(color: Colors.white),
      ),
    );
  }
}
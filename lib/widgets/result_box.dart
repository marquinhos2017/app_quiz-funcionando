import 'package:app_quiz/constants.dart';
import 'package:flutter/material.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key?key,
    required this.result,
    required this.questionLength,})
     : super(key: key);

     final int result;
     final int questionLength;

  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(padding: const EdgeInsets.all(70.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Result',
            style: TextStyle(color: neutral, fontSize: 22.0),
          ),
          const SizedBox(height:20.0), CircleAvatar(
            
            radius:70.0,
            backgroundColor: result == questionLength / 2
              ? Colors.yellow
              : result < questionLength/2 
              ? incorrect 
              : correct,
              child: Text(
              '$result/$questionLength',
              style: const TextStyle(fontSize: 26.0,)  
            ), 
          ),
          const SizedBox(height: 20.0,),
          Text(result == questionLength / 2
              ? 'Almost'
              : result < questionLength/2 
                ? 'Errou Feio'
                : 'Parabens', style: const TextStyle(color: neutral),),
        ],
      )
      )
    );
  }
}
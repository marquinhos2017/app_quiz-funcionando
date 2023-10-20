
import 'package:app_quiz/constants.dart';
import 'package:flutter/material.dart';

// widget: Question(index,question)
class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
    {Key? key, 
    required this.question, 
    required this.indexAction, 
    required this.totalQuestions}) 
    : super(key: key);

    final String question;
    final int indexAction;
    final int totalQuestions;

  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Pergunta ${indexAction + 1}/$totalQuestions: $question', 
        style: const TextStyle(
          fontSize: 20.0,
          fontFamily: 'Montserrat',
          fontStyle: FontStyle.normal, 
          color: Colors.black,
          fontWeight: FontWeight.w700,
          
          )),
      
        
        

    );
  }
}


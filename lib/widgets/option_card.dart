import 'package:app_quiz/constants.dart';
import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({Key?key,required this.option, required this.color}) 
    : super(key:key);
  final String option;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: SizedBox(
        
        height: 70,

        child: Center(
          child: ListTile(

          
            title:  Text(
              option,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Montserrat',
                fontStyle: FontStyle.normal, 
                fontWeight: FontWeight.w400,
                color: color.red != color.green ? neutral : Colors.black,
              ),
            ),
          ),
        )
      ),
      
      
    );
  }
}
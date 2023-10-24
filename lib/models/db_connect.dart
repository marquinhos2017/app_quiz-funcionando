import 'dart:convert';

import 'package:app_quiz/models/question_model.dart';
import 'package:http/http.dart' as http;

class DBconnect{
  final url = Uri.parse(('https://appqi-7ca20-default-rtdb.firebaseio.com/questions.json'));

  Future<void> addQuestion(Question question) async{
    http.post(url,
      body: json.encode({
        'title' : question.title,
        'options' : question.options,
      })
    );
    
  }
}
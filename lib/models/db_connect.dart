import 'dart:convert';

import 'package:app_quiz/models/question_model.dart';
import 'package:http/http.dart' as http;

class DBconnect{
  final url = Uri.parse(('https://console.firebase.google.com/u/0/project/appqi-7ca20/database/appqi-7ca20-default-rtdb/data/~2F'));

  Future<void> addQuestion(Question question) async{
    http.post(url,
      body: json.encode({
        'title' : question.title,
        'options' : question.options,
      })
    );
    
  }
}
import 'package:app_quiz/constants.dart';
import 'package:app_quiz/models/db_connect.dart';
import 'package:app_quiz/models/question_model.dart';
import 'package:app_quiz/widgets/next_button.dart';
import 'package:app_quiz/widgets/option_card.dart';
import 'package:app_quiz/widgets/question_widget.dart';
import 'package:app_quiz/widgets/result_box.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var db = DBconnect();

  late Future _questions;
  Future<List<Question>> getData() async {
    return db.fetchQuestios();
  }

  @override
  void initState(){
    _questions = getData();
    super.initState();
  }

  int index = 0; // Variavel responsavel por armazenar o valor do index das questoes

  int score = 0; // Variavel responsavel por armazenar o score

  bool isPressed = false;
  bool isAlreadySelected = false;

  bool acertou = false;

  void nextQuestion(int questionLength){
    if(index == questionLength - 1){

      showDialog(
        context: context, 
        barrierDismissible: false,
        builder: (ctx) => ResultBox(result: score, questionLength: questionLength,));
    }else{
      if(isPressed){
        setState(() {
        index++;
        isPressed = false;
        isAlreadySelected = false;
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: const Text('Please select any option'), 
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
        
    }
      
    }
    
  }

  void checkAnswerAndUpdate(bool value){
    if(isAlreadySelected){
      return;
    }else{
      if(value == true){
        score++;
        print('acertou');
     
        setState(() {
          isPressed = true;
          isAlreadySelected = true;
        });
      }else{
        setState(() {
           print('errou');
          isPressed = true;
          isAlreadySelected = true;
        });
      }
    
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(child: Text('${snapshot.error}'),);
          }else if(snapshot.hasData){
            var extractedData = snapshot.data as List<Question>;
            return  Scaffold(
    
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text('Quiz App'),
                backgroundColor: Colors.black,
                shadowColor: Colors.transparent,
          
                
          
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20), 
                    child: Center(child: Text(
                      'Score: $score', 
                      style: const TextStyle(
                        color: Colors.white, 
                        fontSize: 18.0,
                        //fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.normal, 
                        //color: Colors.black,
                        fontWeight: FontWeight.w700,
          
                      ),
                    )
                    )
                  ,)
                ],
              ),
              body:Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: Column(
                  children: [
                    QuestionWidget(
                      indexAction: index,
                      question: extractedData[index].title,
                      totalQuestions: extractedData.length,
                    ),
                    const Divider(color: neutral,),
                    const SizedBox(height: 25.0),
                    for(int i=0;i<extractedData[index].options.length;i++)
          
                      GestureDetector(
                        onTap: () => checkAnswerAndUpdate(extractedData[index].options.values.toList()[i]),
                        child: OptionCard(
                          option: extractedData[index].options.keys.toList()[i],
                          color: 
                          
                            isPressed ?  //Clicou em algum item ?
                              extractedData[index].options.values.toList()[i]  == true  // Valor da resposta e correta ?
                              ? correct // Cor Verde
                                : incorrect  // COr Vermelha
                            : neutral, // Caso nao clicou, a cor sera branca
          
                        )
                      )
                      
                  ],
                ),
              ),
          
              
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: NextButton(
                  ),
                ),
              ),
              floatingActionButtonLocation: 
                FloatingActionButtonLocation.centerFloat,
            );
          }
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Center(
          child: Text('No data'),
        );
      },
    
    );

  }
}
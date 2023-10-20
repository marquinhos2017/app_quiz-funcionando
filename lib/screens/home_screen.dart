import 'package:app_quiz/constants.dart';
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

  List<Question> _questions = [ // Criando a Lista de Questoes
    Question( // Objeto Question e adicionando os valores ao objeto criado
      id: '1', 
      title: 'This sign means that you:', 
      options: {
        'You cannot park, but you can stop to discharge passengers.':false,
        'You cannot park, but you can stop there if you stay in the vehicle.':false,
        'You cannot park, stop, or stand there.':true,
        'None of these.':false}
    ,),
    Question(
      id: '2', 
      title: 'Demerit points are added to your driver record when you are convicted of a traffic violation. How many points accumulated in a 12 month period will result in suspension ', 
      options: {
        '12':true,
        '10':false,
        '8':false,
        '6':false}
    ,),
    Question(
      id: '3', 
      title: 'An orange triangle with red borders like this sign means:', 
      options: {
        'Slow moving vehicle.':true,
        'Detour.':false,
        'Work zone.':false,
        'Yield.':false}
    ,)
  ];

  int index = 0; // Variavel responsavel por armazenar o valor do index das questoes

  int score = 0; // Variavel responsavel por armazenar o score

  bool isPressed = false;
  bool isAlreadySelected = false;

  bool acertou = false;

  void nextQuestion(){
    if(index == _questions.length - 1){

      showDialog(
        context: context, 
        barrierDismissible: false,
        builder: (ctx) => ResultBox(result: score, questionLength: _questions.length,));
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
          isPressed = true;
          isAlreadySelected = true;
        });
      }
    
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
            ))
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
              question: _questions[index].title,
              totalQuestions: _questions.length,
              ),
              const Divider(color: neutral,),
              const SizedBox(height: 25.0),
              for(int i=0;i<_questions[index].options.length;i++)

                GestureDetector(
                  onTap: () => checkAnswerAndUpdate(_questions[index].options.values.toList()[i]),
                  child: OptionCard(
                    option: _questions[index].options.keys.toList()[i],
                    color: 
                    
                      isPressed ?  //Clicou em algum item ?
                        _questions[index].options.values.toList()[i]  == true  // Valor da resposta e correta ?
                        ? correct // Cor Verde
                         : incorrect  // COr Vermelha
                      : neutral, // Caso nao clicou, a cor sera branca

                ))],
        ),
      ),

      
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion, 
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      

      );

  }
}
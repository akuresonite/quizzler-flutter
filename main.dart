import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main()=> runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
        backgroundColor: Colors.grey.shade900,
         body: QuizPage(),
       ),
    );
  }
}


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getQuestionAnswer();
            
    setState(() {
      //Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quizBrain.isFinished() == true) {
        //Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        Alert(
      context: context,
      type: AlertType.success,
      title: "Finshed!",
      desc: "You\'ve reached the end of the quiz.",
      buttons: [
        DialogButton(
          child: Text(
            "Restart the Quiz",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 180,
        )
      ],
    ).show();

        //Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
      }

      //Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextquestion();
      }
    });
              
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
            child: Container(
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold,
                  ),
                  ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.green,
              child: Text('True',
                        style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
               ),
              ),
              onPressed: (){
                checkAnswer(true);
              },
              ),
          ),
        ),
        Expanded(
          flex: 2,
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.red,
              child: Text('False',
                      style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
             ),
            ),
              onPressed:(){
                checkAnswer(false);
              },
          ),
        ),
        ),
        Expanded(
          //padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],  
    );
  }
}
import 'package:quizzler/question.dart';

int _questionNum =0;
class QuizBrain {
  List<Question> _questionBank = [
        Question('Capitial of India is Mumbai.',false),
        Question('Capital of Madhya Pradesh is Bhopal.',true),
        Question('There are 206 bones in adult human body.',true),
        Question('Sun is a planet.',false),
        Question('Morena is a state.',false),
        Question('Delhi is a state',false),
        Question('There are 7 colors in he Rainbow',true),
        Question('6 O\'clock in the evening is written as 6am',false),
        Question('There are 23 letters in the English alphabet',false),
        Question('Pakistan and India are neighbouring countries.',true),
        Question('An average human heart will have beat approximately 1.5 billion times when it reaches the age of 66 years.',false),
        Question('Earthworms breathe through their skin.',true),
        Question('It is illegal to pee in the Ocean in Portugal.', true),
        Question('Some cats are actually allergic to humans', true),
        Question('Approximately one quarter of human bones are in the feet.', true),
  ];

  void nextquestion(){
    if(_questionNum < _questionBank.length){
      _questionNum++;
    }
  }
  String getQuestionText(){
    return _questionBank[_questionNum].questionText;
  }
    bool getQuestionAnswer(){
    return _questionBank[_questionNum].questionAnswer;
  }
  //Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  bool isFinished(){
    if(_questionNum >= _questionBank.length-1){
      //Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.
      print('Now return true');
      return true;
    }
    else{
      return false;
    }
    
  }
  //Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
   void reset(){
     _questionNum = 0;
   }
}
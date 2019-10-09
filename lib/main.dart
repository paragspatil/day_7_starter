import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:day_5_starter/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() {
  runApp(Quizlr());
}

class Quizlr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: QuizPage()
        ));
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  Quizbrain brain = Quizbrain();

  bool checkiflastquestion(){
    return brain.QuetionNumber == brain.quetions.length-1;
  }
  int correctans = 0;
  void checkAnswer(bool userAnswer) {

    int wrongans = 0;
    setState(() {
      if (userAnswer == brain.quetions[brain.QuetionNumber].answer) {
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
      if(checkiflastquestion()) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "RFLUTTER ALERT",
          desc: "Wr are all out of questions for you",
          buttons: [
            DialogButton(
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                int i=0;
                for(i=0;i<brain.quetions.length;i++) {
                  scoreKeeper.removeLast();
                }
                brain.QuetionNumber = 0;
              },
              width: 120,
            ),
            DialogButton(
              child: Text(
                "Close",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],

        ).show();

      }
      else {
        brain.nextquetion();
      }
//      else{if(checkiflastquestion()){
//
//        }
//      }
    }
      );
    }

 void restart(){
    brain.QuetionNumber = 0;
 }
  @override
  Widget build(BuildContext context) {


        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    brain.quetions[brain.QuetionNumber].quetion,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      'True',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(true);

                    }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        );

  }
}
//_onAlertButtonPressed(context) {



// Sample Questions and Answers
// Q.1 Amartya Sen was awarded the Nobel prize for his contribution to Welfare Economics., true
// Q.2 The Headquarters of the Southern Naval Command of the India Navy is located at Thiruvananthapuram., false
// Q.3 There are 4 sessions of the Parliament each year: Spring, Summer, Autumn and Winter., false
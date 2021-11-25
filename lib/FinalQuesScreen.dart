import 'dart:core';
import 'package:flutter/material.dart';
import 'package:quizzes_application/QuestionStore.dart';
import 'package:quizzes_application/Styling.dart';

import 'ScoreCard.dart';
class FinalQuesScreen extends StatefulWidget {
  //const FinalQuesScreen({Key? key}) : super(key: key);
  int quesNo;
  QuestionBank obj;
  FinalQuesScreen(this.quesNo,this.obj);

  @override
  _FinalQuesScreenState createState() => _FinalQuesScreenState(quesNo,obj);
}

class _FinalQuesScreenState extends State<FinalQuesScreen> {

  int quesNo;
  QuestionBank obj;
  _FinalQuesScreenState(this.quesNo,this.obj);
  Styling sObj = Styling();

  double wrongScorePer = 0.0;
  double wrongAnsPer = 0.0;
  double correctScorePer = 0.0;
  double correctAnsPer = 0.0;

  int totalScore = 0;
  int correctAns = 0;
  int wrongAns = 0;
  int round = 0;


  void initState(){
    super.initState();
    obj.setLastIndex(quesNo);
  }

  void checkAns(String cA,String sA){
    int res = cA.compareTo(sA);
    if(res==0){
      totalScore++;
      correctAns++;
      correctScorePer= (correctAns/10 )*100;
      correctAnsPer = (correctAns/10);
      //ques.iconList.add(right);
    }else{
      wrongAns++;
      wrongScorePer = (wrongAns/10)*100;
      wrongAnsPer = (wrongAns/10);
      //ques.iconList.add(wrong);
    }
    round++;
    //changeCol(res);
  }

  void clear(){
    //res = Colors.white;
    //name = '';
    wrongScorePer = 0.0;
    wrongAnsPer = 0.0;
    correctScorePer = 0.0;
    correctAnsPer = 0.0;
    round = 0;
    totalScore = 0;
    correctAns = 0;
    wrongAns = 0;
  }


  Widget button(String listChoice,Color val){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: getColor(Colors.white,Colors.teal),
          ),
          child: sObj.texts('${obj.getChoice(listChoice)}',20.0,'Urchin',Colors.black),
          onPressed: (){
            setState(() {
              checkAns('${obj.getCorrAns()}','${obj.getChoice(listChoice)}');
              obj.update();
              if(round==quesNo){
                Alert(context,correctAns,wrongAns);
              }
            });
          },
        ),
      ),
    );
  }
  MaterialStateProperty<Color> getColor(Color color,Color colorPressed){
    final getColor = (Set<MaterialState> states){
      if(states.contains(MaterialState.pressed)){
        return colorPressed;
      }else{
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 25,),
          onPressed: (){
            setState(() {
              obj.clearQuesAns();
              Navigator.of(context).pop();
            });
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(//questions
                  child: sObj.texts('${obj.quesIndex}.${obj.getQues()}',20.0,'Urchin',Colors.black),
                ),
              ),
            ),
            button('list1',Colors.white),
            button('list2',Colors.white),
            button('list3',Colors.white),
            button('list4',Colors.white),
          ],
        ),
      ),
    );
  }

  String resultMaker(){
    String results = '';
    if(totalScore >=8){
      results = 'OutStanding Performance!';
    }
    else if(totalScore < 8 && totalScore >=7){
      results = 'Good Performance!';
    }
    else if(totalScore <7 && totalScore >=5){
      results = 'Average Performance';
    }
    else{
      results = 'Try Again!';
    }
    return results;
  }
  void Alert(BuildContext context,int Cscore,int Wscore){
    var pop = AlertDialog(
      title: Text('Quiz Over!',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'Uchen'),),
      content:Text('Congrats User!\nCorrect Ans : $Cscore\nWrong Ans : $Wscore'),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text('Back'),
              onPressed: (){
                setState(() {
                  clear();
                  Navigator.of(context).pop();
                });
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: (){
                setState(() {
                  double WrongScorePer = wrongScorePer;
                  double WrongAnsPer = wrongAnsPer;
                  double CorrectScorePer = correctScorePer;
                  double CorrectAnsPer = correctAnsPer;
                  int TotalScore = totalScore;
                  int CorrectAns = correctAns;
                  int WrongAns = wrongAns;
                  String Results = resultMaker();
                  clear();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScoreCard(quesNo,WrongScorePer,WrongAnsPer,CorrectScorePer,CorrectAnsPer,TotalScore,CorrectAns,WrongAns,Results,obj)));
                });
              },
            ),
          ],
        ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context)=>pop,barrierDismissible: false);
  }
}

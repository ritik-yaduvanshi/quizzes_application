import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quizzes_application/HomePage.dart';

import 'QuestionStore.dart';
import 'Styling.dart';


class ScoreCard extends StatefulWidget {
  int totalQues = 0;
  double wrongScorePer = 0.0;
  double wrongAnsPer = 0.0;
  double correctScorePer = 0.0;
  double correctAnsPer = 0.0;

  int totalScore = 0;
  int correctAns = 0;
  int wrongAns = 0;

  String results = '';
  QuestionBank obj;

  ScoreCard(this.totalQues,this.wrongScorePer,this.wrongAnsPer,this.correctScorePer,this.correctAnsPer,this.totalScore,this.correctAns,this.wrongAns,this.results,this.obj);

  @override
  _ScoreCardState createState() => _ScoreCardState(totalQues,wrongScorePer,wrongAnsPer,correctScorePer,correctAnsPer,totalScore,correctAns,wrongAns,results,obj);
}

class _ScoreCardState extends State<ScoreCard> {
  QuestionBank obj;
  Styling styles = Styling();
  int totalQues = 0;
  double wrongScorePer = 0.0;
  double wrongAnsPer = 0.0;
  double correctScorePer = 0.0;
  double correctAnsPer = 0.0;
  int totalScore = 0;
  int correctAns = 0;
  int wrongAns = 0;

  Sub objj = Sub();

  String results = '';
  _ScoreCardState(this.totalQues,this.wrongScorePer,this.wrongAnsPer,this.correctScorePer,this.correctAnsPer,this.totalScore,this.correctAns,this.wrongAns,this.results,this.obj);

  Widget QuesView(){
    var CQuesList = ListView.builder(itemCount: totalQues,itemBuilder: (BuildContext context, int index)
    {return ListTile(
      title: Text('${index+1}. ${obj.getQuestions(index)},',style: TextStyle(color: Colors.white),),
      subtitle: Text('Answer : ${obj.getCorrAnswers(index)}',style: TextStyle(color: Colors.white),),
    );},
    );
    return CQuesList;
  }
  void clear(){
    wrongScorePer = 0.0;
    wrongAnsPer = 0.0;
    correctScorePer = 0.0;
    correctAnsPer = 0.0;
    totalScore = 0;
    correctAns = 0;
    wrongAns = 0;

    results = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Score Card'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          onPressed: (){
            setState(() {
              clear();
              Navigator.of(context).pop();
            });
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            styles.texts('Question Review',20.0,'Uchen',Colors.white),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 300.0,
                width: 380.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.black38,
                ),
                child: QuesView(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child:Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 200.0,
                      width: 380.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black,
                      ),
                      child: CircularPercentIndicator(
                        radius: 100.0,
                        percent: correctAnsPer,
                        progressColor: Colors.green,
                        lineWidth: 12.0,
                        animation: true,
                        center: styles.texts('$correctScorePer%',20.0,'Urchin',Colors.green),
                        footer: styles.texts('Correct Ans',15.0,'Urchin', Colors.white),
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 200.0,
                      width: 380.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black,
                      ),
                      child: CircularPercentIndicator(
                        radius: 100.0,
                        percent: wrongAnsPer,
                        progressColor: Colors.red,
                        lineWidth: 12.0,
                        animation: true,
                        center: styles.texts('$wrongScorePer%',20.0,'Uchen',Colors.red),
                        footer: styles.texts('Wrong Ans',15.0,'uchen', Colors.white),
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 200.0,
                width: 380.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.black,
                ),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      styles.texts('Performance Report',18,'Uchen',Colors.white),
                      SizedBox(child: Divider(height: 5.0,color: Colors.white,),),
                      styles.texts('Name : ${objj.getUserName()}',14.0,'Uchen',Colors.white),
                      styles.texts('Quiz Subject : ${objj.getSubName()}',14.0,'Uchen',Colors.white),
                      styles.texts('Total Score : $totalScore',14.0,'Uchen',Colors.white),
                      styles.texts('Correct Ans :  $correctAns',14.0,'Uchen',Colors.white),
                      styles.texts('Wrong Ans : $wrongAns',14.0,'Uchen',Colors.white),
                      styles.texts('Result : $results',14.0,'Uchen',Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
class VerbalPage extends StatefulWidget {
  const VerbalPage({Key? key}) : super(key: key);

  @override
  _VerbalPageState createState() => _VerbalPageState();
}

class _VerbalPageState extends State<VerbalPage> {

  static double heights=0.0;
  static double widths=0.0;

  Widget selectChoice(int index,String topics){
    return Container(
      height: heights,
      width: widths,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white,Colors.green,Colors.white],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
        //color: Colors.redAccent,
      ),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Text('$index.',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
          Text('$topics',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    double conHeight = MediaQuery.of(context).size.height*.05;
    heights = conHeight;
    double conWidth = MediaQuery.of(context).size.width*.7;
    widths = conWidth;

    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Verbal Aptitude'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15,),
                selectChoice(1,'Reading Comprehensions'),
                SizedBox(height: 15,),
                selectChoice(2,'Cloze Test'),
                SizedBox(height: 15,),
                selectChoice(3,'Fill in the Blanks'),
                SizedBox(height: 15,),
                selectChoice(4,'Error Detection'),
                SizedBox(height: 15,),
                selectChoice(5,'Jumbled word/Paragraphs'),
                SizedBox(height: 15,),
                selectChoice(6,'Vocabulary & Grammar'),
                SizedBox(height: 15,),
                selectChoice(7,'One Word Substitution'),
                SizedBox(height: 15,),
                selectChoice(8,'Idioms & Phrases'),
                SizedBox(height: 15,),
                selectChoice(9,'Antonyms & Synonyms'),
                SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

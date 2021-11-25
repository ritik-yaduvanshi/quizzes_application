import 'package:flutter/material.dart';
import 'package:quizzes_application/Styling.dart';
class JavaScreen extends StatefulWidget {
  const JavaScreen({Key? key}) : super(key: key);

  @override
  _JavaScreenState createState() => _JavaScreenState();
}

class _JavaScreenState extends State<JavaScreen> {

  static double heights=0.0;
  static double widths=0.0;

  Widget selectChoice(int index,String topics){
    return Container(
      height: heights,
      width: widths,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white,Colors.orangeAccent,Colors.white],
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
    double conHeights = MediaQuery.of(context).size.height*.05;
    heights = conHeights;
    double conWidths = MediaQuery.of(context).size.width*0.7;
    widths = conWidths;
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text('Java'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15,),
                GestureDetector(
                    child: selectChoice(1, 'Introduction Of Basic Java'),
                  onTap: (){
                      //To Do
                  },
                ),
                SizedBox(height: 15,),
                selectChoice(2, 'OOP Concept'),
                SizedBox(height: 15,),
                selectChoice(3, 'String Handling'),
                SizedBox(height: 15,),
                selectChoice(4, 'Collection Framework'),
                SizedBox(height: 15,),
                selectChoice(5, 'Multithreading'),
                SizedBox(height: 15,),
                selectChoice(6, 'Exception Handling'),
                SizedBox(height: 15,),
                selectChoice(7, 'Generics'),
                SizedBox(height: 15,),
                selectChoice(8, 'Synchronisation'),
                SizedBox(height: 15,),
                selectChoice(9, 'JDBC'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

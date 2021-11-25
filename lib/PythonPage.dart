import 'package:flutter/material.dart';
class PythonPage extends StatefulWidget {
  const PythonPage({Key? key}) : super(key: key);

  @override
  _PythonPageState createState() => _PythonPageState();
}

class _PythonPageState extends State<PythonPage> {
  static double heights=0.0;
  static double widths=0.0;

  Widget selectChoice(int index,String topics){
    return Container(
      height: heights,
      width: widths,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white,Colors.pink,Colors.white],
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
        title: Text('Python'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15,),
                GestureDetector(
                  child: selectChoice(1, 'Python Intro'),
                  onTap: (){
                    //To Do
                  },
                ),
                SizedBox(height: 15,),
                selectChoice(2, 'Data Types'),
                SizedBox(height: 15,),
                selectChoice(3, 'Operators'),
                SizedBox(height: 15,),
                selectChoice(4, 'Loops'),
                SizedBox(height: 15,),
                selectChoice(5, 'Strings'),
                SizedBox(height: 15,),
                selectChoice(6, 'Lists'),
                SizedBox(height: 15,),
                selectChoice(7, 'Tuples'),
                SizedBox(height: 15,),
                selectChoice(8, 'Sets'),
                SizedBox(height: 15,),
                selectChoice(9, 'Dictionaries'),
                SizedBox(height: 15,),
                selectChoice(10, 'OOP in Python'),
                SizedBox(height: 15,),
                selectChoice(11, 'File Handling'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

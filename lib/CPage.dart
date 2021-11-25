import 'package:flutter/material.dart';
class CPage extends StatefulWidget {
  const CPage({Key? key}) : super(key: key);

  @override
  _CPageState createState() => _CPageState();
}

class _CPageState extends State<CPage> {
  static double heights=0.0;
  static double widths=0.0;

  Widget selectChoice(int index,String topics){
    return Container(
      height: heights,
      width: widths,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white,Colors.purple,Colors.white],
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
        title: Text('C Programming'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15,),
                GestureDetector(
                  child: selectChoice(1, 'Basics Of C'),
                  onTap: (){
                    //To Do
                  },
                ),
                SizedBox(height: 15,),
                selectChoice(2, 'Data Types'),
                SizedBox(height: 15,),
                selectChoice(3, 'Input - Output'),
                SizedBox(height: 15,),
                selectChoice(4, 'Operators'),
                SizedBox(height: 15,),
                selectChoice(5, 'Loops'),
                SizedBox(height: 15,),
                selectChoice(6, 'Arrays'),
                SizedBox(height: 15,),
                selectChoice(7, 'Strings'),
                SizedBox(height: 15,),
                selectChoice(8, 'Pointers'),
                SizedBox(height: 15,),
                selectChoice(9, 'Storage classes'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

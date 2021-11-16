import 'package:flutter/material.dart';
class QuantPage extends StatefulWidget {
  const QuantPage({Key? key}) : super(key: key);

  @override
  _QuantPageState createState() => _QuantPageState();
}

class _QuantPageState extends State<QuantPage> {
  static double heights=0.0;
  static double widths=0.0;
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
        title: Text('Quantitative Aptitude'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15,),
                selectChoice(1,'Number System'),
                SizedBox(height: 15,),
                selectChoice(2,'Divisibility'),
                SizedBox(height: 15,),
                selectChoice(3,'HCF & LCM'),
                SizedBox(height: 15,),
                selectChoice(4,'Ratio & Propertion'),
                SizedBox(height: 15,),
                selectChoice(5,'Percentage'),
                SizedBox(height: 15,),
                selectChoice(6,'Average'),
                SizedBox(height: 15,),
                selectChoice(7,'Profit and Loss'),
                SizedBox(height: 15,),
                selectChoice(8,'Squares and Square Roots'),
                SizedBox(height: 15,),
                selectChoice(9,'Cubes and Cube Roots'),
                SizedBox(height: 15,),
                selectChoice(10,'Fractions'),
                SizedBox(height: 15,),
                selectChoice(11,'Simple Interest'),
                SizedBox(height: 15,),
                selectChoice(12,'Compound Interest'),
                SizedBox(height: 15,),
                selectChoice(13,'Time and Work'),
                SizedBox(height: 15,),
                selectChoice(14,'Work and Wages'),
                SizedBox(height: 15,),
                selectChoice(15,'Pipes and Cistern'),
                SizedBox(height: 15,),
                selectChoice(16,'Problems on Trains'),
                SizedBox(height: 15,),
                selectChoice(17,'Clock'),
                SizedBox(height: 15,),
                selectChoice(18,'Calender'),
                SizedBox(height: 15,),
                selectChoice(19,'Time and Distances'),
                SizedBox(height: 15,),
                selectChoice(20,'Discount'),
                SizedBox(height: 15,),
                selectChoice(21,'Simplification'),
                SizedBox(height: 15,),
              ],

            ),
          ),
        )
      )
    );
  }

  Widget selectChoice(int index,String topics){
    return Container(
      height: heights,
      width: widths,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white,Colors.redAccent,Colors.white],
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

}

import 'package:flutter/material.dart';

import 'Styling.dart';
class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Styling tex = Styling();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 25,),
          onPressed: (){
            setState(() {
              Navigator.of(context).pop();
            });
          },
        ),
      ),
      body : Column(
        children: <Widget>[
          Expanded(
            child : Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListView(
                    children: [
                      Center(child:tex.texts('Know More!',30.0,'Uchen',Colors.black)),
                      ListTile(
                        title: tex.texts('1. About this App', 18.0, 'Uchen', Colors.black),
                        subtitle: Text('This is a basic quizz app.There is more then 5 subjects available for give a quiz test.You may Also Create Your Own Quiz questions and set Answers.there is available subjects'
                            'Like C programming , java, general knowledge ,Math etc.This is an educational purposes application. It has only educational content so age restriction is not required.'),
                      ),
                      ListTile(
                        title: tex.texts('2. Score Rules', 18.0, 'Uchen', Colors.black),
                        subtitle: Text('There is simple Scoring logic , if you give a correct answer then your score will increase with +1 marks otherwise your score will same As previous.'),
                      ),
                      ListTile(
                        title: tex.texts('2. Note', 18.0, 'Uchen', Colors.black),
                        subtitle: Text('This app  do not asks with your any permission and does not collect any information . So you may feel free with this reasons.If you face any issue regarding this'
                            ' then you may directly contact us at given contact details.'),
                      ),
                      SizedBox(height: 35.0,),
                      Center(child: tex.texts('Thank You!',30.0,'Niconne',Colors.red),)
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

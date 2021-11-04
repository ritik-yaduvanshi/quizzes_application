import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quizzes"),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          onPressed: (){
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: Icon(Icons.arrow_back),
        )
      ),
      body: Container(
        child: Center(
          child: Text('Welcome In Quizzes!'),
        ),
      )
    );
  }
}




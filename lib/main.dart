import 'package:flutter/material.dart';
import 'package:quizzes_application/InternetStatus.dart';
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InternetStatus(),
    );
  }
}


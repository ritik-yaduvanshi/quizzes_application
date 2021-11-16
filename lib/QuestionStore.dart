import 'package:flutter/material.dart';
class QuestionStore{
  String question;
  String corrAns;
  QuestionStore({required this.question,required this.corrAns});
}
class QuestionBank{
  int _quesNo = 0;
  int _quesAnsNo = 0;

  List<QuestionStore> userQuesList = [QuestionStore(question: "", corrAns: "")];
  List<String> list1 = [];
  List<String> list2 = [];
  List<String> list3 = [];
  List<String> list4 = [];
}
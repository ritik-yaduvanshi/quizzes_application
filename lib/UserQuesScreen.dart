import 'package:flutter/material.dart';

import 'FinalQuesScreen.dart';
import 'QuestionStore.dart';
class UserQuesScreen extends StatefulWidget {
  //const UserQuesScreen({Key? key}) : super(key: key);
  double conHeight;
  double conWidth;
  int quesNo;
  UserQuesScreen(this.conHeight,this.conWidth,this.quesNo);
  @override
  _UserQuesScreenState createState() => _UserQuesScreenState(conHeight,conWidth,quesNo);
}

class _UserQuesScreenState extends State<UserQuesScreen> {

  final _formKey = GlobalKey<FormState>();


  TextEditingController  quesController = TextEditingController();
  TextEditingController corrAnsController = TextEditingController();
  TextEditingController firstChoice = TextEditingController();
  TextEditingController secondChoice = TextEditingController();
  TextEditingController thirdChoice = TextEditingController();
  TextEditingController fourthChoice = TextEditingController();

  static List<Widget> widgetList = [];
  double conHeight;
  double conWidth;
  int quesNo;
  QuestionBank obj = QuestionBank();
  _UserQuesScreenState(this.conHeight,this.conWidth,this.quesNo);



  //initial State
  void initState(){
    super.initState();
    fillBox();
  }


  void fillBox(){
    int val = quesNo;
    widgetList.add(SizedBox(height: 20,));
    for(int i = 0;i<val;i++){
      widgetList.add(quesBox(i+1));
      widgetList.add(SizedBox(height: 10,));
    }
    widgetList.add(pressButton());
    widgetList.add(SizedBox(height: 15));
  }

  //check WidgetList is Empty or not
  bool isWidgetLen(){
    bool res = false;
    if(widgetList.length==2)res = true;
    return res;
  }

  //clear all controller data after saving the value
  void clearData(){
    quesController.clear();
    corrAnsController.clear();
    corrAnsController.clear();
    firstChoice.clear();
    secondChoice.clear();
    thirdChoice.clear();
    fourthChoice.clear();
  }

  Widget quesBox(int index){
    return Container(
      height: conHeight,
      width: conWidth,
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(10),
     ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: Text('$index. Question',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: TextFormField(
              controller: quesController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onSaved: (value)=>quesController.text=value!,
              validator: (value){
                if(value!.isEmpty)return('Can\'t be Empty!');
              },
              decoration: InputDecoration(
                  hintText: 'Write Your Question!',
                  contentPadding: EdgeInsets.only(left: 20,right: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: TextFormField(
              controller: corrAnsController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onSaved: (value)=>corrAnsController.text=value!,
              validator: (value){
                if(value!.isEmpty)return('Can\'t be Empty!');
              },
              decoration: InputDecoration(
                  hintText: 'Enter Correct Ans!',
                  contentPadding: EdgeInsets.only(left: 20,right: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: TextFormField(
              controller: firstChoice,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onSaved: (value)=>firstChoice.text=value!,
              validator: (value){
                if(value!.isEmpty)return('Can\'t be Empty!');
              },
              decoration: InputDecoration(
                  hintText: 'Set First Option',
                  contentPadding: EdgeInsets.only(left: 20,right: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: TextFormField(
              controller: secondChoice,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onSaved: (value)=>secondChoice.text=value!,
              validator: (value){
                if(value!.isEmpty)return('Can\'t be Empty!');
              },
              decoration: InputDecoration(
                  hintText: 'Set Second Option',
                  contentPadding: EdgeInsets.only(left: 20,right: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: TextFormField(
              controller: thirdChoice,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onSaved: (value)=>thirdChoice.text=value!,
              validator: (value){
                if(value!.isEmpty)return('Can\'t be Empty!');
              },
              decoration: InputDecoration(
                  hintText: 'Set Third Option',
                  contentPadding: EdgeInsets.only(left: 20,right: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: TextFormField(
              controller: fourthChoice,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onSaved: (value)=>fourthChoice.text=value!,
              validator: (value){
                if(value!.isEmpty)return('Can\'t be Empty!');
              },
              decoration: InputDecoration(
                  hintText: 'Set Fourth Option',
                  contentPadding: EdgeInsets.only(left: 20,right: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
          ),
          SizedBox(height: 12,),
          ElevatedButton(
            onPressed: (){
              setState(() {
                obj.fillData(quesController.text,corrAnsController.text,firstChoice.text,secondChoice.text,thirdChoice.text,fourthChoice.text);
                widgetList.removeAt(index);
                clearData();
              });
            },
            child: Text('Save',style: TextStyle(fontWeight: FontWeight.bold),),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: StadiumBorder(),
              fixedSize: Size(conWidth*0.5,50),
            ),
          ),
        ],
      ),
    );
  }
  Widget pressButton(){
    return Center(
      child: ElevatedButton(
        onPressed: (){
          setState(() {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>FinalQuesScreen(quesNo,obj)));
          });
        },
        child: Text('Start Quiz!',style: TextStyle(fontWeight: FontWeight.bold),),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          shape: StadiumBorder(),
          fixedSize: Size(conWidth*0.7,50),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 25,),
          onPressed: (){
            setState(() {
              widgetList.clear();
              Navigator.of(context).pop();
            });
          },
        ),
        centerTitle: true,
        title: Text('Create Your Quiz'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgetList,
            ),
          ),
        ),
      ),
    );
  }
}

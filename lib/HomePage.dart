import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzes_application/InfoPage.dart';
import 'package:quizzes_application/JavaScreen.dart';
import 'package:quizzes_application/Quant%20Page.dart';
import 'package:quizzes_application/SignInPage.dart';
import 'package:quizzes_application/Styling.dart';
import 'package:quizzes_application/UserQuesScreen.dart';
import 'package:quizzes_application/VerbalPage.dart';
import 'package:quizzes_application/user_model.dart';
import 'CPage.dart';
import 'LogicalPage.dart';
import 'PythonPage.dart';
import 'QuestionStore.dart';
import 'UserInfo.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  String _imagePath ='';
  bool isPicked(){
    if(_imagePath.isNotEmpty)return true;
    return false;
  }

  Widget userImage(){
    return CircleAvatar(
      backgroundImage: FileImage(File(_imagePath)),
      radius: 40,
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  static String _subName = '';
  static String _userName = '';
  Sub obj = Sub();

  bool isLoad = false;
  bool isComp1 = false;

  Widget selectSubject(String subjectName,double h,double w){
    _subName = subjectName;
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      height: h,
      width: w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrangeAccent,Colors.white,Colors.deepOrange,Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text('$subjectName',style: TextStyle(fontWeight: FontWeight.bold),)),
    );
  }

  //PopUp AlertDialog

  void showPopUp(BuildContext context,double h,double w){
    int num = 0;
    var popUp = AlertDialog(
      title: Text('Enter The Value!'),
      actions: [
        Column(
          children: <Widget>[
            TextField(
              maxLength: 2,
              decoration: InputDecoration(
                labelText: 'Number Of Questions',
                hintText: '10',
              ),
              onChanged: (text){
                num = int.parse(text);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('Back'),
                  onPressed: (){
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                ),
                TextButton(
                  child: Text('Submit!'),
                  onPressed: (){
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserQuesScreen(h,w,num)));
                      obj.setInfo(_subName,_userName);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context)=>popUp,barrierDismissible: false);
  }


  @override
  Widget build(BuildContext context) {
    double nextConHeight = MediaQuery.of(context).size.height*.5;
    double nextConWidth = MediaQuery.of(context).size.width*.7;
    double conHeight = MediaQuery.of(context).size.height*.06;
    double conWidth = MediaQuery.of(context).size.width*.25;
    _userName = '${loggedInUser.firstName} ${loggedInUser.secondName}';
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orangeAccent,Colors.white,Colors.deepOrangeAccent],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  isPicked()? userImage() : CircleAvatar(
                    backgroundImage: AssetImage('Images/blankProfile.png'),
                    radius: 40.0,
                  ),
                  Text('Welcome Back!\n${loggedInUser.firstName} ${loggedInUser.secondName}\n${loggedInUser.email},',style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Card(
              color: Colors.deepOrangeAccent,
              child: GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Account Info',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                onTap: (){
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>UserInformation()));
                  });
                },
              ),
            ),
            Card(
              color: Colors.deepOrangeAccent,
              child: GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Sign Out!',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                onTap: (){
                  logout(context);
                },
              ),
            ),
            Card(
              color: Colors.deepOrangeAccent,
              child: GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.announcement_sharp),
                  title: Text('About Us!',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                onTap: (){
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>InfoPage()));
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child : Center(
            child: Column(
              children: [
                SizedBox(height: 40,),
                RichText(
                  text: TextSpan(
                    text: 'Quizzes',
                    style: GoogleFonts.fruktur(fontSize: 70,fontWeight: FontWeight.bold,color:Colors.black),
                  ),
                ),

                SizedBox(height: 10,),
                Text('Choose! Anyone Of These Subjects?',style: GoogleFonts.irishGrover(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: selectSubject('Quant Aptitude', conHeight, conWidth),
                      onTap: (){
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>QuantPage()));
                        });
                      },
                    ),
                    GestureDetector(
                      child: selectSubject('Verbal Aptitude', conHeight, conWidth),
                      onTap: (){
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>VerbalPage()));
                        });
                      },
                    ),
                    GestureDetector(
                      child: selectSubject('Logical Aptitude', conHeight, conWidth),
                      onTap: (){
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>LogicalPage()));
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: selectSubject('Java', conHeight, conWidth),
                      onTap: (){
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>JavaScreen()));
                        });
                      },
                    ),
                    GestureDetector(
                      child: selectSubject('C', conHeight, conWidth),
                      onTap: (){
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>CPage()));
                        });
                      },
                    ),
                    GestureDetector(
                      child: selectSubject('Python', conHeight, conWidth),
                      onTap: (){
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>PythonPage()));
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: selectSubject('DBMS', conHeight, conWidth),
                      onTap: (){
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>VerbalPage()));
                        });
                      },
                    ),
                    GestureDetector(
                      child: selectSubject('OS', conHeight, conWidth),
                      onTap: (){
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>VerbalPage()));
                        });
                      },
                    ),
                    GestureDetector(
                      child: selectSubject('Computer', conHeight, conWidth),
                      onTap: (){
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>VerbalPage()));
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text('Create Your Own Quiz!',style: GoogleFonts.fruktur(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.black),),
                SizedBox(height: 20,),
                OutlinedButton(
                    onPressed: ()async{
                      setState(() {
                        isLoad = true;
                      });
                      await Future.delayed(Duration(seconds: 2));
                      setState(() {
                        isComp1 = true;
                      });
                      await Future.delayed(Duration(seconds: 2));
                      setState(() {
                        isComp1 = false;
                        isLoad = false;
                        showPopUp(context, nextConHeight, nextConWidth);
                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>UserQuesScreen(nextConHeight,nextConWidth,5)));
                      });
                    },
                    child: isLoad
                        ? isComp1 ?Styling.buttonChanger() : Styling.progressBar() : Text('Create Quiz',style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold,color: Colors.red),),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      fixedSize: Size(MediaQuery.of(context).size.width*0.7,60),
                      side: isLoad ? isComp1 ? BorderSide(width: 3,color: Colors.green): BorderSide(width: 3,color: Colors.black):BorderSide(width: 3,color: Colors.red),
                    )
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context)=>SignInPage()));
  }

}





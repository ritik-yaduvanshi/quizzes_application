import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzes_application/Alert.dart';
import 'package:quizzes_application/SignInPage.dart';
import 'package:quizzes_application/Styling.dart';
import 'package:quizzes_application/user_model.dart';
import 'UserInfo.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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

  bool isLoad = false;
  bool isComp1 = false;

  Widget selectSubject(String subjectName,double h,double w){

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent,Colors.white,Colors.lightGreenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text('$subjectName',style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    double conHeight = MediaQuery.of(context).size.height*.08;
    double conWidth = MediaQuery.of(context).size.width*.25;
    return Scaffold(
      backgroundColor: Colors.indigo,
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
                    colors: [Colors.lightBlueAccent,Colors.white,Colors.greenAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                  ),
                  Text('Welcome Back!\n${loggedInUser.firstName} ${loggedInUser.secondName}\n${loggedInUser.email},',style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Card(
              color: Colors.indigo,
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
              color: Colors.indigo,
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
              color: Colors.indigo,
              child: GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.announcement_sharp),
                  title: Text('About Us!',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                onTap: (){
                  setState(() {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>UserInformation()));
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Qui',
                  style: GoogleFonts.fruktur(fontSize: 70,fontWeight: FontWeight.bold,color:Colors.deepOrangeAccent),
                  children: const<TextSpan>[
                    TextSpan(
                      text: 'zz',style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'es',style: TextStyle(color:Colors.yellowAccent),
                    )
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'Welcome : ',
                    style: GoogleFonts.irishGrover(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(text:'${loggedInUser.firstName} ${loggedInUser.secondName} !!',style: TextStyle(color: Colors.red)),
                    ]
                ),
              ),
              SizedBox(height: 10,),
              Text('Choose! Anyone Of These Subjects?',style: GoogleFonts.irishGrover(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectSubject('Verbal Aptitude!',conHeight,conWidth),
                  selectSubject('Quant Aptitude!',conHeight,conWidth),
                  selectSubject('Logical Aptitude!',conHeight,conWidth),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectSubject('Java',conHeight,conWidth),
                  selectSubject('Python',conHeight,conWidth),
                  selectSubject('C Programming',conHeight,conWidth),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectSubject('Computer Awareness!',conHeight,conWidth),
                  selectSubject('Operating System',conHeight,conWidth),
                  selectSubject('DataBase Management',conHeight,conWidth),
                ],
              ),
              SizedBox(height: 10,),
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
                    });
                  },
                  child: isLoad
                      ? isComp1 ?Styling.buttonChanger() : Styling.progressBar() : Text('Create Quiz',style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold,color: Colors.red),),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    fixedSize: Size(MediaQuery.of(context).size.width*0.5,60),
                    side: isLoad ? isComp1 ? BorderSide(width: 3,color: Colors.green): BorderSide(width: 3,color: Colors.black):BorderSide(width: 3,color: Colors.red),
                  )
              ),
            ],
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





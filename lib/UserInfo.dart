import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizzes_application/user_model.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInformation> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Account Information',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
                ),
              ),
              SizedBox(height: 50,),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
              ),
              SizedBox(height: 10,),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('UserName : ${loggedInUser.firstName} ${loggedInUser.secondName}',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Email : ${loggedInUser.email}',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

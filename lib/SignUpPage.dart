import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzes_application/Alert.dart';
import 'package:quizzes_application/SignInPage.dart';
import 'package:quizzes_application/Styling.dart';
import 'package:quizzes_application/user_model.dart';

import 'HomePage.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  //firebase auth
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  //Connection test

  /*static bool isConnected = false;
  late StreamSubscription sub;
  //Internet Connectivity Check
  void initState(){
    super.initState();
    sub = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        isConnected = (result != ConnectivityResult.none);
      });
    });
  }
  void dispose(){
    sub.cancel();
    super.dispose();
  }*/

  //form key
  final _formKey = GlobalKey<FormState>();

  //TextEditing Controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController name2Controller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isComp1 = false;
  bool isLoad = false;
  bool isPressed = true;
  bool isPressed1 = true;

  @override
  Widget build(BuildContext context) {

    final nameField = TextFormField(
      controller: nameController,
      keyboardType: TextInputType.text,
      onSaved: (value)=>nameController.text=value!,
      textInputAction: TextInputAction.next,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if(value.length>10){
          return ('First Name(Max. 10 Character)');
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        hintText: 'FirstName',
        contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );

    final name2Field = TextFormField(
      controller: name2Controller,
      keyboardType: TextInputType.text,
      onSaved: (value)=>name2Controller.text=value!,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Last Name cannot be Empty");
        }
        if(value.length>10){
          return ('Last Name(Max. 10 Character)');
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          hintText: 'LastName',
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    final emailField = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value)=>emailController.text=value!,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    final passWordField = TextFormField(
      controller: passwordController,
      obscureText: isPressed1,
      onSaved: (value)=>passwordController.text=value!,
      textInputAction: TextInputAction.next,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter Your Password!");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          suffixIcon: IconButton(
            icon: Icon(isPressed1?Icons.visibility_off:Icons.visibility_outlined),
            onPressed: ()async{
              setState(() {
                isPressed1 = false;
              });
              await Future.delayed(Duration(seconds: 1));
              setState(() {
                isPressed1 = true;
              });
            },
          ),
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    final confirmPasswordField = TextFormField(
      controller: confirmPasswordController,
      obscureText: isPressed,
      onSaved: (value)=>confirmPasswordController.text=value!,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (confirmPasswordController.text !=
            passwordController.text) {
          return "Password don't match";
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          suffixIcon: IconButton(
            icon: Icon(isPressed?Icons.visibility_off:Icons.visibility_outlined),
            onPressed: ()async{
              setState(() {
                isPressed = false;
              });
              await Future.delayed(Duration(seconds: 1));
              setState(() {
                isPressed = true;
              });
            },
          ),
          hintText: 'Confirm Password',
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );


    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Images/register.png'),
          fit: BoxFit.cover
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: (){
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              icon: Icon(Icons.arrow_back,color: Colors.black,),
            )
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30,),
                    RichText(
                      text: TextSpan(
                        text: 'Qui',
                        style: GoogleFonts.fruktur(fontSize: 70,fontWeight: FontWeight.bold,color:Colors.purpleAccent),
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
                    //Image(image: NetworkImage('https://www.electroschematics.com/wp-content/uploads/2014/03/ready-quiz.gif'),height: 80,width: 200,),
                    RichText(
                      text: TextSpan(
                        text: 'New User? ',
                        style: GoogleFonts.crimsonText(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20,color: Colors.black),
                        children: const<TextSpan>[
                          TextSpan(text: 'Sign Up Here!',style: TextStyle(color: Colors.redAccent))
                        ]
                      ),
                    ),
                    SizedBox(height: 20,),
                    nameField,
                    SizedBox(height: 10,),
                    name2Field,
                    SizedBox(height: 10,),
                    emailField,
                    SizedBox(height: 10,),
                    passWordField,
                    SizedBox(height: 10,),
                    confirmPasswordField,
                    SizedBox(height: 10,),
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
                       signUp(emailController.text, passwordController.text);
                       setState(() {
                         isComp1 = false;
                         isLoad = false;
                       });
                     },
                     child: isLoad
                       ? isComp1 ?Styling.buttonChanger() : Styling.progressBar() : Text('Sign Up',style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold,color: Colors.red),),
                     style: OutlinedButton.styleFrom(
                       shape: StadiumBorder(),
                       fixedSize: Size(MediaQuery.of(context).size.width*0.5,60),
                       side: isLoad ? isComp1 ? BorderSide(width: 3,color: Colors.green): BorderSide(width: 3,color: Colors.black):BorderSide(width: 3,color: Colors.red),
                     )
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already a User? ',style: GoogleFonts.crimsonText(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20,color: Colors.black),),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text('Login!',style: GoogleFonts.crimsonText(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 30,color: Colors.red,),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  //Firebase SignUp Methods and Catch Some Error

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = nameController.text;
    userModel.secondName = name2Controller.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
  }


}

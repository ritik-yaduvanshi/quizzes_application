import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzes_application/Alert.dart';
import 'package:quizzes_application/SignUpPage.dart';
import 'package:quizzes_application/Styling.dart';

import 'HomePage.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  // form key
  final _formKey = GlobalKey<FormState>();
  // Text editing Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isComp = false;
  bool isPressed = true;

  //Firebase Auth
  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
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
      onSaved: (value){
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );

    final passwordField = TextFormField(
      controller: passwordController,
      obscureText: isPressed,
      onSaved: (value){
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
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
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          hintText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );


    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Images/login.png'),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'Qui',
                        style: GoogleFonts.fruktur(fontSize: 70,fontWeight: FontWeight.bold,color:Colors.lightBlueAccent),
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
                    SizedBox(height: 20,),
                    RichText(
                      text: TextSpan(
                          text: 'Welcome ',
                          style: GoogleFonts.irishGrover(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.green),
                          children: const<TextSpan>[
                            TextSpan(text: 'User!',style: TextStyle(color: Colors.red)),
                          ]
                      ),
                    ),
                    SizedBox(height: 10,),
                    emailField,
                    SizedBox(height: 10,),
                    passwordField,
                    SizedBox(height: 20,),
                    OutlinedButton(
                        onPressed: ()async{
                          //if(isLoading) return;
                          setState(() {
                            isLoading = true;
                          });
                          await Future.delayed(Duration(seconds: 2));
                          setState(() {
                            isComp = true;
                          });
                          await Future.delayed(Duration(seconds: 2));
                          signIn(emailController.text, passwordController.text);
                          setState(() {
                            isComp = false;
                            isLoading = false;
                          });
                        },
                        child: isLoading
                            ? isComp ? Styling.buttonChanger(): Styling.progressBar():Text('Login',style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold,color: Colors.red),),
                        style: OutlinedButton.styleFrom(
                          //padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          shape: StadiumBorder(),
                          fixedSize: Size(MediaQuery.of(context).size.width*0.7,60),
                          side: isLoading ? isComp ? BorderSide(width: 3,color: Colors.green): BorderSide(width: 3,color: Colors.black):BorderSide(width: 3,color: Colors.red),
                        )
                    ),
                    SizedBox(height: 10,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SignUpPage()));
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
  //sign in methods

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage())),
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
}

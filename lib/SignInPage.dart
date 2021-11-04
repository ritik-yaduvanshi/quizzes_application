import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzes_application/SignUpPage.dart';

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

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
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



    Widget progressBar(){
      return Row(
        children: [
          CircularProgressIndicator(color: Colors.black,),
          SizedBox(width: 24),
          Text('Please Wait...',style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold,color: Colors.black),)
        ],
      );
    }

    Widget buttonChanger(){
      return Row(
        children: [
          Icon(Icons.check_circle,color: Colors.green,size: 20,),
          SizedBox(width: 24,),
          Text('Finished',style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold,color: Colors.green),)
        ],
      );
    }

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
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>HomePage()),);
                            isComp = false;
                            isLoading = false;
                          });
                        },
                        child: isLoading
                            ? isComp ? buttonChanger(): progressBar():Text('Login',style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold,color: Colors.red),),
                        style: OutlinedButton.styleFrom(
                          //padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          shape: StadiumBorder(),
                          minimumSize: Size.fromHeight(60),
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
}

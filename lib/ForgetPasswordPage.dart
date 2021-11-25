import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  final _formKey = GlobalKey<FormState>();
  double w = 0.0;
  final TextEditingController emailController = TextEditingController();
  var email = '';
  final TextEditingController passwordController = TextEditingController();
  resetPassword() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('Password Reset Link is Send On Your Email !',style: TextStyle(fontSize: 18.0),),
          )
      );
    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text('No User Found for that Email?',style: TextStyle(fontSize: 18.0),),
            )
        );
      }
    }
  }

  Widget pressButton(){
    return Center(
      child: ElevatedButton(
        onPressed: (){
          if(_formKey.currentState!.validate()){
            setState(() {
              email = emailController.text;
              resetPassword();
            });
          }
        },
        child: Text('Send Email',style: TextStyle(fontWeight: FontWeight.bold),),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          shape: StadiumBorder(),
          fixedSize: Size(w*0.7,50),
        ),
      ),
    );
  }

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //double h = MediaQuery.of(context).size.height*0.5;
    double wi = MediaQuery.of(context).size.width*0.7;
    w = wi;
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 25,color: Colors.black,),
          onPressed: (){
            setState(() {
              Navigator.of(context).pop();
            });
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: Text('Recover Your Password!',style: GoogleFonts.irishGrover(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),)),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Enter Your Email!',style: TextStyle(color: Colors.blueAccent,fontSize:20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              child: emailField,
            ),
            SizedBox(height: 15,),
            pressButton(),
          ],
        ),
      ),
    );
  }
}

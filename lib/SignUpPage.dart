import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzes_application/SignInPage.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
                       setState(() {
                         Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SignInPage()),);
                         isComp1 = false;
                         isLoad = false;
                       });
                     },
                     child: isLoad
                       ? isComp1 ?buttonChanger() : progressBar() : Text('Sign Up',style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold,color: Colors.red),),
                     style: OutlinedButton.styleFrom(
                       shape: StadiumBorder(),
                       minimumSize: Size.fromHeight(60),
                       side: isLoad ? isComp1 ? BorderSide(width: 3,color: Colors.green): BorderSide(width: 3,color: Colors.yellowAccent):BorderSide(width: 3,color: Colors.red),
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

  Widget progressBar(){
    return Row(
      children: [
        CircularProgressIndicator(color: Colors.yellowAccent,),
        SizedBox(width: 24),
        Text('Please Wait...',style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold,color: Colors.yellowAccent),)
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



}

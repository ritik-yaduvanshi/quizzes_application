import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Alert{
  static Widget alertMsg(){
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Icon(
                    Icons.warning_amber_outlined,color: Colors.red,size: 40,
                  ),
                  Text('Warning',style: GoogleFonts.irishGrover(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.red),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off_sharp,color: Colors.red,size: 40,
                  ),
                  Text('OOPS!\nNO INTERNET',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Text('Please check your network connection'),
                  SizedBox(height: 10,),
                  CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styling{
  static Widget progressBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(color: Colors.black,),
        SizedBox(width: 24),
        Text('Please Wait...',style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold,color: Colors.black),)
      ],
    );
  }

  static Widget buttonChanger(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle,color: Colors.green,size: 20,),
        SizedBox(width: 24,),
        Text('Finished',style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold,color: Colors.green),)
      ],
    );
  }

  Widget texts(String text,double size,String family,Color value){
    return Text(
      '$text',textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontFamily: '$family',
        fontWeight: FontWeight.bold,
        color: value,
      ),
    );
  }
}
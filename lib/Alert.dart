import 'package:flutter/material.dart';
class Alert extends StatefulWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.warning_amber_outlined,color: Colors.white,size: 40,
        ),
        title: Text('Warning'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.wifi_off_sharp,color: Colors.red,size: 40,
            ),
            Text('Internet Connection Lost',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            CircularProgressIndicator(
              color: Colors.red,
            ),
          ],
        ),
      )
    );
  }
}

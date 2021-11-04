import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:quizzes_application/Alert.dart';


import 'SignInPage.dart';
class InternetStatus extends StatefulWidget {
  const InternetStatus({Key? key}) : super(key: key);

  @override
  _InternetStatusState createState() => _InternetStatusState();
}

class _InternetStatusState extends State<InternetStatus> {

  static bool isConnected = false;
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
  }
  @override
  Widget build(BuildContext context) {
    return isConnected ? SignInPage() : Alert();
  }
}

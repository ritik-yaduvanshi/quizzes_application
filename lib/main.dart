import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzes_application/Alert.dart';
import 'package:quizzes_application/Connection_Provider.dart';
import 'package:quizzes_application/SignInPage.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        ConnectionProvider connectionProvider = ConnectionProvider();
        connectionProvider.initialConnection();
        return connectionProvider;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<ConnectionProvider>(
          builder: (context,connection,child){
            return connection.isConnected ? SignInPage() : Alert.alertMsg();
          },
        )
      ),
    );
  }
}


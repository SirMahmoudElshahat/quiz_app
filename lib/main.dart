import 'package:flutter/material.dart';
import 'package:quiz/home.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/questionScreen':(context) => QuestionScreen(),
          '/resultScreen':(context) => Result(),
        }
        );
  }
}

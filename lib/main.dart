import 'package:flutter/material.dart';
import 'package:hamro_notes/welcome_screen.dart';

void main() => runApp(MyAapp());

class MyAapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
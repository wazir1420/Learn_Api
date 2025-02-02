import 'package:flutter/material.dart';
import 'package:learnapi/get_user.dart';
import 'package:learnapi/home.dart';
import 'package:learnapi/user_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserView(),
    );
  }
}

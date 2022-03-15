import 'package:flutter/material.dart';
import 'package:shared_preference/pages/home_page.dart';
import 'package:shared_preference/pages/login_page.dart';
import 'package:shared_preference/pages/main_page_1.dart';
import 'package:shared_preference/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        LogInPage.id: (context) => const LogInPage(),
        SignUpPage.id: (context) => const SignUpPage(),
        MainPage1.id: (context) => const MainPage1(),
      },
    );
  }
}


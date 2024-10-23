import 'package:flutter/material.dart';
import 'package:tickets_app/login/register_screen.dart';
import 'package:tickets_app/login/login_screen.dart';
import 'package:tickets_app/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login-screen',
      //initialRoute: 'home-screen',
      routes: {
        'register-screen': (context) => RegisterScreen(),
        'login-screen':(context) => LoginScreen(),
        'home-screen':(context) => HomeScreen() ,
      },
    );
  }
}

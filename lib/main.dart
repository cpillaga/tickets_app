import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:tickets_app/login/register_screen.dart';
import 'package:tickets_app/login/login_screen.dart';
import 'package:tickets_app/home/home_screen.dart';
import 'package:tickets_app/utils/stripe_values.dart';

void main() async {
  await setUp();
  runApp(const MyApp());
}

Future<void> setUp() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
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
        'login-screen': (context) => LoginScreen(),
        'home-screen': (context) => HomeScreen(),
      },
    );
  }
}

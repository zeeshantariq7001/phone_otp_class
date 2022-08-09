import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp_class/homepage.dart';
import 'package:phone_otp_class/login_page.dart';
import 'package:phone_otp_class/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashinitState(),
      routes: {
        OtpPhone.id: (context) => OtpPhone(),
        HomePage.id: (context) => HomePage(),
        SplashScreen.id: (context) => SplashScreen(),
      },
    );
  }
}

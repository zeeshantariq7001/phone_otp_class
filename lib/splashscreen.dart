import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp_class/homepage.dart';
import 'package:phone_otp_class/login_page.dart';

class SplashinitState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return OtpPhone();
          } else if (snapshot.data.phoneNumber != null) {}
          return SplashScreen();
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  static const id = 'splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 4), () async {
      Navigator.pushReplacementNamed(context, HomePage.id);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 500,
            width: 500,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}

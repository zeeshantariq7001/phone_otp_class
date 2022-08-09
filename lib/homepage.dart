import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp_class/login_page.dart';

class HomePage extends StatelessWidget {
  Future SignOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut().whenComplete(
        () => Navigator.pushReplacementNamed(context, OtpPhone.id));
  }

  static const id = 'homepage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(
              onPressed: () {
                SignOut(context);
              },
              icon: Icon(Icons.logout_rounded))
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Text(FirebaseAuth.instance.currentUser.phoneNumber),
      ),
    );
  }
}

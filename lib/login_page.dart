import 'package:flutter/material.dart';
import 'package:phone_otp_class/auth_provider.dart';

class OtpPhone extends StatelessWidget {
  static const id = 'login';
  TextEditingController otp = TextEditingController();
  GlobalKey globalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("OTP LOGIN"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: globalkey,
            child: TextFormField(
              controller: otp,
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          MaterialButton(
            minWidth: double.infinity,
            color: Colors.blue,
            shape: StadiumBorder(),
            onPressed: () {
              if (otp != null) {
                final phone = "+92" + otp.text;
                AuthProvider().LogInWithPhone(context, phone);
              }
            },
            child: Text("LOG IN"),
          ),
        ],
      ),
    );
  }
}

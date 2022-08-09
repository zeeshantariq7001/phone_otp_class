import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_otp_class/homepage.dart';

class AuthProvider {
  Future<bool> LogInWithPhone(BuildContext context, String phone) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController otpc = TextEditingController();

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await _auth.signInWithCredential(credential);
          Navigator.pop(context);
          User user = result.user;
          if (user != null) {
            Navigator.pushReplacementNamed(context, HomePage.id);
          } else {
            Fluttertoast.showToast(msg: "user is not signed in");
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(msg: e.toString());
        },
        codeSent: (String verificationcode, int token) {
          showDialog(
              context: context,
              builder: (c) {
                return AlertDialog(
                  title: Text("Enter OTP"),
                  content: Column(
                    children: [
                      TextField(
                        controller: otpc,
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () async {
                          final code = otpc.text;
                          AuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationcode,
                                  smsCode: code);
                          UserCredential result =
                              await _auth.signInWithCredential(credential);
                          User user = result.user;
                          if (user != null) {
                            Navigator.pushReplacementNamed(
                                context, HomePage.id);

                            print("success");
                          } else {
                            Fluttertoast.showToast(msg: "error");
                          }
                        },
                        child: Text("verify"))
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (id) => {});
  }
}

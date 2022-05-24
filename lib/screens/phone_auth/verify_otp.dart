import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseseries/screens/email_auth/signup_screen.dart';
import 'package:firebaseseries/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String verificationId;
  const VerifyOtpScreen({ Key? key, required this.verificationId }) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {

  TextEditingController otpController = TextEditingController();

  void verifyOTP() async {
    String otp = otpController.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: otp);

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      if(userCredential.user != null) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(context, CupertinoPageRoute(
          builder: (context) => HomeScreen()
        ));
      }
    } on FirebaseAuthException catch(ex) {
      log(ex.code.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verify OTP"),
      ),
      body: SafeArea(
        child: ListView(
          children: [

            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  
                  TextField(
                    controller: otpController,
                    maxLength: 6,
                    decoration: InputDecoration(
                      labelText: "6-Digit OTP",
                      counterText: ""
                    ),
                  ),

                  SizedBox(height: 20,),

                  CupertinoButton(
                    onPressed: () {
                      verifyOTP();
                    },
                    color: Colors.blue,
                    child: Text("Verify"),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
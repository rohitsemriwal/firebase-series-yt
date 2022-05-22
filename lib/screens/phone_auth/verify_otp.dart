import 'package:firebaseseries/screens/email_auth/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({ Key? key }) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
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
                    decoration: InputDecoration(
                      labelText: "6-Digit OTP"
                    ),
                  ),

                  SizedBox(height: 20,),

                  CupertinoButton(
                    onPressed: () {},
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
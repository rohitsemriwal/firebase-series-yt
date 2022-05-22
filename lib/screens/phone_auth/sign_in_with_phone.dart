import 'package:firebaseseries/screens/email_auth/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({ Key? key }) : super(key: key);

  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign In with Phone"),
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
                      labelText: "Phone Number"
                    ),
                  ),

                  SizedBox(height: 20,),

                  CupertinoButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: Text("Sign In"),
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
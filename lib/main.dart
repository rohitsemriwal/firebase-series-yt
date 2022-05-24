import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseseries/firebase_options.dart';
import 'package:firebaseseries/screens/email_auth/login_screen.dart';
import 'package:firebaseseries/screens/home_screen.dart';
import 'package:firebaseseries/screens/phone_auth/sign_in_with_phone.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null) ? HomeScreen() : LoginScreen(),
    );
  }
}
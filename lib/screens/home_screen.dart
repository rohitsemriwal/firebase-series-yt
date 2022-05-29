import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseseries/screens/email_auth/login_screen.dart';
import 'package:firebaseseries/screens/phone_auth/sign_in_with_phone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(context, CupertinoPageRoute(
      builder: (context) => SignInWithPhone()
    ));
  }

  void saveUser() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    
    nameController.clear();
    emailController.clear();

    if(name != "" && email != "") {
      Map<String, dynamic> userData = {
        "name": name,
        "email": email
      };
      FirebaseFirestore.instance.collection("users").add(userData);
      log("User created!");
    }
    else{ 
      log("Please fill all the fields!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              logOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Name"
                ),
              ),

              SizedBox(height: 10,),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email Address"
                ),
              ),

              SizedBox(height: 10,),

              CupertinoButton(
                onPressed: () {
                  saveUser();
                },
                child: Text("Save"),
              ),

              SizedBox(height: 20,),

              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (context, snapshot) {

                  if(snapshot.connectionState == ConnectionState.active) {
                    if(snapshot.hasData && snapshot.data != null) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {

                            Map<String, dynamic> userMap = snapshot.data!.docs[index].data() as Map<String, dynamic>;

                            return ListTile(
                              title: Text(userMap["name"]),
                              subtitle: Text(userMap["email"]),
                              trailing: IconButton(
                                onPressed: () {
                                  // Delete 
                                },
                                icon: Icon(Icons.delete),
                              ),
                            );

                          },
                        ),
                      );
                    }
                    else {
                      return Text("No data!");
                    }
                  }
                  else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
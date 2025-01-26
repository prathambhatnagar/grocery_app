import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery/pages/login_pages/login.dart';

import 'home_admin.dart';

class AdminPannel extends StatefulWidget {
  const AdminPannel({super.key});

  @override
  State<AdminPannel> createState() => _AdminPannelState();
}

class _AdminPannelState extends State<AdminPannel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.5),
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black26, Colors.black26],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(
                          MediaQuery.of(context).size.width, 110))),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 60),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Text(
                      "Admin Pannel",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 5),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter UserName",
                                      hintStyle: TextStyle(
                                          fontSize: 20, color: Colors.grey)),
                                  controller: usernameEditingController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Username";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 5),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter Password",
                                      hintStyle: TextStyle(
                                          fontSize: 20, color: Colors.grey)),
                                  controller: passwordEditingController,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Password";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                adminLogin();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                margin: EdgeInsets.symmetric(
                                    vertical: 60, horizontal: 20),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  adminLogin() {
    FirebaseFirestore.instance.collection('Admin').get().then(
      (snapshot) {
        bool isIdMatched = false; // Track if ID matches
        bool isPasswordCorrect = false; // Track if password matches

        snapshot.docs.forEach((result) {
          if (result.data()['id'] == usernameEditingController.text.trim()) {
            isIdMatched = true;
            if (result.data()['password'] ==
                passwordEditingController.text.trim()) {
              isPasswordCorrect = true;
            }
          }
        });

        if (!isIdMatched) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orange,
            content: Text("Id is not correct"),
          ));
        } else if (!isPasswordCorrect) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orange,
            content: Text("Password is not correct"),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text("Login successful"),
          ));
          // Navigate to the HomeAdmin screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeAdmin()),
          );
        }
      },
    ).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text("Error: $error"),
      ));
    });
  }
}
// ppKo4IQ6MGOUnVRy5Dmr

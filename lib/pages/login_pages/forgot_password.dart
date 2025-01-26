import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery/pages/login_pages/signup.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Password reset link has been sent",
        style: TextStyle(fontSize: 18),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No user found for this email",
          style: TextStyle(fontSize: 18),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Password Reset", // Fixed the typo here
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(50)),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter email";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                              hintText: "Enter your Email",
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              prefixIcon: Icon(
                                Icons.email,
                                size: 20,
                                color: Colors.white,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(height: 80),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            resetPassword();
                          }
                        },
                        child: Container(
                          width: 200,
                          height: 100,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Send Email",
                              style: TextStyle(
                                  color: Colors.black,
                                  backgroundColor: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 80, horizontal: 90),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Row(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Create",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.yellow),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

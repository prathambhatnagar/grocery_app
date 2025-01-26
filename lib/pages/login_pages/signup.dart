import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:grocery/pages/home.dart";
import "package:grocery/pages/login_pages/login.dart";
import "package:grocery/pages/widgets/widget_support.dart";

import "../navigation_bar.dart";

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String name = '', email = '', pass = '';
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  register() async {
    if (pass != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered successfully",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => CustomNavigationBar()));
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orange,
              content: Text("Provide a Strong password"),
            ),
          );
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue,
              content: Text("you are already exists"),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green.shade800, Colors.green.shade400],
                )),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/logo.png",
                        scale: 1.5,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(top: 50),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null) {
                                      return "Please enter a name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: " Enter Name",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null) {
                                      return "Please enter a E-mail";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: " Enter Email",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                    prefixIcon: Icon(Icons.mail),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null) {
                                      return "Please enter a Password";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: passController,
                                  decoration: InputDecoration(
                                    hintText: " Enter Password",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                    prefixIcon: Icon(Icons.password),
                                  ),
                                  obscureText: true,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "Forgot Password ?",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                GestureDetector(
                                  onTap: () async {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        email = emailController.text;
                                        name = passController.text;
                                        pass = passController.text;
                                      });
                                    }
                                    register();
                                  },
                                  child: Material(
                                    elevation: 5,
                                    color: Colors.green.shade400,
                                    borderRadius: BorderRadius.circular(50),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 50),
                                      child: Container(
                                        child: Text(
                                          "Signup",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Already have an account ? Login",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:grocery/pages/login_pages/forgot_password.dart";
import "package:grocery/pages/login_pages/signup.dart";
import "package:grocery/pages/home.dart";
import "package:grocery/pages/widgets/widget_support.dart";
import "../navigation_bar.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String password = '';
  String email = '';
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwardController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Userlogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => CustomNavigationBar()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No User found for this E-mail",
          style: TextStyle(fontSize: 18),
        )));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("You have entered Wrong password"),
        ));
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
                            key: _formKey,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "enter password";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: " Enter Email",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                    prefixIcon: Icon(Icons.mail),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                TextFormField(
                                  controller: passwardController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "enter password";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: " Enter Password",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                    prefixIcon: Icon(Icons.password),
                                  ),
                                  obscureText: true,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword()));
                                  },
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
                                const SizedBox(height: 60),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        email = emailController.text;
                                        password = passwardController.text;
                                      });
                                    }
                                    Userlogin();
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
                                          "Login",
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text(
                        "Don't have an account? Sign up",
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

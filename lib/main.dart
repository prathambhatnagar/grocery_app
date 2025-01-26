import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery/pages/add_item.dart';
import 'package:grocery/pages/admin_login/admin_login.dart';
import 'package:grocery/pages/login_pages/forgot_password.dart';
import 'package:grocery/pages/home.dart';
import 'package:grocery/pages/login_pages/login.dart';
import 'package:grocery/pages/onboard.dart';
import 'package:grocery/pages/login_pages/signup.dart';
import 'package:grocery/pages/navigation_bar.dart';
import 'package:grocery/pages/wallet.dart';
import 'package:grocery/pages/widgets/content_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Onboard(),
  ));
}

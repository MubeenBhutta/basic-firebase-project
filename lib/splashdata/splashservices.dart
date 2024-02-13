import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/screen/homescreen.dart';
import 'package:firebase_project/screen/loginscreen.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;

class splashservices {
  var user = auth.currentUser;

  checklogin(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => loginscreen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homescreen()));
      }
      ;
    });
  }
}

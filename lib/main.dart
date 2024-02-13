import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/splashdata/splashscreen.dart';
import 'package:flutter/material.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Codecafe());
}

class Codecafe extends StatefulWidget {
  const Codecafe({super.key});

  @override
  State<Codecafe> createState() => _CodecafeState();
}

class _CodecafeState extends State<Codecafe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: Splashscreen());
  }
}

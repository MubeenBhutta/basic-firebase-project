// input button
import 'package:flutter/material.dart';

class MYinputfield extends StatelessWidget {
  final String label;
  final String texthint;
  final shopass;
  final sufixicon;
  final prefixicon;
  final validation;
  final mycontroller;
  const MYinputfield(
      {super.key,
      this.label = '',
      this.texthint = '',
      this.prefixicon,
      this.shopass = false,
      this.sufixicon,
      this.validation,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
              Color.fromARGB(255, 236, 232, 233),
              Colors.orange.shade100,
            ])),
        child: Center(
          child: TextFormField(
              style: TextStyle(fontSize: 18),
              validator: validation,
              obscureText: shopass,
              controller: mycontroller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 0.4)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: label,
                  hintText: texthint,
                  suffixIcon: sufixicon,
                  prefixIcon: prefixicon)),
        ),
      ),
    );
  }
}

// submit button
class MYbutton extends StatelessWidget {
  final loader;
  final String buttonname;
  final double customwidth;
  final VoidCallback onpress;
  const MYbutton(
      {super.key,
      required this.buttonname,
      required this.onpress,
      this.customwidth = 140.0,
      this.loader = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: customwidth,
      decoration: BoxDecoration(
          color: Colors.cyanAccent, borderRadius: BorderRadius.circular(30)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: onpress,
        child: loader
            ? CircularProgressIndicator(
                color: Colors.white54,
                strokeWidth: 5,
              )
            : Text(
                buttonname,
                style: TextStyle(fontSize: 20),
              ),
      ),
    );
  }
}
// text decoration

// drawer
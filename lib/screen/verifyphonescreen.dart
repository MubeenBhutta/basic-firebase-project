import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/component/globalfunctions.dart';
import 'package:firebase_project/component/mycomponent.dart';
import 'package:firebase_project/screen/homescreen.dart';
import 'package:firebase_project/splashdata/splashservices.dart';
import 'package:flutter/material.dart';

class verifyphonenumber extends StatefulWidget {
  final String phoneid;

  const verifyphonenumber({super.key, required this.phoneid});

  @override
  State<verifyphonenumber> createState() => _verifyphonenumberState();
}

class _verifyphonenumberState extends State<verifyphonenumber> {
  bool loading = false;
  toast mytoast = toast();
  final formkey = GlobalKey<FormState>();
  final verifyphonenumbercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('very password'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 40),
                  child: Text(
                    'CodeCafe',
                    style: TextStyle(
                        fontSize: 55,
                        fontFamily: 'headingfonts',
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                              offset: Offset(-2, 2),
                              blurRadius: 6,
                              color: Color.fromARGB(255, 41, 25, 25))
                        ],
                        color: Color.fromARGB(255, 241, 85, 73)),
                  ),
                ),
                MYinputfield(
                  mycontroller: verifyphonenumbercontroller,
                  texthint: 'inter 6 digit code',
                  label: 'inter your code',
                  validation: (val) {
                    if (val.isEmpty == true) {
                      validationmsg.alertmsg(
                          context, 'please inter 6 digit code');
                    } else if (val.isEmpty == false) {
                      if (passvalidation.checkpass(val) == false) {
                        validationmsg.alertmsg(
                            context, 'use only 6 digits code');
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                MYbutton(
                    loader: loading,
                    buttonname: 'verify',
                    onpress: () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });

                        final credntal = PhoneAuthProvider.credential(
                            verificationId: widget.phoneid,
                            smsCode:
                                verifyphonenumbercontroller.text.toString());

                        try {
                          auth.signInWithCredential(credntal);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homescreen()));
                        } catch (e) {
                          mytoast.shoerrmsg(e.toString());
                        }
                      }
                    })
              ],
            )),
      ),
    );
  }
}

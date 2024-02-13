import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/component/mycomponent.dart';
// import 'package:firebase_project/screen/loginscreen.dart';
import 'package:flutter/material.dart';

import '../component/globalfunctions.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  bool loading = false;
  final ForgetPasswordcontroller = TextEditingController();
  toast mytoast = toast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('reset Password')),
        body: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                mycontroller: ForgetPasswordcontroller,
                prefixicon: Icon(Icons.email),
                texthint: 'your email',
                label: 'inter your email',
                validation: (val) {
                  if (val.isEmpty == true) {
                    validationmsg.alertmsg(context, 'please inter Email');
                  }
                  if (emailvalidation.checkmail(val) == false) {
                    validationmsg.alertmsg(context, 'invalid email');
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 50,
              ),
              MYbutton(
                customwidth: 200,
                loader: loading,
                buttonname: 'reset password',
                onpress: () {
                  if (formkey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    auth
                        .sendPasswordResetEmail(
                            email: ForgetPasswordcontroller.text.toString())
                        .then((valu) {
                      setState(() {
                        loading = false;
                        //    timer(Duration(seconds: 5), () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => loginscreen()));
                        // });
                      });

                      mytoast.shosuccmsg('check your email to reset password');
                    }).onError((error, stackTrace) {
                      setState(() {
                        loading = false;
                      });
                      mytoast.shoerrmsg(error.toString());
                    });
                  }
                },
              )
            ],
          ),
        ));
  }
}

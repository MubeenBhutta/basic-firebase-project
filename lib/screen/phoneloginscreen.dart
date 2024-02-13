import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/component/globalfunctions.dart';
import 'package:firebase_project/component/mycomponent.dart';
import 'package:firebase_project/screen/loginscreen.dart';
import 'package:firebase_project/screen/verifyphonescreen.dart';
import 'package:flutter/material.dart';

class phoneloginscreen extends StatefulWidget {
  const phoneloginscreen({super.key});

  @override
  State<phoneloginscreen> createState() => _phoneloginscreenState();
}

class _phoneloginscreenState extends State<phoneloginscreen> {
  devider divider = devider();
  bool loading = false;
  toast mytoast = toast();
  final phonenumbercontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draver.mydraver(),
      appBar: AppBar(
        title: Text('login via phone'),
      ),
      body: SingleChildScrollView(
        child: Form(
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
                mycontroller: phonenumbercontroller,
                prefixicon: Icon(Icons.phone),
                validation: (valu) {
                  if (valu.isEmpty == true) {
                    validationmsg.alertmsg(context, ' inter phone number');
                  } else if (valu.isEmpty == false) {
                    final RegExp mobileRegex = RegExp(r'^\+\d{1,3}\s?\d+$');
                    if (mobileRegex.hasMatch(valu) == false) {
                      validationmsg.alertmsg(context, 'invalid phone number');
                    }
                  } else {
                    return null;
                  }
                },
                label: 'enter your mobile number',
                texthint: '+923166702669',
              ),
              SizedBox(
                height: 30,
              ),
              MYbutton(
                buttonname: 'login',
                loader: loading,
                onpress: () {
                  if (formkey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    auth
                        .verifyPhoneNumber(
                            phoneNumber: phonenumbercontroller.text.toString(),
                            verificationCompleted: (_) {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => verifyphonenumber(phoneid,)));
                            },
                            verificationFailed: (error) {
                              mytoast.shoerrmsg(error.toString());
                              setState(() {
                                loading = false;
                              });
                            },
                            codeSent: (String phoneid, int? token) {
                              setState(() {
                                loading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          verifyphonenumber(phoneid: phoneid)));
                            },
                            codeAutoRetrievalTimeout: (timeout) {
                              setState(() {
                                loading = false;
                              });
                              mytoast.shoerrmsg(timeout);
                            })
                        .then((value) {
                      setState(() {
                        loading = false;
                      });
                    }).onError((error, stackTrace) {
                      mytoast.shoerrmsg(error.toString());
                      setState(() {
                        loading = false;
                      });
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              divider.mydevider(),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginscreen()));
                  },
                  child: Text(
                    'login with email',
                    style: TextStyle(fontSize: 20, color: Colors.black45),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

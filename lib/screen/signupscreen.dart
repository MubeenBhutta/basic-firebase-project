import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/component/globalfunctions.dart';
import 'package:firebase_project/component/mycomponent.dart';
import 'package:firebase_project/screen/loginscreen.dart';
import 'package:flutter/material.dart';

class signupscreen extends StatefulWidget {
  const signupscreen({super.key});

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  // functions from functions class
  devider divider = devider();
  //
  final formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
// bool variable
  bool loading = false;
  bool shopass1 = true;
  bool shopass2 = true;
// controllers
  final fnamecontroller = TextEditingController();
  final lnamecontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final departmentcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draver.mydraver(),
      appBar: AppBar(
        title: Text("create an account"),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            // MYinputfield(
            //   mycontroller: fnamecontroller,
            //   label: '        First Name',
            //   texthint: "first name",
            //   validation: (value) {
            //     if (value.isEmpty == true || value == null) {
            //       return 'please inter First name';
            //     } else {
            //       return null;
            //     }
            //   },
            // ),
            // MYinputfield(
            //   mycontroller: lnamecontroller,
            //   label: '        Last Name',
            //   texthint: "last name",
            //   validation: (value) {
            //     if (value.isEmpty == true || value == null) {
            //       return 'please inter Last name';
            //     } else {
            //       return null;
            //     }
            //   },
            // ),
            // MYinputfield(
            //   mycontroller: usernamecontroller,
            //   prefixicon: Icon(Icons.person),
            //   label: 'Username',
            //   texthint: "username",
            //   validation: (value) {
            //     if (value.isEmpty == true || value == null) {
            //       return 'please inter Username';
            //     } else {
            //       return null;
            //     }
            //   },
            // ),
            MYinputfield(
              mycontroller: emailcontroller,
              prefixicon: Icon(Icons.email),
              label: 'Email',
              texthint: "email",
              validation: (value) {
                if (value.isEmpty == true || value == null) {
                  validationmsg.alertmsg(context, 'please inter email');
                }
                if (emailvalidation.checkmail(value) == false) {
                  validationmsg.alertmsg(context, 'invalid email');
                } else {
                  return null;
                }
              },
            ),
            // MYinputfield(
            //   mycontroller: departmentcontroller,
            //   prefixicon: Icon(Icons.home),
            //   label: 'Department',
            //   texthint: "depaerment",
            //   validation: (value) {
            //     if (value.isEmpty == true || value == null) {
            //       return 'please inter Department';
            //     } else {
            //       return null;
            //     }
            //   },
            // ),
            // MYinputfield(
            //   mycontroller: passwordcontroller,
            //   validation: (value) {
            //      if (value.isEmpty == false) {
            //   emailvalidation.checkmail(value.toString());
            //   return "please inter valid email";
            // } else {
            //   return 'inter email';
            // }
            //   },
            //   shopass: shopass1,
            //   prefixicon: Icon(Icons.lock),
            //   sufixicon: IconButton(
            //     onPressed: () {
            //       if (shopass1 == true) {
            //         shopass1 = false;
            //         setState(() {});
            //       } else {
            //         shopass1 = true;
            //         setState(() {});
            //       }
            //     },
            //     icon: Icon(
            //         shopass1 ? Icons.visibility_off : Icons.remove_red_eye),
            //   ),
            //   label: 'Password1',
            //   texthint: "password1",
            // ),
            MYinputfield(
              mycontroller: confirmpasswordcontroller,
              validation: (value) {
                if (value.isEmpty == false && value.length <= 6) {
                  passvalidation.checkpass(value);
                  validationmsg.alertmsg(
                      context, 'password must be grather \n than 6 digits');
                }
                if (value.isEmpty == true) {
                  validationmsg.alertmsg(context, 'please inter password');
                }
              },
              prefixicon: Icon(Icons.lock),
              shopass: shopass2,
              sufixicon: IconButton(
                onPressed: () {
                  if (shopass2 == true) {
                    shopass2 = false;
                    setState(() {});
                  } else {
                    shopass2 = true;
                    setState(() {});
                  }
                },
                icon: Icon(
                  shopass2 ? Icons.visibility_off : Icons.remove_red_eye,
                  color: shopass2 ? Colors.black45 : Colors.cyan,
                ),
              ),
              label: 'Password2',
              texthint: "password2",
            ),
            SizedBox(
              height: 50,
            ),
            MYbutton(
              loader: loading,
              buttonname: 'create an account',
              customwidth: 200.0,
              onpress: () {
                if (formkey.currentState!.validate()) {
                  print('from validate');
                  setState(() {
                    loading = true;
                  });
                  try {
                    auth
                        .createUserWithEmailAndPassword(
                            email: emailcontroller.text.toString(),
                            password: confirmpasswordcontroller.text.toString())
                        .then((value) {
                      print('user register succesfuly');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loginscreen()));
                    }).onError((error, stackTrace) {
                      print(error.toString());
                    });
                  } catch (e) {
                    print(Exception(e));
                  }
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            divider.mydevider(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "already have an account ?",
                style: TextStyle(fontSize: 19),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginscreen()));
                  },
                  child: Text(
                    "login",
                    style: TextStyle(fontSize: 19),
                  ))
            ])
          ],
        ),
      )),
    );
  }
}

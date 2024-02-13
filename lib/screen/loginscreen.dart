import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/screen/forgetpassscreen.dart';
import 'package:firebase_project/screen/homescreen.dart';
import 'package:firebase_project/screen/phoneloginscreen.dart';
import 'package:firebase_project/screen/signupscreen.dart';
import 'package:flutter/material.dart';

import '../component/globalfunctions.dart';
import '../component/mycomponent.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  toast mytoast = toast();
  devider divider = devider();
  final formkey = GlobalKey<FormState>();
  bool loginpass = false;
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final emailcontroller = TextEditingController();
  final passwcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: draver.mydraver(),
      appBar: AppBar(
        title: Text('loginscreen'),
        // automaticallyImplyLeading: false,
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
              MYinputfield(
                  mycontroller: emailcontroller,
                  label: 'your email',
                  texthint: 'Email',
                  prefixicon: Icon(
                    Icons.email_outlined,
                    size: 30,
                  ),
                  validation: (value) {
                    if (value.isEmpty == true) {
                      validationmsg.alertmsg(context, 'please inter Email');
                    }
                    if (emailvalidation.checkmail(value) == false) {
                      validationmsg.alertmsg(context, 'invalid email');
                    } else {
                      return null;
                    }
                    // if (value.isEmpty != false ||
                    //                     emailvalidation.checkmail(value.toString()) == true) {
                    //                   return "please inter valid email";
                    //                 } else {
                    //                   return 'inter email';
                    //                 }
                    //               }
                  }),
              MYinputfield(
                mycontroller: passwcontroller,
                shopass: loginpass,
                label: 'your pass password',
                texthint: 'inter your password',
                prefixicon: Icon(Icons.lock),
                sufixicon: IconButton(
                  onPressed: () {
                    if (loginpass == true) {
                      loginpass = false;
                      setState(() {});
                    } else {
                      loginpass = true;
                      setState(() {});
                    }
                  },
                  icon: Icon(
                    loginpass ? Icons.visibility_off : Icons.remove_red_eye,
                    color: loginpass ? Colors.black45 : Colors.cyan,
                  ),
                ),
                validation: (value) {
                  if (value.isEmpty == true) {
                    validationmsg.alertmsg(context, 'please inter Password');
                  } else {
                    return null;
                  }
                  // if (value) {}
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPassword()));
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              MYbutton(
                loader: loading,
                buttonname: 'login',
                onpress: () {
                  if (formkey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    auth
                        .signInWithEmailAndPassword(
                            email: emailcontroller.text.toString(),
                            password: passwcontroller.text.toString())
                        .then((value) {
                      setState(() {
                        loading = false;
                      });
                      mytoast.shosuccmsg(value.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homescreen()));
                    }).onError((error, stackTrace) {
                      setState(() {
                        loading = false;
                      });
                      mytoast.shoerrmsg(error.toString());
                      print(error.toString());
                    });
                  }
                },
              ),
              SizedBox(height: 50),
              divider.mydevider(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "don't have an account ?",
                  style: TextStyle(fontSize: 19),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signupscreen()));
                    },
                    child: Text(
                      "sign up",
                      style: TextStyle(fontSize: 19),
                    ))
              ]),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => phoneloginscreen()));
                  },
                  child: Text(
                    'log in with phone',
                    style: TextStyle(fontSize: 20, color: Colors.black45),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

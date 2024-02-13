// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../component/globalfunctions.dart';
import '../component/mycomponent.dart';

class showadduserdilog {
  static showadduserdiloguefun(context) {
    final formkey = GlobalKey<FormState>();
    bool loading = false;
    var msg = '';
    final databaseref = FirebaseDatabase.instance.ref("users");
    toast mytoast = toast();
// controllers

    final usernamecontroller = TextEditingController();
    final emailcontroller = TextEditingController();
    final departmentcontroller = TextEditingController();
    final citycontroller = TextEditingController();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 7,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 255, 255, 255)),
                height: 400,
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -25,
                          right: -21,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 236, 31, 16),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                child: Center(
                                  child: Text(
                                    'Add Record',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Form(
                                  key: formkey,
                                  child: Column(
                                    children: [
                                      MYinputfield(
                                        mycontroller: usernamecontroller,
                                        label: 'Username',
                                        prefixicon: Icon(Icons.person),
                                        validation: (val) {
                                          if (val.isEmpty == true &&
                                              msg.isEmpty == true) {
                                            msg = 'please inter username';

                                            if (msg.isEmpty == false) {
                                              validationmsg.alertmsg(
                                                  context, msg.toString());
                                            }
                                          }
                                        },
                                      ),
                                      MYinputfield(
                                        mycontroller: emailcontroller,
                                        label: 'Email',
                                        prefixicon: Icon(Icons.email),
                                        validation: (val) {
                                          if (val.isEmpty == true &&
                                              msg.isEmpty == true) {
                                            msg = "please inter Email";
                                            if (msg.isEmpty == false) {
                                              validationmsg.alertmsg(
                                                  context, msg.toString());
                                            }
                                          }
                                        },
                                      ),
                                      MYinputfield(
                                        mycontroller: departmentcontroller,
                                        label: 'Deparment',
                                        prefixicon: Icon(Icons.school_sharp),
                                        validation: (dynamic val) {
                                          if (val.isEmpty == true &&
                                              msg.isEmpty == true) {
                                            msg = 'please inter Department';
                                            if (msg.isEmpty == false) {
                                              validationmsg.alertmsg(
                                                  context, msg.toString());
                                            }
                                          }
                                        },
                                      ),
                                      MYinputfield(
                                        mycontroller: citycontroller,
                                        label: 'City',
                                        prefixicon: Icon(Icons.location_city),
                                        validation: (var val) {
                                          if (val.isEmpty == true &&
                                              msg.isEmpty == true) {
                                            msg = 'please inter City';
                                            if (msg.isEmpty == false) {
                                              validationmsg.alertmsg(
                                                  context, msg.toString());
                                            }
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "Cancle",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        //function from globalfunction for data insertion
                                        // userregistration.userregistrationfun();
                                        if (msg.isEmpty == false) {
                                          return validationmsg.alertmsg(
                                              context, msg);
                                        } else {
                                          if (formkey.currentState!
                                              .validate()) {
                                            final id = DateTime.now()
                                                .millisecondsSinceEpoch
                                                .toString();
                                            databaseref.child(id).set({
                                              'Username': usernamecontroller
                                                  .text
                                                  .toString(),
                                              'Email': emailcontroller.text
                                                  .toString(),
                                              'Department': departmentcontroller
                                                  .text
                                                  .toString(),
                                              'City':
                                                  citycontroller.text.toString()
                                            }).then((value) {
                                              usernamecontroller.clear();
                                              emailcontroller.clear();
                                              departmentcontroller.clear();
                                              citycontroller.clear();
                                              msg = '';
                                              mytoast.shosuccmsg(
                                                  'Registered successfuly');
                                            }).onError((error, stackTrace) {
                                              mytoast
                                                  .shoerrmsg(error.toString());
                                            });
                                          }
                                        }
                                      },
                                      child: loading == true
                                          ? CircularProgressIndicator()
                                          : Text('Register',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17)))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          );
        });
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_project/component/globalfunctions.dart';
import 'package:firebase_project/component/mycomponent.dart';
import 'package:firebase_project/screen/adduserscrreen.dart';
// import 'package:firebase_project/screen/loginscreen.dart';
// import 'package:firebase_project/screen/loginscreen.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final databaseref = FirebaseDatabase.instance.ref("users");
  final formkey = GlobalKey<FormState>();
  final toast mytoast = toast();
  // controller insert
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final departmentcontroller = TextEditingController();
  final citycontroller = TextEditingController();
  // update controller asign value to ucontroller to shovv previous data

  final uusernamecontroller = TextEditingController();
  final uemailcontroller = TextEditingController();
  final udepartmentcontroller = TextEditingController();
  final ucitycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showadduserdilog.showadduserdiloguefun(context);
            },
            child: Icon(Icons.add),
          ),
          drawer: draver.mydraver(),
          appBar: AppBar(
            title: Text('H O M E  S C R E E N'),
            actions: [
              IconButton(
                  onPressed: () {
                    final user = auth.currentUser;
                    if (user == null) {
                      return null;
                    } else {
                      logoutbox.mydilogue(context);
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return Dialog(
                      //         backgroundColor:
                      //             Color.fromARGB(255, 241, 238, 238)
                      //                 .withOpacity(0.7),
                      //         shape: BeveledRectangleBorder(
                      //             borderRadius: BorderRadius.circular(6)),
                      //         child: Container(
                      //           height: 120,
                      //           decoration: BoxDecoration(
                      //               color: Color.fromARGB(255, 226, 222, 222)
                      //                   .withOpacity(.1),
                      //               borderRadius: BorderRadius.circular(12)),
                      //           child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             children: [
                      //               SizedBox(
                      //                 height: 10,
                      //               ),
                      //               Container(
                      //                   child: Center(
                      //                       child: Padding(
                      //                 padding: const EdgeInsets.only(top: 10),
                      //                 child: Text(
                      //                   ' Sure to logout ?',
                      //                   style: TextStyle(
                      //                       fontSize: 26,
                      //                       fontWeight: FontWeight.w800),
                      //                 ),
                      //               ))),
                      //               SizedBox(
                      //                 height: 20,
                      //               ),
                      //               Container(
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.end,
                      //                   children: [
                      //                     TextButton(
                      //                         onPressed: () {
                      //                           Navigator.of(context).pop();
                      //                         },
                      //                         child: Text(
                      //                           'NO',
                      //                           style: TextStyle(
                      //                               fontSize: 18,
                      //                               color: Colors.red),
                      //                         )),
                      //                     SizedBox(
                      //                       width: 20,
                      //                     ),
                      //                     TextButton(
                      //                         onPressed: () {
                      //                           auth.signOut();
                      //                           Navigator.push(
                      //                               context,
                      //                               MaterialPageRoute(
                      //                                   builder: (context) =>
                      //                                       loginscreen()));
                      //                         },
                      //                         child: Text(
                      //                           'YES   ',
                      //                           style: TextStyle(
                      //                               fontSize: 19,
                      //                               color: Color.fromARGB(
                      //                                   255, 0, 15, 151)),
                      //                         ))
                      //                   ],
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     });
                    }

                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return Dialog(
                    //         elevation: 7,
                    //         shape: BeveledRectangleBorder(
                    //             borderRadius: BorderRadius.circular(6.0)),
                    //         child: Container(
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(20),
                    //                 color: Color.fromARGB(255, 255, 255, 255)),
                    //             height: 400,
                    //             child: Column(
                    //               children: [
                    //                 Stack(
                    //                   clipBehavior: Clip.none,
                    //                   children: [
                    //                     Positioned(
                    //                       top: -25,
                    //                       right: -21,
                    //                       child: Container(
                    //                         height: 40,
                    //                         width: 40,
                    //                         decoration: BoxDecoration(
                    //                             color: const Color.fromARGB(
                    //                                 255, 236, 31, 16),
                    //                             borderRadius:
                    //                                 BorderRadius.circular(30)),
                    //                         child: Center(
                    //                           child: IconButton(
                    //                               onPressed: () {
                    //                                 Navigator.of(context).pop();
                    //                               },
                    //                               icon: Icon(
                    //                                 Icons.remove,
                    //                                 color: Colors.white,
                    //                               )),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       child: Column(
                    //                         children: [
                    //                           SizedBox(
                    //                             height: 16,
                    //                           ),
                    //                           Container(
                    //                             child: Center(
                    //                               child: Text(
                    //                                 'Add Record',
                    //                                 style: TextStyle(
                    //                                     fontSize: 22,
                    //                                     fontWeight:
                    //                                         FontWeight.w700),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           SizedBox(
                    //                             height: 20,
                    //                           ),
                    //                           Container(
                    //                             child: Form(
                    //                               key: formkey,
                    //                               child: Column(
                    //                                 children: [
                    //                                   MYinputfield(
                    //                                     mycontroller:
                    //                                         usernamecontroller,
                    //                                     label: 'Username',
                    //                                     prefixicon:
                    //                                         Icon(Icons.person),
                    //                                     validation: (val) {
                    //                                       if (val.isEmpty ==
                    //                                           true) {
                    //                                         return 'please inter username';
                    //                                       }
                    //                                     },
                    //                                   ),
                    //                                   MYinputfield(
                    //                                     mycontroller:
                    //                                         emailcontroller,
                    //                                     label: 'Email',
                    //                                     prefixicon:
                    //                                         Icon(Icons.email),
                    //                                     validation: (val) {
                    //                                       if (val.isEmpty ==
                    //                                           true) {
                    //                                         return 'please inter email';
                    //                                       }
                    //                                     },
                    //                                   ),
                    //                                   MYinputfield(
                    //                                     mycontroller:
                    //                                         departmentcontroller,
                    //                                     label: 'Deparment',
                    //                                     prefixicon: Icon(
                    //                                         Icons.school_sharp),
                    //                                     validation: (val) {
                    //                                       if (val.isEmpty ==
                    //                                           true) {
                    //                                         return 'please inter department';
                    //                                       }
                    //                                     },
                    //                                   ),
                    //                                   MYinputfield(
                    //                                     mycontroller:
                    //                                         citycontroller,
                    //                                     label: 'City',
                    //                                     prefixicon: Icon(
                    //                                         Icons.location_city),
                    //                                     validation: (val) {
                    //                                       if (val.isEmpty ==
                    //                                           true) {
                    //                                         return 'please inter city';
                    //                                       }
                    //                                     },
                    //                                   )
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           SizedBox(
                    //                             height: 20,
                    //                           ),
                    //                           Row(
                    //                             mainAxisAlignment:
                    //                                 MainAxisAlignment.spaceAround,
                    //                             children: [
                    //                               ElevatedButton(
                    //                                   onPressed: () {
                    //                                     Navigator.of(context)
                    //                                         .pop();
                    //                                   },
                    //                                   child: Text(
                    //                                     "Cancle",
                    //                                     style: TextStyle(
                    //                                         color: Colors.white,
                    //                                         fontSize: 17),
                    //                                   )),
                    //                               ElevatedButton(
                    //                                   onPressed: () {
                    //                                     if (formkey.currentState!
                    //                                         .validate()) {
                    //                                       setState(() {
                    //                                         loading = true;
                    //                                       });
                    //                                       final id = DateTime
                    //                                               .now()
                    //                                           .millisecondsSinceEpoch
                    //                                           .toString();
                    //                                       databaseref
                    //                                           .child(id)
                    //                                           .set({
                    //                                         'id': id,
                    //                                         'Username':
                    //                                             usernamecontroller
                    //                                                 .text
                    //                                                 .toString(),
                    //                                         'Email':
                    //                                             emailcontroller
                    //                                                 .text
                    //                                                 .toString(),
                    //                                         'Department':
                    //                                             departmentcontroller
                    //                                                 .text
                    //                                                 .toString(),
                    //                                         'City': citycontroller
                    //                                             .text
                    //                                             .toString()
                    //                                       }).then((value) {
                    //                                         setState(() {
                    //                                           loading = false;
                    //                                         });
                    //                                         usernamecontroller
                    //                                             .clear();
                    //                                         emailcontroller
                    //                                             .clear();
                    //                                         departmentcontroller
                    //                                             .clear();
                    //                                         citycontroller
                    //                                             .clear();
                    //                                         mytoast.shosuccmsg(
                    //                                             'Record added');
                    //                                       }).onError((error,
                    //                                               stackTrace) {
                    //                                         setState(() {
                    //                                           loading = false;
                    //                                         });
                    //                                         mytoast.shoerrmsg(
                    //                                             error.toString());
                    //                                       });
                    //                                     }
                    //                                   },
                    //                                   child: loading == true
                    //                                       ? CircularProgressIndicator()
                    //                                       : Text('Save',
                    //                                           style: TextStyle(
                    //                                               color: Colors
                    //                                                   .white,
                    //                                               fontSize: 17)))
                    //                             ],
                    //                           )
                    //                         ],
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //               ],
                    //             )),
                    //       );
                    //     });
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => loginscreen()));
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: FirebaseAnimatedList(
                    query: databaseref,
                    itemBuilder: (context, Snapshot, animation, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 165,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(59, 187, 170, 170)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Username',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(Snapshot.child('Username')
                                            .value
                                            .toString())
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Email',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        Text(Snapshot.child('Email')
                                            .value
                                            .toString())
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Department',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        Text(Snapshot.child('Department')
                                            .value
                                            .toString())
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('City',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        Text(Snapshot.child('City')
                                            .value
                                            .toString())
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            uusernamecontroller.text =
                                                Snapshot.child('Username')
                                                    .value
                                                    .toString();
                                            uemailcontroller.text =
                                                Snapshot.child('Email')
                                                    .value
                                                    .toString();
                                            udepartmentcontroller.text =
                                                Snapshot.child('Department')
                                                    .value
                                                    .toString();
                                            ucitycontroller.text =
                                                Snapshot.child('City')
                                                    .value
                                                    .toString();
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    elevation: 7,
                                                    shape:
                                                        BeveledRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255)),
                                                        height: 400,
                                                        child: Column(
                                                          children: [
                                                            Stack(
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                Positioned(
                                                                  top: -25,
                                                                  right: -21,
                                                                  child:
                                                                      Container(
                                                                    height: 40,
                                                                    width: 40,
                                                                    decoration: BoxDecoration(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            145,
                                                                            186,
                                                                            233),
                                                                        borderRadius:
                                                                            BorderRadius.circular(30)),
                                                                    child:
                                                                        Center(
                                                                      child: IconButton(
                                                                          onPressed: () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          icon: Icon(
                                                                            Icons.cancel,
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                255,
                                                                                2,
                                                                                2),
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Column(
                                                                    children: [
                                                                      SizedBox(
                                                                        height:
                                                                            16,
                                                                      ),
                                                                      Container(
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            'Update Record',
                                                                            style:
                                                                                TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      Container(
                                                                        child:
                                                                            Form(
                                                                          key:
                                                                              formkey,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              MYinputfield(
                                                                                mycontroller: uusernamecontroller,
                                                                                //
                                                                                //
                                                                                //
                                                                                prefixicon: Icon(Icons.person),
                                                                                validation: (val) {
                                                                                  if (val.isEmpty == true) {
                                                                                    validationmsg.alertmsg(context, 'please inter Username');
                                                                                  } else {
                                                                                    return null;
                                                                                  }
                                                                                },
                                                                              ),
                                                                              MYinputfield(
                                                                                mycontroller: uemailcontroller,
                                                                                label: 'Email',
                                                                                prefixicon: Icon(Icons.email),
                                                                                validation: (val) {
                                                                                  if (val.isEmpty == true) {
                                                                                    validationmsg.alertmsg(context, 'please inter Email');
                                                                                  } else {
                                                                                    return null;
                                                                                  }
                                                                                },
                                                                              ),
                                                                              MYinputfield(
                                                                                mycontroller: udepartmentcontroller,
                                                                                label: 'Deparment',
                                                                                prefixicon: Icon(Icons.school_sharp),
                                                                                validation: (val) {
                                                                                  if (val.isEmpty == true) {
                                                                                    validationmsg.alertmsg(context, 'please inter Department');
                                                                                  } else {
                                                                                    return null;
                                                                                  }
                                                                                },
                                                                              ),
                                                                              MYinputfield(
                                                                                mycontroller: ucitycontroller,
                                                                                label: 'City',
                                                                                prefixicon: Icon(Icons.location_city),
                                                                                validation: (val) {
                                                                                  if (val.isEmpty == true) {
                                                                                    validationmsg.alertmsg(context, 'please inter City');
                                                                                  } else {
                                                                                    return null;
                                                                                  }
                                                                                },
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20,
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
                                                                                style: TextStyle(color: Colors.white, fontSize: 17),
                                                                              )),
                                                                          ElevatedButton(
                                                                              onPressed: () {
                                                                                if (formkey.currentState!.validate()) {
                                                                                  setState(() {
                                                                                    loading = true;
                                                                                  });
                                                                                  databaseref.child(Snapshot.child('id').value.toString()).update({
                                                                                    // 'id': id,
                                                                                    'Username': uusernamecontroller.text.toString(),
                                                                                    'Email': uemailcontroller.text.toString(),
                                                                                    'Department': udepartmentcontroller.text.toString(),
                                                                                    'City': ucitycontroller.text.toString()
                                                                                  }).then((value) {
                                                                                    setState(() {
                                                                                      loading = false;
                                                                                    });
                                                                                    uusernamecontroller.clear();
                                                                                    uemailcontroller.clear();
                                                                                    udepartmentcontroller.clear();
                                                                                    ucitycontroller.clear();
                                                                                    mytoast.shosuccmsg('Record updated');
                                                                                  }).onError((error, stackTrace) {
                                                                                    setState(() {
                                                                                      loading = false;
                                                                                    });
                                                                                    mytoast.shoerrmsg(error.toString());
                                                                                  });
                                                                                }
                                                                              },
                                                                              child: loading == true ? CircularProgressIndicator() : Text('Update', style: TextStyle(color: Colors.white, fontSize: 17)))
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
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                          )),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            databaseref
                                                .child(Snapshot.child('id')
                                                    .value
                                                    .toString())
                                                .remove();
                                            // Navigator.of(context).pop();
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../screen/loginscreen.dart';

// drawer for all screen
class draver {
  static mydraver() {
    return Container(
      margin: EdgeInsets.only(bottom: 200),
      height: 650,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage('assets/images/draver.jpg'),
                          fit: BoxFit.cover)),
                  child: Container(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/chachu.jpeg'),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Codecafe.pk@gmail.com',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  )),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(186, 0, 0, 0)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text(
                "Contact us",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(186, 0, 0, 0)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text(
                "About us",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(186, 0, 0, 0)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Setting",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(186, 0, 0, 0)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                "Create account",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(186, 0, 0, 0)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: Text(
                'Copywrite 2023 by codecafe',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(185, 49, 46, 46)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// devider having OR between
class devider {
  mydevider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.black38,
            height: 10,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
        ),
        Container(
          child: Text(
            'OR',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Divider(
            indent: 20,
            endIndent: 20,
            height: 10,
            thickness: 1,
            color: Colors.black38,
          ),
        )
      ],
    );
  }
}

// toast error and success message
class toast {
  shoerrmsg(String error) {
    return Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 18.0);
  }

  shosuccmsg(String error) {
    return Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        textColor: Colors.green,
        fontSize: 18.0);
  }
}

// validate email
class emailvalidation {
  static bool checkmail(String value) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(value.toString());
  }
}

//password validation only int
class passvalidation {
  static checkpass(String pass) {
    return RegExp(r'^[0-9]+$').hasMatch(pass);
  }
}

// logout alert box
class logoutbox {
  static mydilogue(context) {
    final auth = FirebaseAuth.instance;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor:
                Color.fromARGB(255, 241, 238, 238).withOpacity(0.7),
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 222, 222).withOpacity(.1),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Center(
                          child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      ' Sure to logout ?',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                    ),
                  ))),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'NO',
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              auth.signOut();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => loginscreen()));
                            },
                            child: Text(
                              'YES   ',
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 0, 15, 151)),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

// validation error message
class validationmsg {
  static alertmsg(context, String msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
              'Validation Errors',
              style: TextStyle(
                  fontSize: 21, fontWeight: FontWeight.w600, color: Colors.red),
            )),
            content: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 220, 221, 233).withOpacity(.5),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                    child: Text(
                  msg,
                  style: TextStyle(fontSize: 19, color: Colors.black87),
                )),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ))
            ],
          );
        });
  }
}

// data insertion into firebase database but seperate fun not vorking
class userregistration {
  static userregistrationfun() async {
    // key and databaase reference

    final formkey = GlobalKey<FormState>();
    final databaseref = FirebaseDatabase.instance.ref("users");
    toast mytoast = toast();

    //controllers
    final usernamecontroller = TextEditingController();
    final emailcontroller = TextEditingController();
    final departmentcontroller = TextEditingController();
    final citycontroller = TextEditingController();
    // validation condition

    if (formkey.currentState!.validate()) {
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      databaseref.child(id).set({
        'Username': usernamecontroller.text.toString(),
        'Email': emailcontroller.text.toString(),
        'Department': departmentcontroller.text.toString(),
        'City': citycontroller.text.toString()
      }).then((value) {
        usernamecontroller.clear();
        emailcontroller.clear();
        departmentcontroller.clear();
        citycontroller.clear();
        mytoast.shosuccmsg('Record added');
      }).onError((error, stackTrace) {
        mytoast.shoerrmsg(error.toString());
      });
    } else {
      print('recond not edded');
    }
  }
}

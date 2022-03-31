import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class OwnerLogin extends StatefulWidget {
  const OwnerLogin({Key key}) : super(key: key);

  @override
  _OwnerLoginState createState() => _OwnerLoginState();
}

class _OwnerLoginState extends State<OwnerLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final _formkey = GlobalKey<FormState>();


  @override
  void initState() {
    FirebaseAuth.instance.signOut();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection:TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color:Colors.white,
            child: Form(
              key: _formkey,
              child: ListView(
                children: [
                  SizedBox(height: 50),
                  Container(
                      height: 160,
                      child: Image.asset('assets/wh3.jpeg')),
                  SizedBox(height: 50),
                  TextFormField(
                      controller: email,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w900),
                      decoration: InputDecoration(
                          hintText: 'الايميل الخاص بهذا المتجر',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          )),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'ادخل الايميل ';
                        }
                      }),
                  SizedBox(height: 15),
                  TextFormField(
                      controller: pass,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w900),
                      decoration: InputDecoration(
                          hintText: 'كلمة المرور للمتجر ',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          )),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'ادخل كلمة المرور ';
                        }
                      }),
                  SizedBox(height: 45),
                  Container(
                      width: 200,
                      child: RaisedButton(
                          color: Colors.white,
                          shape: StadiumBorder(),
                          splashColor: Colors.red,
                          child: Text(
                            'تسجيل التاجر ',
                            style: TextStyle(color: Colors.black, fontSize: 21,fontWeight:FontWeight.w800),
                          ),
                          onPressed: () async {


    FirebaseAuth _auth = FirebaseAuth.instance;
    if (_formkey.currentState.validate()) {
          await _auth
                .createUserWithEmailAndPassword(
                email: email.text, password: pass.text)
                .then((user) async {
              print("user]]]" + user.user.email);
              await Flushbar(
                backgroundColor:Colors.red,
                title: 'ok',
                message:
                'تم تسجيل المتجر بنجاح',
                duration: Duration(seconds: 3),
              ).show(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Home(

                    );
                    // Steper();
                  }));

          }

          );
    }

                          }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
// FirebaseAuth.instance.signOut();
//
// await _auth
//     .createUserWithEmailAndPassword(email: email.text, password: pass.text)
// .then((user) async {
// print("user]]]"+user.user.email);
// });
//
//
//

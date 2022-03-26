import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trainpdf_app/app/admin_screen.dart';
import 'package:trainpdf_app/app/all_requests.dart';
import 'package:trainpdf_app/app/brands_requests.dart';
import 'package:trainpdf_app/app/owner_login.dart';
import 'package:trainpdf_app/app/requests.dart';
import 'package:trainpdf_app/app/requests_responses.dart';

import 'admin_brands.dart';
import 'admin_posts.dart';
import 'admin_screen2.dart';

class Home extends StatelessWidget {

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: new Text(
              " لوحة التحكم",
              style: TextStyle(
                  color: Colors.black, fontSize: 23, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: Container(
            child: Container(
                color: Colors.white,
                child:  ListView(
               //   crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    Container(

                      width:400,
                      height:290,
                        child: Image.asset(
                      "assets/wh3.jpeg",
                    )),
                    SizedBox(
                      height: 10
                    ),
                    Container(
                        width: 170,
                        child: FlatButton(
                          color: Colors.black,
                          child: Text(
                            " تسجيل متجر ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          textColor: Colors.white,
                          onPressed: () async {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return OwnerLogin();
                                }));
                          },
                        )),
                    SizedBox(
                      height:11,
                    ),

                    Container(
                        width: 170,
                        child: FlatButton(
                          color: Colors.black,
                          child: Text(
                            " اضافة متجر ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          textColor: Colors.white,
                          onPressed: () async {
                            // try {
                            //   await _auth
                            //       .signInWithEmailAndPassword(email:"admin@luban2022.com", password:'123456789');
                            // } catch (e) {
                            //  print(e);
                            // }



                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AdminScreen();
                   
                            }));
                          },
                        )),
                    SizedBox(
                      height:11,
                    ),

                    Container(
                        width: 170,
                        child: FlatButton(
                          color: Colors.black,
                          child: Text(
                            " اضافة منتج ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          textColor: Colors.white,
                          onPressed: () {



                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return AdminScreen2();

                                }));
                          },
                        )),
                    SizedBox(
                      height:11,
                    ),

                    Container(
                        width: 170,
                        child: FlatButton(
                          color: Colors.black,
                          child: Text(
                            "  المتاجر ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AdminBrands();
                            }));
                          },
                        )),
                    // SizedBox(
                    //   height:11,
                    // ),
                    //
                    // Container(
                    //     width: 170,
                    //     child: FlatButton(
                    //       color: Colors.black,
                    //       child: Text(
                    //         " المنتجات ",
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //       textColor: Colors.white,
                    //       onPressed: () {
                    //         Navigator.push(context,
                    //             MaterialPageRoute(builder: (context) {
                    //               return AllProductsView();
                    //
                    //             }));
                    //       },
                    //     )),
                    SizedBox(
                      height:11,
                    ),

                    Container(
                        width: 170,
                        child: FlatButton(
                          color: Colors.black,
                          child: Text(
                            " الطلبات ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return  OrdersRequest();

                                }));
                          },
                        )),
                    SizedBox(
                      height:6
                    ),


                    // Container(
                    //     width: 170,
                    //     child: FlatButton(
                    //       color: Colors.black,
                    //       child: Text(
                    //         " الطلبات التي غيرت حالتها  ",
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //       textColor: Colors.white,
                    //       onPressed: () {
                    //         Navigator.push(context,
                    //             MaterialPageRoute(builder: (context) {
                    //               return  OrdersRequest2();

                    //             }));
                    //       },
                    //     )),


                    // Container(
                    //     width: 170,
                    //     child: FlatButton(
                    //       color: Colors.black,
                    //       child: Text(
                    //         "جميع الطلبات ",
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //       textColor: Colors.white,
                    //       onPressed: () {
                    //         Navigator.push(context,
                    //             MaterialPageRoute(builder: (context) {
                    //               return   AllRequests2();

                    //             }));
                    //       },
                    //     )),
                    SizedBox(
                      height:11,
                    ),

                    Container(
                        width: 170,
                        child: FlatButton(
                          color: Colors.black,
                          child: Text(
                            " طلبات خاصة للتجار ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return   AllRequest();

                                }));
                          },
                        )),
                    SizedBox(
                      height:11,
                    ),

                  ],
                ))));
  }
}

import 'package:flutter/material.dart';
import 'package:trainpdf_app/app/admin_screen.dart';

import 'admin_brands.dart';
import 'admin_posts.dart';
import 'admin_screen2.dart';

class Home extends StatelessWidget {
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    Container(

                        child: Image.asset(
                      "assets/p1.jfif",
                    )),
                    SizedBox(
                      height: 15
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
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AdminScreen();
                   
                            }));
                          },
                        )),
                    SizedBox(
                        height: 15
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
                          height:10
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
                    SizedBox(
                        height:10
                    ),
                    Container(
                        width: 170,
                        child: FlatButton(
                          color: Colors.black,
                          child: Text(
                            " المنتجات ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return AllProductsView();

                                }));
                          },
                        )),
                  ],
                ))));
  }
}

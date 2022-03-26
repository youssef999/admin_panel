import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trainpdf_app/app/edit_product.dart';
import 'package:trainpdf_app/app/home.dart';
import 'admin_brands.dart';
import 'admin_posts.dart';

class Action88 extends StatefulWidget {
  final name;
  final des;
  final cat;
  final img;
  num price,price2,price3,price4,price5,price6;
  final brand,brandemail;

  Action88(
      {this.name, this.des, this.cat, this.img,this.price2,
      this.price3,this.price4,this.price5,this.price6,this.brand,this.brandemail, this.price}
      );

  @override
  _Action_State createState() => _Action_State();
}

class _Action_State extends State<Action88> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool clicked=false;
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            backgroundColor: Colors.grey[850],
            iconTheme: IconThemeData(color: Colors.white),
            title: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.grey[850],
                  Colors.grey[850],
                ])),
                height: 30,
                child: Center(
                    child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),

                    Text("Al Rawan",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 19)),

                    //  Text("  Broker",style:TextStyle(color:Colors.lightBlue,fontWeight:FontWeight.bold,fontSize:21)),
                  ],
                ))),
            //backgroundColor: Colors.lightBlueAccent,
            actions: <Widget>[
              SizedBox(
                height: 10,
              ),
            ]),
        body: Container(
          color: Colors.white,
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    // color:Colors.lightBlueAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: size.width * 0.6,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: size.width * 0.75,
                              width: size.width * 0.75,
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                shape: BoxShape.circle,
                              ),
                            ),
                            Image.network(
                              widget.img,
                              height: size.width * 0.75,
                              width: size.height * 0.52,
                              fit: BoxFit.fill,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0 / 2),
                      child: Text(
                        widget.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(24.0),
                //  padding: EdgeInsets.symmetric(horizontal: 20.0,
                //   vertical: 20.0 / 2),
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton.icon(

                        onPressed: () {



                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return EditProducts(
                                    brand: widget.brand,
                                    img:widget.img,
                                    brandemail: widget.brandemail,
                                    cat:widget.cat,
                                    des: widget.des,
                                    name: widget.name,
                                    price2: widget.price2,
                                    price3:widget.price3,
                                    price4: widget.price4,
                                    price5: widget.price5,
                                    price6: widget.price6,
                                    price: widget.price,



                                );
                              }));
                        },
                        icon: Icon(
                          Icons.code,
                          color: Colors.redAccent,
                          size: 32,
                        ),
                        height: 12,
                        // width:50,

                        label: Text(
                          " تعديل ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(24.0),
                //  padding: EdgeInsets.symmetric(horizontal: 20.0,
                //   vertical: 20.0 / 2),
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton.icon(



                        onPressed: () async {
                          if(clicked==false) {
                            clicked=true;
                            Firestore.instance
                                .collection('products')
                                .where("image", isEqualTo: widget.img)
                                .get()
                                .then((snapshot) async {
                              snapshot.docs.last.reference.delete().then((
                                  value) async {
                                // await Flushbar(
                                //
                                //   flushbarPosition: FlushbarPosition.TOP,
                                //   backgroundColor: Colors.red,
                                //   title: 'ok',
                                //   message:
                                //   'تم الحذف',
                                //   duration: Duration(seconds: 3),
                                // ).show(context);
                              });
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                    return AdminBrands();
                                  }));

                              await Flushbar(

                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Colors.red,
                                  title: 'ok',
                                  message:
                                  'تم الحذف',
                                  duration: Duration(seconds: 3),
                              ).show(context);

                            });
                          }
                          else{
                            await Flushbar(

                                flushbarPosition: FlushbarPosition.BOTTOM,
                                backgroundColor: Colors.blue,
                                title: '!!!!!!!!!!!',
                                message:
                                'انتظر قليلا جاري المسح الان ',
                                duration: Duration(seconds: 3),
                          ).show(context);
                          }
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                          size: 32,
                        ),
                        height: 12,
                        // width:50,

                        label: Text(
                          " حذف ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

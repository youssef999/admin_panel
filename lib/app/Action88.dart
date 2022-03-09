import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'admin_posts.dart';

class Action88 extends StatefulWidget {
  final name;
  final des;
  final cat;
  final img;

  Action88(this.name, this.des, this.cat, this.img);

  @override
  _Action_State createState() => _Action_State();
}

class _Action_State extends State<Action88> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                          Firestore.instance
                              .collection('products')
                              .where("image", isEqualTo: widget.img)
                              .get()
                              .then((snapshot) {
                            snapshot.docs.last.reference.delete();
                          });

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return AllProductsView();
                          }));
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                          size: 32,
                        ),
                        height: 12,
                        // width:50,

                        label: Text(
                          " delete ",
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

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trainpdf_app/app/edit_product.dart';
import 'admin_posts.dart';
import 'edit_brand.dart';
import 'home.dart';

class Action99 extends StatefulWidget {
  final name;
  final des;
  final cat,cat2,cat3;
  final img;
  final email;
  final pic;
  final offers;

  Action99({this.name , this.cat,this.cat2,this.cat3, this.img,this.email,this.offers, this.des,this.pic });

  @override
  _Action_State createState() => _Action_State();
}

class _Action_State extends State<Action99> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar:AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text("Luban   ",style:TextStyle(color:Colors.lightGreen,fontSize:22,
                  fontWeight:FontWeight.w700
              ),),
              SizedBox(
                width: 80,
              ),
              Text("لبان   ",style:TextStyle(color:Colors.lightGreen,fontSize:22,
                  fontWeight:FontWeight.w700

              ),),
            ],
          ),
        ),
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
                              .collection('category')
                              .where("image", isEqualTo: widget.img)
                              .get()
                              .then((snapshot) {
                            snapshot.docs.last.reference.delete();
                          });

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return Home();
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
                                return EditAdmin(
                                 name:   widget.name,
                                   cat1: widget.cat,
                                   cat2:widget.cat2,
                                    cat3:widget.cat3,
                                   email: widget.email,
                                   offer :widget.offers,
                                   img: widget.img,
                                   pic:widget.pic,
                                   // widget.offer
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
                          " edit ",
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

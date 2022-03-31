


// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Custom_Text.dart';

class AllRequest extends StatefulWidget {



  AllRequest();

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<AllRequest> {
  String allposts;
  String v;
  Future resultsLoaded;

  Color color1 = Colors.grey;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  String _value = '';
  @override
  void initState() {
    setState(() {

      _value='';
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    // final userData =
    //     FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    // final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  // Colors.white,
                  Colors.white,
                  //Colors.lightBlueAccent,

                  // Colors.lightBlueAccent,
                  Colors.white,
                ])),
            height: 30,
            child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          "Luban   ",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 70,
                          child: Image.asset(
                            "assets/wh3.jpeg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 80,
                    ),
                  ],
                ))),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Flexible(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('send_requests')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return Center(child: Text('Loading'));

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text(' .......لا توجد طلبات حتي الان ...');
                  default:
                    return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot posts =
                          snapshot.data.documents[index];
                          return Container(
                              padding: EdgeInsets.all(5),
                              child: Container(
                                child: Card(
                                  color: Colors.white,
                                  child:
                                    Column(
                                      children: [
                                        Text(posts.data()['brand_email']??"",style:TextStyle(color:Colors.black,
                                            fontSize:19,fontWeight:FontWeight.w700),),
                                        SizedBox(
                                          height:6
                                        ),


                                        Text(posts.data()['brand_name']??"",style:TextStyle(color:Colors.black,
                                            fontSize:19,fontWeight:FontWeight.w700),),
                                        SizedBox(
                                            height:6
                                        ),

                                        Text(posts.data()['category']??"",style:TextStyle(color:Colors.black,
                                            fontSize:19,fontWeight:FontWeight.w700),),
                                        SizedBox(
                                            height:6
                                        ),
                                        Text(posts.data()['city']??"",style:TextStyle(color:Colors.black,
                                            fontSize:19,fontWeight:FontWeight.w700),),
                                        SizedBox(
                                            height:6
                                        ),


                                        Text(posts.data()['country']??"",style:TextStyle(color:Colors.black,
                                            fontSize:19,fontWeight:FontWeight.w700),),
                                        SizedBox(
                                            height:6
                                        ),


                                        Text(posts.data()['mobile']??"",style:TextStyle(color:Colors.black,
                                            fontSize:19,fontWeight:FontWeight.w700),),
                                        SizedBox(
                                            height:6
                                        ),

                                        Text(posts.data()['details']??"",style:TextStyle(color:Colors.black,
                                            fontSize:17,fontWeight:FontWeight.w500),),
                                        SizedBox(
                                            height:6
                                        ),





                                      ],
                                    )
                                ),
                              ));
                        });
                }
              }),
        ),
        //),
        //  ]),
      ),
    );
  }
}

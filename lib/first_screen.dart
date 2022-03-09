

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:trainpdf_app/app/admin_screen.dart';


class FirstScreen extends StatefulWidget {

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<FirstScreen> {
  String allposts;
   String v;
   TextEditingController _searchController = TextEditingController();
   Future resultsLoaded;


  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
   

  @override
  void initState() {
    setState(() {
   });

    super.initState();
    void showSnackBar(String content) {
      scaffoldState.currentState.showSnackBar(
        SnackBar(
          content: Text(content),
          duration: Duration(milliseconds: 1500),
        ),
      );
    }

  }

  @override
  void dispose() {
  
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
          backgroundColor: Colors.grey[850],
          iconTheme: IconThemeData(color: Colors.white),
          title:Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.grey[850],
                    Colors.grey[850],
                  ])),
              height:30,
              child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width:20,
                      ),
                      Text( "App",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w700,fontSize:19)),
                     
                    ],
                  ))
          ),
          actions: <Widget>[
            SizedBox(
              height:10,
            ),
          ]
      ),

      body:
          Container(
            color: Colors.grey[850],
            child: Column(
                children: [
                 
                  SizedBox(
                    height:7,
                  ),

                  Flexible(
                              child: StreamBuilder(
                                  stream:
                                  FirebaseFirestore.instance.collection('Questions')
                                  
                                      .snapshots(),
                                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                                    final docs =snapshot.data.docs;
                                
                                    if (!snapshot.hasData) return Center(child: Text('Loading'));
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.waiting:
                                        return new Text('Loading...');

                                      default:
                                        return ListView.builder(
                                            itemCount: snapshot.data.documents.length,
                                            itemBuilder: (context, index) {
                                              DocumentSnapshot posts = snapshot.data.documents[index];
                                           
                                              if(snapshot.data == null) return CircularProgressIndicator();
                                         
                                              return
                                                 Container(
                                                  color: Colors.grey[850],
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        padding: EdgeInsets.all(10),
                                                        height: 320,
                                                      
                                                        width: MediaQuery.of(context).size.width / 1.1,
                                                        child: InkWell(
                                                          child: Container(
                                               
                                                           
                                                            width:200,
                                                            child: Text(posts.data()['Date']??" ",style:TextStyle(color:Colors.black,fontSize:17,fontWeight:FontWeight.w900),),
                                                          ),
                                                          onTap: ()  {
 
                                                          },
                                                        ),
                                                      ),
                                              
                                                    ],
                                                  ),
                                              );
                                            });
                                    }
                                  }
                              ),
                            ),
                          //),



Container(
                    color: Colors.grey[850],
                    padding: const EdgeInsets.only(top:3),
                    child: CurvedNavigationBar(
                        color:Colors.white,
                        backgroundColor: Colors.black12,
                        items:<Widget>[
                          Icon(Icons.home,size:24,color:Colors.black),
                        ],

                        animationCurve:Curves.bounceOut,
                        onTap:(index) async {
                        }
                    ),
                  
             )]),
          ),
    );
  }
}

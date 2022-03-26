





import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainpdf_app/app/products_brands.dart';

import 'Action88.dart';
import 'action99.dart';



class AdminBrands extends StatefulWidget {


  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<AdminBrands> {

  String allposts;
  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();




  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    //  final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    return Scaffold(
        backgroundColor: Colors.white,
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
        body:
        Container(
          color: Colors.grey[200],
          child: Column(
              children: [

                SizedBox(
                  height:7,
                ),

                Flexible(
                  child: StreamBuilder(
                      stream:
                      FirebaseFirestore.instance.collection('category')
                      // .where('name',isEqualTo:'عطر')
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading22...');
//.where("category", isEqualTo:"tec")
                          default:
                            return ListView.builder(
                                 itemCount: snapshot.data.documents.length,
                                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                //   crossAxisCount: 1,
                                //   crossAxisSpacing: 1,
                                //   mainAxisSpacing: 1,
                                // ), //(orientation == Orientation.portrait) ? 2: 2.2),
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot posts =
                                  snapshot.data.documents[index];
                                  return  Container(
                                    height:260,
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            child: Card(
                                              color: Colors.grey[300],
                                              child: Column(children: [
                                                SizedBox(height: 5),
                                                Container(
                                                  width: 150,
                                                  height: 90,
                                                  child: Image.network(
                                                      posts.data()['image']??"",
                                                      fit: BoxFit.fitWidth),
                                                ),
                                                SizedBox(height: 2),
                                                Text((posts.data()['name']??""),style:TextStyle(color:Colors.black,fontSize:16,
                                                    fontWeight:FontWeight.bold),),
                                                SizedBox(height: 2),
                                              ]),
                                            ),
                                            onTap: () {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(builder: (context) {
                                              //       return Action99(
                                              //           posts.data()['name'],
                                              //           posts.data()['des'],
                                              //           posts.data()['brand'],
                                              //           posts.data()['image']
                                              //       );
                                              //       // Steper();
                                              //     }));
                                            },
                                          ),
                                          RaisedButton(

                                            child:Text("المتجر "),
                                            onPressed:(){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) {
                                                    return Action99(
                                                        name:posts.data()['name'],
                                                      cat:  posts.data()['catx'][0],
                                                      cat2: posts.data()['catx'][1],
                                                       cat3: posts.data()['catx'][2],
                                                     email:   posts.data()['brandemail'],
                                                     img:   posts.data()['image'],
                                                     offers:   posts.data()['offers'],
                                                      pic:posts.data()['pic'],
                                                    );
                                                    // Steper();
                                                  }));
                                            },
                                          ),

                                          SizedBox(
                                            height:10,
                                          ),
                                          RaisedButton(

                                            child:Text("المنتجات "),
                                            onPressed:(){

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) {
                                                    return
                                                  ProductsView(br: posts.data()['name']);

                                                  }));
                                            },
                                          )

                                        ],
                                      ));
                                });
                        }
                      }),
                ),
                //),
                //  ]),
              ] ),
        ));
  }
}

//                         }
//                       }
//                   ),
//                 ),
//               //),


//             ]),
//       ),


//     );
//   }
// }

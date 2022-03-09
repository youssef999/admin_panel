



import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Action88.dart';



class AllProductsView extends StatefulWidget {


  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<AllProductsView> {

  String allposts;
  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();




  @override
  Widget build(BuildContext context) {
 
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
                      FirebaseFirestore.instance.collection('products')
                      // .where('name',isEqualTo:'عطر')
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading22...');
//.where("category", isEqualTo:"tec")
                          default:
                            return GridView.builder(
                                itemCount: snapshot.data.documents.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 3,
                                ), //(orientation == Orientation.portrait) ? 2: 2.2),
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot posts =
                                  snapshot.data.documents[index];

                                  return  Container(
                                          padding: EdgeInsets.all(5),
                                          child: InkWell(
                                            child: Card(
                                              color: Colors.grey[300],
                                              child: Column(children: [
                                                SizedBox(height: 20),
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
                                                Text((posts.data()['price']).toString()??"",
                                                  style:TextStyle(color:Colors.green,fontSize:16,
                                                      fontWeight:FontWeight.bold),

                                                ),
                                              ]),
                                            ),
                                            onTap: () {

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) {
                                                    return Action88(
                                                        posts.data()['name'],
                                                        posts.data()['des'],
                                                        posts.data()['brand'],
                                                        posts.data()['image']
                                                    );
                                                    // Steper();
                                                  }));
                                            },
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

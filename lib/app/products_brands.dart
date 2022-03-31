








import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Action88.dart';


class ProductsView extends StatefulWidget {

  String br;

  ProductsView({this.br});
  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<ProductsView> {

  String allposts;
  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  String lg = '';


  @override
  void initState() {



    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    //final user = FirebaseAuth.instance.currentUser;
   // final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    num price;

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
                          width: MediaQuery.of(context).size.width * 0.62
                      ),
                      Container(
                        width:40,
                        //width:57,
                        child: Image.asset("assets/wh3.jpeg",
                            fit:BoxFit.fitWidth
                        ),
                      ),
                      SizedBox(
                          width: 5
                      ),
                    ],
                  ))),
        ),
        body:
        Container(
          color: Colors.white,
          child: Column(
              children: [

                SizedBox(
                  height:7,
                ),

                Flexible(
                  child: StreamBuilder(
                      stream:
                      FirebaseFirestore.instance.collection('products')
                          .where('brand',isEqualTo:widget.br)
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
//.where("category", isEqualTo:"tec")
                          default:
                            return ListView.builder(
                                itemCount: snapshot.data.documents.length,
                                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                //   crossAxisCount: 2,
                                //   crossAxisSpacing: 2,
                                //   mainAxisSpacing: 3,
                                //
                                // ), //(orientation == Orientation.portrait) ? 2: 2.2),
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot posts =
                                  snapshot.data.documents[index];

                                  return  Container(
                                          padding: EdgeInsets.all(5),
                                          child: InkWell(
                                            child: Card(
                                              color: Colors.grey[100],
                                              child: Row(children: [
                                                SizedBox(height: 18),

                                                SizedBox(width:120
                                                  //MediaQuery.of(context).size.width*0.22
                                                ),

                                                Column(
                                                  children: [
                                                    Container(
                                                      width:100,
                                                      child: Text((posts.data()['name']),style:TextStyle(color:Colors.black,fontSize:16,
                                                          fontWeight:FontWeight.bold),),
                                                    ),
                                                    SizedBox(height: 2),



                                                          SizedBox(
                                                              width:2
                                                          ),
                                                          Text((posts.data()['price']).toString(),
                                                            style:TextStyle( color:Colors.red,fontSize:16,
                                                                fontWeight:FontWeight.bold),
                                                          ),

                                                        ],
                                                      ),
                                                 // ]),
                                               // ))),

                                                SizedBox(width:10),
                                                Container(
                                                  width: 130,
                                                  height: 85,
                                                  child: Image.network(
                                                      posts.data()['image'],
                                                      fit: BoxFit.scaleDown),
                                                ),

                                              ]),
                                            ),
                                            onTap: () {

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) {
                                                    return Action88(
                                                       name: posts.data()['name'],
                                                       des: posts.data()['des'],
                                                       cat: posts.data()['cat'],
                                                       img: posts.data()['image'],
                                                       price: posts.data()['price'],
                                                     price2: posts.data()['priceQw'],
                                                      price3:posts.data()['priceAmar'],
                                                     price4: posts.data()['priceAm'],
                                                     price5: posts.data()['priceBh'],
                                                     // posts.data()['price'].toString(),
                                                      brand:posts.data()['brand'],
                                                      brandemail:posts.data()['brandemail'],
                                                      price6:posts.data()['priceQ']

                                                    );

                                                  }));

                                            },
                                          ));
                                });
                        }
                      }),
                ),

              ] ),
        ));
  }
}


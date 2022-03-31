// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainpdf_app/app/radio_button_controller.dart';
import 'package:trainpdf_app/app/requests_responses.dart';

import 'Custom_Text.dart';
import 'all_requests.dart';
import 'map1.dart';


class OrdersRequest extends StatefulWidget {
  String brand_email;

  OrdersRequest({this.brand_email});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<OrdersRequest> {
  String allposts;
  String v;
  Future resultsLoaded;

  Color color1 = Colors.grey;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  String _value  ;
  @override
  void initState() {
    Get.put(HomeViewModel());
    //  _value='cancel';
    setState(() {
      print("brand =" + widget.brand_email.toString());

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
        child: Column(
          children: [
            Text("الطلبات الواردة ",style:TextStyle(color:Colors.green,fontSize:22),),
            SizedBox(height:10),
            Row(
              children: [
                SizedBox(
                    width:20
                ),
                RaisedButton(
                    color:Colors.green,
                    child:Text("الطلبات الواردة",style:TextStyle(color:Colors.white,fontSize:17),),
                    onPressed:(){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                            return  OrdersRequest();

                          }));



                    }),
                SizedBox(
                    width:20
                ),
                RaisedButton(
                    color:Colors.green,
                    child:Text("الطلبات التي قمت بتغيرها  ",style:TextStyle(color:Colors.white,fontSize:17),),
                    onPressed:(){


                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                            return  OrdersRequest2();

                          }));

                    }),
                SizedBox(width:10,),


              ],
            ),
            RaisedButton(
                color:Colors.green,
                child:Text("جميع الطلبات ",style:TextStyle(color:Colors.white,fontSize:17),),
                onPressed:(){


                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                        return   AllRequests2();

                      }));


                }),
            SizedBox(height:12,),
            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('orders_checkout')
                      .orderBy('time2', descending: true)
                      .where("x", isEqualTo:'x')
                  // .where("order_status", isEqualTo: 'pending')
                  //    where("order_status", isNotEqualTo: 'cancel' )
                  //.orderBy('time')
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
                                      color: Colors.grey[300],
                                      child: Column(
                                        children: [
                                          Directionality(
                                            textDirection:TextDirection.rtl,
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              child:

                                              Container(
                                                child: Card(
                                                  color: Colors.grey[100],
                                                  child: Column(
                                                    children: [

                                                      Text("تفاصيل الطلب ",style:TextStyle(color:Colors.black,fontSize:18),),

                                                      SizedBox(
                                                          height:6
                                                      ),

                                                      if(posts.data()['brand']!=null)
                                                        Row(
                                                          children: [
                                                            Text("المتجر : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                                            Text(
                                                                posts.data()['brand'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    color: Colors.black)),
                                                          ],
                                                        ),
                                                      Row(
                                                        children: [
                                                          Text("الدولة : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                                          Text(
                                                              posts.data()['country'] ??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  color: Colors.black)),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(" المدينة : ",style:TextStyle(color:Colors.black,fontSize:19),),

                                                          Text(
                                                              posts.data()['city'] ??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  color: Colors.black)),

                                                        ],
                                                      ),


                                                      Row(
                                                        children: [
                                                          Text(" عنوان الشارع :  ",style:TextStyle(color:Colors.black,fontSize:19),),

                                                          Text(
                                                              posts.data()['address'] ??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  color: Colors.black)),

                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(" المبني  : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                                          Text(
                                                              posts.data()['apartment'] ??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  color: Colors.black)),

                                                        ],
                                                      ),

                                                      Center(
                                                        child: Row(
                                                          children: [
                                                            Text(" الطابق :  ",style:TextStyle(color:Colors.black,fontSize:19),),
                                                            Text(
                                                                posts.data()['floor'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    color: Colors.black)),

                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(" الهاتف : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                                          Text(
                                                              posts.data()['mobile'].toString().replaceAll('+','')+"+"??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  color: Colors.black)),

                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(width:130,),
                                                          Text(
                                                              posts.data()['notes'] ??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  color: Colors.black)),
                                                          if(posts.data()['notes']!='')
                                                            Text(": ملاحظات  ",style:TextStyle(color:Colors.black,fontSize:19),)
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [

                                                          Text("  رقم الطلب   : ",
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 18)),
                                                          Text(
                                                              posts.data()[
                                                              'order_id'] ??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  color: Colors.green)),


                                                        ],
                                                      ),
                                                      SizedBox(height:17,),
                                                      Row(
                                                        children: [

                                                          Text(" التوقيت  : ",
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 18)),
                                                          Text(
                                                              posts.data()['time']??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  color: Colors.black)),


                                                        ],
                                                      ),

                                                      SizedBox(height: 12,),
                                                      RaisedButton(
                                                          color:Colors.green,
                                                          child:Text("انتقل للخريطة ",style:TextStyle(color:Colors.white,fontSize:17),),
                                                          onPressed:()
                                                          {
                                                            Navigator.push(context,
                                                                MaterialPageRoute(builder: (context) {

                                                                  return  Map1(posts.data()['lat'],
                                                                      posts.data()['long']);

                                                                }));

                                                          }),
                                                      //    SizedBox(height: 5),

                                                      SizedBox(height: 22),
                                                      Row(
                                                        children: [

                                                          Container(
                                                              width: 33,
                                                              child: Image.asset(
                                                                  'assets/wh3.png')),
                                                          SizedBox(width: 5),
                                                          Text("  حالة الطلب   : "),
                                                          if( posts.data()['order_status']=='delivered')

                                                            Text(
                                                                "تم التوصيل  ",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color: Colors.green)),
                                                          if( posts.data()['order_status']=='pending')
                                                            Text(
                                                                "بانتظار الموافقة ",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color: Colors.green)),

                                                          if( posts.data()['order_status']=='cancel')
                                                            Text(
                                                                "تم الالغاء  ",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color: Colors.green)),

                                                          if( posts.data()['order_status']=='confirm')
                                                            Text(
                                                                "تم التاكيد  ",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color: Colors.green)),


                                                          if( posts.data()['order_status']=='ontheway')
                                                            Text(
                                                                "في الطريق",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color: Colors.green)),







                                                        ],
                                                      ),
                                                      Text(posts.data()['ord 1']??"",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                      Text(posts.data()['ord 2'] ?? "",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                      Text(posts.data()['ord 3'] ?? "",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                      Text(posts.data()['ord 4'] ?? "",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                      Text(posts.data()['ord 5'] ?? "",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                      Text(posts.data()['ord 6'] ?? "",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                      Text(posts.data()['ord 7'] ?? "",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                      Text(posts.data()['ord 8'] ?? "",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                      Text(posts.data()['ord 9'] ?? "",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                      Text(posts.data()['ord 10'] ?? "",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold)),

                                                      Text(
                                                          "--------------------------------------------"),
                                                      Text(
                                                          posts.data()[
                                                          'total_amount'].toString() ??
                                                              "",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                    ],
                                                  ),
                                                ),
                                              ),



                                            ),
                                          ),

                                          //    Text(posts.data()['time'].toString()??"",),
                                          SizedBox(height: 10),



                                          GetBuilder<HomeViewModel>(
                                              init: Get.find(),
                                              builder: (controller) =>
                                                  Container(
                                                      child: Column(
                                                        children: [
                                                          Center(
                                                            child: Row(
                                                              //  mainAxisAlignment:MainAxisAlignment.center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                SizedBox(width: 40),
                                                                Row(
                                                                  children: [
                                                                    Radio(
                                                                      value: 'cancel',
                                                                      activeColor: Colors.green,
                                                                      groupValue: controller.value,
                                                                      onChanged: (value) {
                                                                        print("val ===" +
                                                                            value.toString());
                                                                        controller.changeMethod(value);
                                                                      },
                                                                    ),
                                                                    SizedBox(width: 22),
                                                                    Custom_Text(
                                                                      text: 'الغاء',
                                                                      color: Colors.black,
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(width: 20),
                                                                Row(
                                                                  children: [
                                                                    Radio(
                                                                      value: 'ontheway',
                                                                      activeColor: Colors.green,
                                                                      groupValue: controller.value,
                                                                      onChanged: (value) {
                                                                        print("val ===" +
                                                                            value.toString());
                                                                        controller.changeMethod(value);
                                                                      },
                                                                    ),
                                                                    SizedBox(width: 22),
                                                                    Custom_Text(
                                                                      text: 'في الطريق ',
                                                                      color: Colors.black,
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(height: 20),
                                                              ],
                                                            ),
                                                          ),
                                                          Center(
                                                            child: Row(
                                                              //  mainAxisAlignment:MainAxisAlignment.center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                SizedBox(width: 40),
                                                                Row(
                                                                  children: [
                                                                    Radio(
                                                                      value: 'confirm',
                                                                      activeColor: Colors.green,
                                                                      groupValue: controller.value,
                                                                      onChanged: (value) {
                                                                        print("val ===" +
                                                                            value.toString());
                                                                        controller.changeMethod(value);
                                                                      },
                                                                    ),
                                                                    SizedBox(width: 22),
                                                                    Custom_Text(
                                                                      text: 'مؤكد',
                                                                      color: Colors.black,
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(width: 20),
                                                                Row(
                                                                  children: [
                                                                    Radio(
                                                                      value: 'delivered',
                                                                      activeColor: Colors.green,
                                                                      groupValue: controller.value,
                                                                      onChanged: (value) {
                                                                        print("val ===" +
                                                                            value.toString());
                                                                        controller.changeMethod(value);
                                                                      },
                                                                    ),
                                                                    SizedBox(width: 22),
                                                                    Custom_Text(
                                                                      text: 'تم التسليم ',
                                                                      color: Colors.black,
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(height: 20),
                                                              ],
                                                            ),
                                                          ),
                                                          RaisedButton(
                                                            color: Colors.green,
                                                            child: Text(
                                                              "موافق ",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 19),
                                                            ),
                                                            onPressed: () {
                                                              Firestore.instance
                                                                  .collection('orders_checkout')
                                                                  .where('order_id',
                                                                  isEqualTo: posts
                                                                      .data()['order_id'])
                                                                  .get()
                                                                  .then((snapshot) {
                                                                snapshot.docs.last.reference
                                                                    .updateData({
                                                                  'order_status':controller.value,
                                                                  // _value.toString(),
                                                                  'x':'y'
                                                                });
                                                              });
                                                            },
                                                          )
                                                        ],
                                                      ))
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                            });
                    }
                  }),
            ),
          ],
        ),
        //),
        //  ]),
      ),
    );
  }
}

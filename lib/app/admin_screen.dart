import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trainpdf_app/app/home.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:image_cropper/image_cropper.dart';
class AdminScreen extends StatefulWidget {


  String name, price, des, imgLocation, category, kinds;

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AdminScreen> {
  //String imagepath;
  String valuechoose;
  String valuechoose2;
  String valuechoose3;


  @override
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController des = TextEditingController();

  TextEditingController offers = TextEditingController();

  TextEditingController cat = TextEditingController();
  TextEditingController cat2 = TextEditingController();
  TextEditingController cat3 = TextEditingController();


  TextEditingController img = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController  pass = TextEditingController();
  TextEditingController kind = TextEditingController();


  File _image , _image2;
  String _url ='' , _url2 ='';
  bool bol =false;
  bool upload =false;


  List listitem =["المذاق العُماني","الطيب العُماني","تمور","الحلوى العُمانيه","العسل العُماني","جمال و طبيعة","المشغولات العُمانيه"];
  List listitem2 =["x","المذاق العُماني","الطيب العُماني","تمور","الحلوى العُمانيه","العسل العُماني","جمال و طبيعة","المشغولات العُمانيه"];
  List listitem3 =["x","المذاق العُماني","الطيب العُماني","تمور","الحلوى العُمانيه","العسل العُماني","جمال و طبيعة","المشغولات العُمانيه"];



  sendData2() async {
    if (_formkey.currentState.validate()) {
      var storageImage = FirebaseStorage.instance.ref().child(_image.path);

      var task = storageImage.putFile(_image);

      _url = await (await task.onComplete).ref.getDownloadURL();


      await Firestore.instance.collection('category').add({
        'name': name.text,
        'img': _url.toString,
         'cat':cat.text,
          'offers':'x',
           'brandemail':email.text,
      });
    }
  }

  @override
  void dispose() {
    name.dispose();
    des.dispose();
    offers.dispose();
    kind.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text(
                "Luban   ",
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 80,
              ),
              Text(
                "لبان   ",
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[700],
              child: Form(
                  key: _formkey,
                  child: ListView(children: <Widget>[

                    Center(child: Text("ضع هنا اللوجو الخاص بالمتجر ",style:TextStyle(fontSize: 16,color: Colors.white,fontWeight:FontWeight.w600),)),
                    Row(
                      children: [

                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                            child: Icon(Icons.add_photo_alternate,
                                size: 40, color: Colors.red),
                            onTap: pickImage),


                        SizedBox(
                          width: 30,
                        ),

                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              _image == null ? null : FileImage(_image),
                          radius: 80,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Icon(Icons.clear, size: 40, color: Colors.red),
                          onTap: clearr,
                        ),
                      ],
                    ),
                    SizedBox(height:12),
                    Center(child: Text("ضع هنا الصورة ",style:TextStyle(fontSize: 16,color: Colors.white,fontWeight:FontWeight.w600),)),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                            child: Icon(Icons.add_photo_alternate,
                                size: 40, color: Colors.red),
                            onTap: pickImage2),
                        SizedBox(
                          width: 30,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                          _image2 == null ? null : FileImage(_image2),
                          radius: 80,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Icon(Icons.clear, size: 40, color: Colors.red),
                          onTap: clearr2,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            controller: name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w900),
                            decoration: InputDecoration(
                                hintText: 'اسم المتجر',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey,
                                       width: 2.0
                                      ),
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'ادخل اسم المتجر';
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left:25,right:25),
                          decoration:BoxDecoration(border: Border.all(color:Colors.grey,width:1)
                              ,borderRadius: BorderRadius.circular(45)),
                          child:   DropdownButton(

                             dropdownColor:Colors.blueGrey,
                            hint: Text("ادخل القسم الخاص بالمتجر ",style:TextStyle(color:Colors.white,fontSize:21,fontWeight:FontWeight.w500),),

                            icon: Icon(Icons.arrow_drop_down,color:Colors.red),

                            iconSize: 36,

                            isExpanded: true,
                            underline: SizedBox(),

                            value: valuechoose,style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                            onChanged:(newvalue)
                            {
                              setState(() {
                                valuechoose=newvalue;
                              });
                            },

                            items: listitem.map((valueitem){

                              return DropdownMenuItem(value: valueitem,

                                child: Text(valueitem),


                              );

                            }).toList(),


                          ),

                        ),


                        SizedBox(
                            height:15
                        ),

                        Container(
                          padding: EdgeInsets.only(left:25,right:25),
                          decoration:BoxDecoration(border: Border.all(color:Colors.grey,width:1)
                              ,borderRadius: BorderRadius.circular(25)),
                          child:   DropdownButton(
                            dropdownColor:Colors.blueGrey,
                            hint: Text("ادخل القسم الخاص بالمتجر",style:TextStyle(color:Colors.white,fontSize:21,fontWeight:FontWeight.w500),),

                            icon: Icon(Icons.arrow_drop_down,color:Colors.red),

                            iconSize: 36,

                            isExpanded: true,
                            underline: SizedBox(),

                            value: valuechoose2,style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                            onChanged:(newvalue)
                            {
                              setState(() {
                                valuechoose2=newvalue;
                              });

                            },

                            items: listitem2.map((valueitem){

                              return DropdownMenuItem(value: valueitem,

                                child: Text(valueitem),
                              );

                            }).toList(),


                          ),

                        ),

                        SizedBox(
                            height:15
                        ),

                        Container(
                          padding: EdgeInsets.only(left:25,right:25),
                          decoration:BoxDecoration(border: Border.all(color:Colors.grey,width:1)
                              ,borderRadius: BorderRadius.circular(25)),
                          child:   DropdownButton(
                            dropdownColor:Colors.blueGrey,
                            hint: Text("ادخل القسم الخاص بالمتجر",style:TextStyle(color:Colors.white,fontSize:21,fontWeight:FontWeight.w500),),

                            icon: Icon(Icons.arrow_drop_down,color:Colors.red),

                            iconSize: 36,

                            isExpanded: true,
                            underline: SizedBox(),

                            value: valuechoose3,style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                            onChanged:(newvalue)
                            {
                              setState(() {
                                valuechoose3=newvalue;
                              });

                            },

                            items: listitem3.map((valueitem){

                              return DropdownMenuItem(value: valueitem,
                                child: Text(valueitem),
                              );

                            }).toList(),


                          ),

                        ),



                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            controller: email,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w900),
                            decoration: InputDecoration(
                                hintText: 'الايميل الخاص بهذا المتجر',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 2.0
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'ادخل الايميل ';
                              }
                            }),
                        SizedBox(height: 15),


                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: offers,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                              hintText: 'خصومات هذا المتجر',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 2.0
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 200,
                          child: RaisedButton(
                              color: Colors.white,
                              shape: StadiumBorder(),
                              splashColor: Colors.red,
                              child: Text(
                                'اضافة',
                                style:
                                    TextStyle(color: Colors.black, fontSize: 21),
                              ),
                              onPressed: () async {

                                List catx=[valuechoose ,valuechoose2,valuechoose3 ];

                                if(bol==false) {

                                  bol=true;
                                  FirebaseAuth _auth = FirebaseAuth.instance;

                                  if (_formkey.currentState.validate()) {
                                    var currentUser =
                                        FirebaseAuth.instance.currentUser;

                                    var storageImage = FirebaseStorage.instance
                                        .ref()
                                        .child(_image.path);


                                    var task = storageImage.putFile(_image);
                                    _url = await (await task.onComplete)
                                        .ref
                                        .getDownloadURL();

                                    var storageImage2 = FirebaseStorage.instance
                                        .ref()
                                        .child(_image2.path);


                                    var task2 = storageImage2.putFile(_image2);


                                    _url2 = await (await task2.onComplete)
                                        .ref
                                        .getDownloadURL();


                                    Firestore.instance
                                        .collection('category')
                                        .document()
                                        .setData({
                                      'name': name.text,
                                      'image': _url.toString(),
                                      'pic': _url2.toString(),
                                      'catx': catx,
                                      'brandemail': email.text,
                                      'offers': offers.text
                                    });
                                  }

                                  await Flushbar(
                                    backgroundColor: Colors.green,
                                    title: 'ok',
                                    message:
                                    'تم اضافة المتجر بنجاح',
                                    duration: Duration(seconds: 3),
                                  ).show(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return Home(
                                        );

                                      }));
                                }
                                else{

                                  await Flushbar(
                                    backgroundColor: Colors.red,
                                    title: 'ok',
                                    message:
                                    'انتظر جاري رفع المتجر ',
                                    duration: Duration(seconds: 4),
                                  ).show(context);
                                }
                              }),
                        ),
                        /* RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            'images',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return HomeImg();
                              }),
                            );
                          },
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            'Delete Post',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              // Delete post

                              Firestore.instance
                                  .collection('posts5')
                                  .document('Wefs9XsNTeND7UXW7aXi')
                                  .delete()
                                  .then((onValue) {
                                print('Post Deleted Successfully');
                              });
                            }
                          },
                        )*/
                      ],
                    )
                  ]))),
        ));
  }

  Future pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    var file=await await ImageCropper().cropImage(
        sourcePath: image.path,aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    //ImageCropper.cropImage(sourcePath:image.path,aspectRatio:CropAspectRatio(ratioX: 1, ratioY: 1));

    //set state bt3ml update kol shwya



    setState(() {
      _image = file;
    });
  }

  Future pickImage2() async {
    var image2 = await ImagePicker.pickImage(source: ImageSource.gallery);
    var file=await await ImageCropper().cropImage(
        sourcePath: image2.path,aspectRatio: CropAspectRatio(ratioX: 5, ratioY: 5));
    //set state bt3ml update kol shwya


    setState(() {
      _image2 = file;
    });
  }


  Future clearr() {
    setState(() {
      _image = null;
    });
  }

  Future clearr2() {
    setState(() {
      _image2 = null;
    });
  }
}

import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:another_flushbar/flushbar.dart';
import 'home.dart';

class AdminScreen2 extends StatefulWidget {
  String name, price, des, imgLocation, category, kinds;

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AdminScreen2> {
  //String imagepath;
  String valuechoose;
  String valuechoose2;

  @override
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController des = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController brand = TextEditingController();

  TextEditingController img = TextEditingController();

  TextEditingController kind = TextEditingController();
  File _image;
  String _url;

  sendData2() async {
    if (_formkey.currentState.validate()) {
      var storageImage = FirebaseStorage.instance.ref().child(_image.path);

      var task = storageImage.putFile(_image);

      _url = await (await task.onComplete).ref.getDownloadURL();
    }
  }

  @override
  void dispose() {
    name.dispose();
    des.dispose();
    price.dispose();
    kind.dispose();
    super.dispose();
  }

  updatePost(String ID) {
    Firestore.instance.collection('posts5').document(ID).setData({
      'title': "Title Edited",
      'description': "Description Edited"
    }).then((value) {
      print('record updated successflly');
    });
  }

  @override
  Widget build(BuildContext context) {



    var random = new Random();
    var x = random.nextInt(88888);
   var x2=random.nextInt(9990);
   var x3=random.nextInt(40040);
   var x4=random.nextInt(77777);



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
        body: Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[700],
            child: Form(
                key: _formkey,
                child: ListView(children: <Widget>[
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
                              hintText: ' اسم المنتج ',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'ادخل اسم المنتج';
                            }
                          }),
                      SizedBox(height: 15),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          controller: price,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                              hintText: ' السعر ',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return ' برجاء ادخال السعر ';
                            }
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: des,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w900),
                        decoration: InputDecoration(
                            hintText: ' تفاصيل عن المنتج ',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 21,
                                fontWeight: FontWeight.w500),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(60.0),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: brand,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w900),
                        decoration: InputDecoration(
                            hintText: '  اسم المتجر   ',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 21,
                                fontWeight: FontWeight.w500),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(60.0),
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'برجاء ادخال اسم المتجر';
                          }
                        },
                      ),
                      SizedBox(height: 15),
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
                              'اضافة المنتج ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 21),
                            ),
                            onPressed: () async {

                               print("x="+x.toString());
                               print("x="+x2.toString());
                               print("x="+x3.toString());
                               print("x="+x4.toString());

                              if (_formkey.currentState.validate()) {
                                var storageImage = FirebaseStorage.instance
                                    .ref()
                                    .child(_image.path);

                                var task = storageImage.putFile(_image);

                                _url = await (await task.onComplete)
                                    .ref
                                    .getDownloadURL();
                                FirebaseFirestore.instance
                                    .collection('products')
                                    .doc()
                                    .set({
                                  'name': name.text,
                                  'image': _url.toString(),
                                  'des': des.text,
                                  'brand': brand.text,
                                  'price': price.text,
                                  'productid':x.toString()+name.text[0]
                                      +des.text[2]+x2.toString()+
                                      price.text[0]+name.text[2]+x4.toString()+
                                      _url.toString()[9]+
                                      x3.toString()+name.text[3]
                                });
                              }


                                 await Flushbar(
                                   backgroundColor:Colors.red,
            title: 'ok',
            message:
                'تم اضافة المنتج بنجاح',
            duration: Duration(seconds: 3),
          ).show(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Home();


                              }));
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
                ]))));
  }

  Future pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    //set state bt3ml update kol shwya

    setState(() {
      _image = image;
    });
  }

  Future uploadImage(context) async {
    try {
      FirebaseStorage storage =
          FirebaseStorage(storageBucket: 'gs://fire999-6d8b9.appspot.com');

      StorageReference ref = storage.ref().child(_image.path);
      StorageUploadTask storageUploadTask = ref.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('success'),
      ));
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url $url');
      setState(() {
        _url = url;
      });
    } catch (ex) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(ex.message),
      ));
    }
  }

  Future clearr() {
    setState(() {
      _image = null;
    });
  }
}

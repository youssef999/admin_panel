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
class AdminScreen extends StatefulWidget {
  String name, price, des, imgLocation, category, kinds;

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AdminScreen> {
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

  TextEditingController cat = TextEditingController();

  TextEditingController img = TextEditingController();

  TextEditingController kind = TextEditingController();
  File _image;
  String _url;

  sendData2() async {
    if (_formkey.currentState.validate()) {
      var storageImage = FirebaseStorage.instance.ref().child(_image.path);

      var task = storageImage.putFile(_image);

      _url = await (await task.onComplete).ref.getDownloadURL();

      await Firestore.instance.collection('category').add({
        'name': name.text,
        'img': _url.toString,
      });
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
                        height: 15,
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
                              'اضافة',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 21),
                            ),
                            onPressed: () async {
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
                                Firestore.instance
                                    .collection('category')
                                    .document()
                                    .setData({
                                  'name': name.text,
                                  'image': _url.toString(),
                                  'prof': currentUser.email,
                                });
                              }
                           await Flushbar(
                              backgroundColor:Colors.red,
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
                                                    // Steper();
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

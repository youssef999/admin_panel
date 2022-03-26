import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
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
  TextEditingController price2 = TextEditingController();
  TextEditingController price3= TextEditingController();
  TextEditingController price4 = TextEditingController();
  TextEditingController price5 = TextEditingController();
  TextEditingController price6 = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController brandemail  = TextEditingController();

  TextEditingController img = TextEditingController();
  TextEditingController cat = TextEditingController();
  TextEditingController status = TextEditingController();
  bool bol=false;

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
    cat.dispose();
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
    var x5=random.nextInt(119);
    var x6=random.nextInt(567);

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
          textDirection:TextDirection.rtl,
          child: Container(
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
                                hintText: ' السعر بريال السعودي ',
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
                        SizedBox(height: 15),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            controller: price2,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w900),
                            decoration: InputDecoration(
                                hintText: ' السعر بالدينار الكويتي ',
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
                        SizedBox(height: 15),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            controller: price3,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w900),
                            decoration: InputDecoration(
                                hintText: ' السعر بدرهم اماراتي  ',
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


                        SizedBox(height: 15),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            controller: price4,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w900),
                            decoration: InputDecoration(
                                hintText: ' السعر بريال عماني ',
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


                        SizedBox(height: 15),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            controller: price5,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w900),
                            decoration: InputDecoration(
                                hintText: ' السعر بدينار بحريني ',
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

                        SizedBox(height: 15),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            controller: price6,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w900),
                            decoration: InputDecoration(
                                hintText: ' السعر بريال القطري ',
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

                        TextFormField(
                          controller: brandemail,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                              hintText: '  الايميل الخاص بصاحب هذا المنتج  ',
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
                              return 'برجاء ادخال الايميل';
                            }
                          },
                        ),
                        SizedBox(
                          height:11
                        ),

                        TextFormField(
                          controller: status,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                              hintText: ' حالة المنتج  : متوافر , اوشك علي الانتهاء  ',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(60.0),
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'برجاء ادخال كمية المنتج  ';
                            }
                          },
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
                                'اضافة المنتج ',
                                style:
                                    TextStyle(color: Colors.black, fontSize: 21),
                              ),
                              onPressed: () async {


                                if(bol==false) {
                                  bol = true;
                                  FirebaseAuth _auth = FirebaseAuth.instance;
                                  await _auth
                                      .signInWithEmailAndPassword(
                                      email: 'admin@luban2022x.com',
                                      password: '123456789')
                                      .then((value) async {
                                    print(value);
                                  });

                                  print("x=" + x.toString());
                                  print("x=" + x2.toString());
                                  print("x=" + x3.toString());
                                  print("x=" + x4.toString());


                                  if (_formkey.currentState.validate()) {

                                    var storageImage = FirebaseStorage.instance
                                        .ref()
                                        .child(_image.path);

                                    var task = storageImage.putFile(_image);

                                    _url = await (await task.onComplete)
                                        .ref
                                        .getDownloadURL();


                                    await FirebaseFirestore.instance
                                        .collection('products')
                                        .doc()
                                        .set({
                                      'name': name.text,
                                      'image': _url.toString(),
                                      'des': des.text,
                                      'brandemail':brandemail.text,
                                       'cat':'x',
                                      'brand': brand.text,
                                      'price': num.parse(price.text),
                                      'priceAm': num.parse(price4.text),
                                      'priceAmar':num.parse( price3.text),
                                      'priceBh':num.parse( price5.text),
                                      'priceQ': num.parse(price6.text),
                                      'priceQw': num.parse(price2.text),
                                      'x': status.text,
                                      'productid': x.toString() + x3.toString()
                                        + x2.toString() +
                                          x4.toString()+ x5.toString()+
                                          x6.toString()

                                    });
                                  }


                                  await Flushbar(
                                    backgroundColor: Colors.green,
                                    title: 'ok',
                                    message:
                                    'تم اضافة المنتج بنجاح',
                                    duration: Duration(seconds: 3),
                                  ).show(context);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return Home();
                                      }));
                                }
                                else{

                                  await Flushbar(
                                    backgroundColor: Colors.red,
                                    title: 'ok',
                                    message:
                                    'انتظر جاري رفع المنتج ',
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
        sourcePath: image.path,aspectRatio: CropAspectRatio(ratioX: 5, ratioY: 5));
    //set state bt3ml update kol shwya

    setState(() {
      _image = file;
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

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

class EditProducts extends StatefulWidget {
  String name,
      img,
      des,
      brand,
      brandemail,
      cat;

  num  price,
      price2,
      price3,
      price4,
      price5,
      price6;

  EditProducts(
      {this.name,
      this.img,
      this.price,
      this.price2,
      this.price3,
      this.price4,
      this.price5,
      this.price6,
      this.des,
      this.brand,
      this.brandemail,
      this.cat});

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<EditProducts> {
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
  TextEditingController price3 = TextEditingController();
  TextEditingController price4 = TextEditingController();
  TextEditingController price5 = TextEditingController();
  TextEditingController price6 = TextEditingController();

  TextEditingController brand = TextEditingController();
  TextEditingController brandemail = TextEditingController();

  TextEditingController cat = TextEditingController();
  bool bol = false;

  File _image;
  String _url ='';
  bool upload=false;
  
  
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
    var x2 = random.nextInt(9990);
    var x3 = random.nextInt(40040);
    var x4 = random.nextInt(77777);

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
                                hintText: widget.name,
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
                                hintText: widget.price.toString() + "ريال سعودي",
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
                              hintText: widget.price2.toString() + "دينار كويتي",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: price3,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                              hintText: widget.price3 .toString()+ "درهم اماراتي ",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                        ),

                        SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: price4,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                              hintText: widget.price4 .toString()+ ' ريال عماني ',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                        ),

                        SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: price5,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                              hintText: widget.price5.toString() + ' دينار بحريني ',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                        ),

                        SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: price6,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                              hintText: widget.price6.toString() + 'ريال القطري ',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                        ),
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
                              hintText: "التفاصيل : " + widget.des,
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
                              hintText: '  اسم المتجر   ' + widget.brand,
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
                        SizedBox(height: 15),

                        TextFormField(
                          controller: brandemail,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                              hintText: '  الايميل :  ' + widget.brandemail,
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
                        SizedBox(height: 11),

                        //   controller: cat,
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 17,
                        //       fontWeight: FontWeight.w900),
                        //   decoration: InputDecoration(
                        //       hintText: '  القسم التابع له هذا المنتج  ',
                        //       hintStyle: TextStyle(
                        //           color: Colors.grey,
                        //           fontSize: 21,
                        //           fontWeight: FontWeight.w500),
                        //       border: OutlineInputBorder(
                        //         borderSide: const BorderSide(
                        //             color: Colors.grey, width: 2.0),
                        //         borderRadius: BorderRadius.circular(60.0),
                        //       )),
                        //   validator: (value) {
                        //     if (value.isEmpty) {
                        //       return 'برجاء ادخال اسم القسم ';
                        //     }
                        //   },
                        // ),    // TextFormField(

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
                                'تعديل  ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 21),
                              ),
                              onPressed: () async {



                                if(upload==false) {
                                  upload = true;


                                  if(_image!=null) {
                                    var storageImage = FirebaseStorage.instance
                                        .ref()
                                        .child(_image.path);

                                    var task = storageImage.putFile(_image);

                                    _url = await (await task.onComplete)
                                        .ref
                                        .getDownloadURL() ?? widget.img;
                                  }
                                print("imageee=="+_url.toString());


                                num price1,priceQw,priceAmar,priceAm,priceBh,priceQ;
                                String name1,brand1,brandemail1,cat1,des1,img1;
                                print("brand1=="+widget.brand);

                                if(name.text!=''){
                                  name1=name.text;
                                }else{
                                  name1=widget.name;
                                }


                                if(brand.text!=''){
                                  brand1=brand.text;
                                }else{
                                  brand1=widget.brand;

                                }
                                if(brandemail.text!=''){
                                  brandemail1=brandemail.text??'x';
                                }else{
                                  brandemail1=widget.brandemail;
                                }


                                // if(cat.text!=''){
                                //   cat1=cat.text;
                                // }else{
                                //   cat1=widget.cat;
                                // }

                                if(des.text!=''){
                                  des1=des.text;
                                }else{
                                  des1=widget.des;
                                }



                                if(_url.toString()!=''){
                                  img1=_url.toString();
                                }else{
                                  img1=widget.img;
                                }







                                if(price.text!=''){
                                  price1=num.parse(price.text) ;
                                }else{
                                  price1=(widget.price);
                                }


                                if(price2.text!=''){
                                  priceQw=num.parse(price2.text);
                                }else{
                                  priceQw=(widget.price2);
                                }

                                if(price3.text!=''){
                                  priceAmar=num.parse(price3.text);
                                }else{
                                  priceAmar=(widget.price3);
                                }


                                if(price4.text!=''){
                                  priceAm=num.parse(price4.text);
                                }else{
                                  priceAm=(widget.price4);
                                }

                                if(price5.text!=''){
                                  priceBh=num.parse(price5.text);
                                }else{
                                  priceBh=(widget.price5);
                                }

                                if(price6.text!=''){
                                  priceQ=num.parse(price6.text);
                                }else{
                                  priceQ=(widget.price6);
                                }



                                  Firestore.instance
                                      .collection('products')
                                      .where('name', isEqualTo: widget.name)
                                      .get()
                                      .then((snapshot) {
                                    snapshot.docs.last.reference.updateData({
                                      'brand': brand1,
                                      'brandemail': brandemail1,
                                      'cat': 'x',
                                      'des': des1,
                                      'name': name1,
                                      'price': price1,
                                      'priceQw': priceQw,
                                      'priceAmar': priceAmar,
                                      'priceAm': priceAm,
                                      'priceBh': priceBh,
                                      'priceQ': priceQ,
                                      'image': img1
                                    });
                                  });
                                  await Flushbar(
                                    backgroundColor: Colors.red,
                                    title: 'ok',
                                    icon:Icon(Icons.star),
                                    message: 'تم تعديل المنتج بنجاح',
                                    duration: Duration(seconds: 3),
                                  ).show(context);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return Home();
                                      }));
                                }
else {
                                  await Flushbar(
                                    backgroundColor: Colors.red,
                                    title: '!!!!!!!!!!',
                                    icon: Icon(Icons.access_alarm_rounded),
                                    message: 'انتظر جاري تعديل المنتج ',
                                    duration: Duration(seconds: 3),
                                  ).show(context);
                                }

                              }),
                        )
                      ],
                    )
                  ]))),
        ));
  }

  Future pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    var file=await  ImageCropper().cropImage(
        sourcePath: image.path,aspectRatio: CropAspectRatio(ratioX: 5, ratioY: 5));
    setState(() {
      _image = file;
 //     uploadImage(context);
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

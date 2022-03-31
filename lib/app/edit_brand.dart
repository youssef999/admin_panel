

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trainpdf_app/app/home.dart';
import 'package:another_flushbar/flushbar.dart';
class EditAdmin extends StatefulWidget {
  String name, cat1,cat2,cat3, email,offer,img,pic ;

  EditAdmin({this.name,this.cat1,this.cat2,this.cat3,this.email,this.offer,this.img,this.pic});
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<EditAdmin> {
  //String imagepath;

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
  TextEditingController email = TextEditingController();
  TextEditingController  pass = TextEditingController();
  TextEditingController offer= TextEditingController();

  File _image, _image2;
  String _url='' , _url2='';
  bool bol =false;
  bool upload=false;
  String valuechoose;
  String valuechoose2;
  String valuechoose3;

  List listitem =["المذاق العُماني","الطيب العُماني","تمور","الحلوى العُمانيه","العسل العُماني","جمال و طبيعة","المشغولات العُمانيه"];
  List listitem2 =["x","المذاق العُماني","الطيب العُماني","تمور","الحلوى العُمانيه","العسل العُماني","جمال و طبيعة","المشغولات العُمانيه"];
  List listitem3 =["x","المذاق العُماني","الطيب العُماني","تمور","الحلوى العُمانيه","العسل العُماني","جمال و طبيعة","المشغولات العُمانيه"];


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
    offer.dispose();
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
                                hintText: widget.name,
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
                            // validator: (value) {
                            //   if (value.isEmpty) {
                            //     return 'ادخل اسم المتجر';
                            //   }
                            // }
                            ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left:25,right:25),
                          decoration:BoxDecoration(border: Border.all(color:Colors.grey,width:1)
                              ,borderRadius: BorderRadius.circular(45)),
                          child:   DropdownButton(

                            dropdownColor:Colors.blueGrey,
                            hint: Text(widget.cat1,style:TextStyle(color:Colors.white,fontSize:21,fontWeight:FontWeight.w500),),

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
                            hint: Text(widget.cat2,style:TextStyle(color:Colors.white,fontSize:21,fontWeight:FontWeight.w500),),

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
                            hint: Text(widget.cat3,style:TextStyle(color:Colors.white,fontSize:21,fontWeight:FontWeight.w500),),

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
                                hintText: widget.email,
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

                        TextFormField(
                            controller: offer,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w900),
                            decoration: InputDecoration(
                                hintText: widget.offer,
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
                                'تعديل  ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 21),
                              ),
                              onPressed: () async {

                                String catx1,catx2,catx3;
                               // if(widget)

                                  if(valuechoose==null){
                                    catx1=widget.cat1;
                                  }
                                  else{
                                    catx1=valuechoose;
                                  }


                                if(valuechoose2==null){
                                  catx2=widget.cat2;
                                }else{
                                  catx2=valuechoose2;
                                }

                                if(valuechoose3==null){
                                  catx3=widget.cat3;
                                }else{
                                  catx3=valuechoose3;
                                }

                                List catx=[catx1 ,catx2,catx3 ];

                                if(upload == false) {
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


                                  if(_image2!=null) {
                                    var storageImage2 = FirebaseStorage.instance
                                        .ref()
                                        .child(_image2.path);

                                    var task2 = storageImage2.putFile(_image2);

                                    _url2 = await (await task2.onComplete)
                                        .ref
                                        .getDownloadURL() ?? widget.pic;
                                  }


                                  String name1, cat1, brandemail1,offer1,img1,pic1;


                                  if(_url.toString()!=''){
                                    img1=_url.toString();
                                  }else{
                                    img1=widget.img;
                                  }

                                  if(_url2.toString()!=''){
                                    pic1=_url2.toString();
                                  }else{
                                    pic1=widget.pic;
                                  }


                                  if (name.text == '') {
                                    name1 = widget.name;
                                  }
                                  else {
                                    name1 = name.text;
                                  }

                                  if (email.text == '') {
                                    brandemail1= widget.email;
                                  }
                                  else {
                                    brandemail1 = email.text;
                                  }

                                  if (offer.text == '') {
                                    offer1 = widget.offer;
                                  }
                                  else {
                                    offer1 = offer.text;
                                  }


                                  Firestore.instance
                                      .collection('category')
                                      .where('name', isEqualTo: widget.name)
                                      .get()
                                      .then((snapshot) {
                                    snapshot.docs.last.reference.updateData({
                                      'name': name1, //name.text ??widget.name,
                                      'brandemail':brandemail1,
                                      'catx': catx,
                                      'offers': offer1,
                                      'image': img1,
                                      'pic':pic1
                                    });

                                  });

                                  await Flushbar(
                                    backgroundColor: Colors.green,
                                    title: 'ok',
                                    icon:Icon(Icons.star),
                                    message: 'تم تعديل المتجر بنجاح',
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
                                    title: '!!!!!!!!!!',
                                    icon: Icon(Icons.access_alarm_rounded),
                                    message: 'انتظر جاري تعديل المتجر ',
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
    var file= await ImageCropper().cropImage(
        sourcePath: image.path,aspectRatio: CropAspectRatio(ratioX: 5, ratioY: 5));
    //set state bt3ml update kol shwya

    setState(() {
      _image = file;
    });
  }

  Future pickImage2() async {
    var image2 = await ImagePicker.pickImage(source: ImageSource.gallery);
    var file=await ImageCropper().cropImage(
        sourcePath: image2.path,aspectRatio: CropAspectRatio(ratioX: 5, ratioY: 5));
    //set state bt3ml update kol shwya

    setState(() {
      _image2 = file;
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

  Future clearr2() {
    setState(() {
      _image2 = null;
    });
  }
}

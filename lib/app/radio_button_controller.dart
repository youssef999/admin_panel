


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{


String value='';


  changeMethod(String val){
    value=val;
    update();
  }
  


}
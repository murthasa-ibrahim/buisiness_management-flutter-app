import 'package:flutter/material.dart';

class Utils {

  static showSnackbar(String content,BuildContext context){
    final snackBar = SnackBar(content:Text(content) );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
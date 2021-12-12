import 'package:flutter/material.dart';

Color customColor({String? date}){
  switch (date){
    case 'Today' :
    return Colors.green;
    case 'Yesterday' :
    return Colors.purple;
    case 'Tomorrow' :
    return Colors.amber;
    default:
    return Colors.grey;
  }
}
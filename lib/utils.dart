

import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_app/model/todo.dart';
class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));


  static DateTime toDateTime(Timestamp value){

   return value.toDate();
  }


  static dynamic fromDateTimeToJson(DateTime date)
  {
    if(date==null)
      return null;
    return date.toUtc();

  }

}
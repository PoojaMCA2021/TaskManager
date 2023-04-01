import 'dart:async';
import 'dart:convert';

import'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/todo.dart';
import '../utils.dart';

class FirebaseApi{
  static Future<String> createTodo(Todo todo)async{
    final docTodo= FirebaseFirestore.instance.collection('todo').doc();
    todo.id=docTodo.id;

    await docTodo.set(todo.toJson()).then((value) => Fluttertoast.showToast(msg: "Add Task"),
    onError:(e)=>Fluttertoast.showToast(msg: "Something went wrong :$e"));

    return docTodo.id;
  }


  static Future<List<Todo>> getData()async{
    QuerySnapshot snapshot=await FirebaseFirestore.instance.collection('todo').get();
    List<Todo> _todos=snapshot.docs.map((e) => Todo.fromJson(e.data() as Map<String,dynamic>)).toList();
    return _todos;
  }
  static Future updateTodo(Todo todo)async{
    final docTodo=FirebaseFirestore.instance.collection('todo').doc(todo.id);
    await docTodo.update(todo.toJson());
    }
static Future deleteTodo(Todo todo)async{
    final docTodo=FirebaseFirestore.instance.collection('todo').doc(todo.id);
    await docTodo.delete();
}
}

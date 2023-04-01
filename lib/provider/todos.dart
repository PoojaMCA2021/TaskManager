import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_app/firebase_services/firebase_api.dart';

import '../model/todo.dart';
class TodosProvider extends ChangeNotifier {

  List<Todo> _todos = [];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) =>FirebaseApi.createTodo(todo);
  void setTodos(List<Todo>todos)=>
      WidgetsBinding.instance.addPostFrameCallback((_) { _todos =todos;
      notifyListeners();});



void removeTodo(Todo todo)=> FirebaseApi.deleteTodo(todo);


  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    FirebaseApi.updateTodo(todo);

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    FirebaseApi.updateTodo(todo);
  }
 }

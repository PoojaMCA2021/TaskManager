import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_app/utils.dart';

class TodoField{
  static const createdTime='createdTime';
}
class Todo{
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;
  Todo({
    required this.createdTime,
    required this.title,
    this.description='',
    this.isDone=false,
    required this.id,

});

  Map<String,dynamic>toJson()=>{
    'createdTime':Utils.fromDateTimeToJson(createdTime),
    'title':title,
    'description':description,
    'id':id,
    'isDone':isDone,
  };


  factory Todo.fromJson(Map<String,dynamic>json)=>
   Todo(
     createdTime: Utils.toDateTime(json['createdTime']),
     title: json['title'],
     description: json['description'],
     id: json['id'],
     isDone: json['isDone'],
   );





}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_app/provider/todos.dart';
import 'package:task_app/widgets/todo_widget.dart';
class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<TodosProvider>(context);
    final todos=provider.todos;
    return todos.isEmpty ?Center(
      child: Text('No task',
      style: TextStyle(fontSize: 20),),
    )
    :ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context,index)=>Container(height: 8,),
      itemCount: todos.length,
      itemBuilder: (context,index){
      final todo=todos[index];
      return TodoWidget(todo: todo);
    },

    );
  }
}

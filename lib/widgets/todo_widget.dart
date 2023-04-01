import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../model/todo.dart';
import '../provider/todos.dart';
import '../screens/edit_todo_page.dart';
import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          key: Key(todo.id),
          endActionPane:   ActionPane(
            motion: ScrollMotion(),
            children: [
                 SlidableAction(
                // An action can be bigger than the others.
                flex: 1,
                onPressed: (context)=>editTodo(context,todo),
                foregroundColor: Colors.blue,
                icon: Icons.edit,
                label: 'Edit',
              ),
               SlidableAction(
                onPressed:(context)=>deleteTodo(context,todo),
                label: 'Delete',
                foregroundColor: Colors.red,
                icon: Icons.delete,
              ),
            ],
          ),
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
    onTap: ()=>editTodo(context,todo),
    child: Container(
         color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Checkbox(
               activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,

                value: todo.isDone,
                onChanged: (_) {
                 final provider=Provider.of<TodosProvider>(context,listen: false);
                 final isDone=provider.toggleTodoStatus(todo);
                Utils.showSnackBar(context, isDone ?'Task Completed':'Task marked incomplete',);
                },
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    if (todo.description.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Text(
                          todo.description,
                          style: const TextStyle(fontSize: 20, height: 1.5,color: Colors.black),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
  );

  deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
    Utils.showSnackBar(context, 'Deleted the task');


  }
   editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditTodoPage(todo: todo),

    ),
  );
}





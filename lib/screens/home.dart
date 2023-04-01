import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/auth/google_sign_in.dart';
import 'package:task_app/main.dart';
import 'package:task_app/provider/todos.dart';
import 'package:task_app/widgets/completed_list_widget.dart';

import '../firebase_services/firebase_api.dart';
import '../model/todo.dart';
import '../widgets/add_todo_dialog_widget.dart';
import '../widgets/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          MyApp.title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Authentication().signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white.withOpacity(0.7),
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fact_check_outlined,
              size: 28,
            ),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done_outlined,
              size: 28,
            ),
            label: 'Completed',
          ),
        ],
      ),
      body: FutureBuilder(
        future: FirebaseApi.getData(),
        builder: ( context,  snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else {
            List<Todo>todo=snapshot.data as List<Todo>;
            final provider=Provider.of<TodosProvider>(context);
            provider.setTodos(todo);
            return tabs[selectedIndex];
        }

        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => showDialog(
            context: context,
            builder: (context) => AddTodoDialogWidget(),
            barrierDismissible: false),
      ),
    );
  }
}

Widget buildText(String s) => Center(
      child: Text(
        s,
        style: const TextStyle(fontSize: 24, color: Colors.white),
      ),
    );

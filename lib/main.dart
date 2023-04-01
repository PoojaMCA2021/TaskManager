import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/auth/google_sign_in.dart';
import 'package:task_app/provider/todos.dart';
import 'package:task_app/screens/home.dart';
import 'package:task_app/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final String title = "Todo App";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          title: title,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

            primarySwatch: Colors.yellow,
            scaffoldBackgroundColor: Color(0xFFf6f5ee),
          ),
          home:Authentication().handleAuthState(),
        ),
      );
}

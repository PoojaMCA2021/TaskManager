import 'package:flutter/material.dart';
import 'package:task_app/auth/google_sign_in.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child:const Image(image: AssetImage("assets/images/Taking_notes.png"),)
                  ),
                ),

                const Text("Manage Your Task With Todo",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black


                ),
                  textAlign: TextAlign.center,

                ),
                const SizedBox(height: 10.0,),
                ElevatedButton(onPressed: (){
                Authentication().signInWithGoogle();
                },
                  style: ButtonStyle(
                   shape: MaterialStateProperty.all(RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(16)
                   ))
                  ),
                  child: Padding(
                  padding: const EdgeInsets.only( left:10.0,top: 10.0,bottom: 10.0),

                  child: Row(
                    children: const [
                      Text("Sign in With Google",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white
                      ),),
                       SizedBox(width: 10,),
                       Image(image:AssetImage("assets/images/google.png",),height: 30,)
                    ],
                  ),
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

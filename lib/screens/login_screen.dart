import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/model/user_model.dart';
import 'package:login_demo/screens/home_screen.dart';
import 'package:login_demo/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passswordController = TextEditingController();
    print(emailController.text);
    print(passswordController.text);

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Colors.white,
     body: SingleChildScrollView(
       child: Column(
         //mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             height: 300,
             padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
             child:  Image.network("https://image.freepik.com/free-vector/access-control-system-abstract-concept_335657-3180.jpg"),
           ),
           Padding(
             padding: EdgeInsets.fromLTRB(13, 0, 0, 7),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text('Login ',style: TextStyle(fontSize: 30,color: Colors.blue),)
               ],
             ),
           ),
           Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
           child: TextFormField(
             controller: emailController,
             decoration: InputDecoration(
               contentPadding: const EdgeInsets.all(8.0),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10.0),
               ),
               hintText: "Mail",
             ),
           ),
           ),

           Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
           child: TextFormField(
             obscureText: true,
             controller: passswordController,
             decoration: InputDecoration(
               contentPadding: const EdgeInsets.all(8.0),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10.0),
               ),
               hintText: "Password",
             ),
           ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Padding(padding: EdgeInsets.all(4),
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(onPressed: () async{
                     await authService.signInWithEmailAndPassword(emailController.text, passswordController.text);
                   }, child: Text('Login'),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  //side: BorderSide(color: Colors.red)
                              )
                          )
                      )
                  ),
                ),
               ),

               // ElevatedButton(onPressed: (){
               //   Navigator.pushNamed(context, '/register');
               // }, child: Text('SignUp'))
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('New User ?'),
               TextButton(onPressed: (){ Navigator.pushNamed(context, '/register');}, child: Text('Create Account ',style: TextStyle(color: Colors.blue),))
             ],
           )
         ],
       ),
     ),

    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/screens/login_screen.dart';
import 'package:login_demo/services/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {

  const RegisterScreen({Key? key}) : super(key: key);

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
          children: [
            
            Container(
              height: 300,
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child:  Image.network("https://image.freepik.com/free-vector/access-control-system-abstract-concept_335657-3180.jpg"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Create Account ',style: TextStyle(fontSize: 30,color: Colors.blue),)
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
                controller: passswordController,
                obscureText: true,
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
                SizedBox(
                  width: 250,
                  child: ElevatedButton(onPressed: ()async{
                  await  authService.createUserWithEmailAndPassword(emailController.text, passswordController.text);
                  //Navigator.pop(context);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );

                  }, child: Text('SignUp'),
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

              ],
            )
          ],
        ),
      ),

    );
  }
}

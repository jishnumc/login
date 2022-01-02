import 'package:flutter/material.dart';
import 'package:login_demo/services/auth_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(

        children: [
          Text('Welcome To Home Screen'),
          Center(
            child: ElevatedButton(child: Text('Logout'),
              onPressed: ()async{
               await authService.signOut();
              },

            ),
          )
        ],
      ),
    );
  }
}

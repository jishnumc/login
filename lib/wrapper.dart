
import 'package:flutter/material.dart';
import 'package:login_demo/model/user_model.dart';
import 'package:login_demo/screens/home_screen.dart';
import 'package:login_demo/screens/login_screen.dart';
import 'package:login_demo/services/auth_service.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
            if(snapshot.connectionState==ConnectionState.active)
              {
                final User? user = snapshot.data;
                return user == null ? LoginScreen() : HomeScreen();
              }else{
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
        });
  }
}

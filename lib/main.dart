import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_demo/screens/home_screen.dart';
import 'package:login_demo/screens/login_screen.dart';
import 'package:login_demo/screens/register_screen.dart';
import 'package:login_demo/services/auth_service.dart';
import 'package:login_demo/wrapper.dart';
import 'package:provider/provider.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_)=>AuthService(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        theme: ThemeData(
                primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context)=> Wrapper(),
          '/home': (context)=> LoginScreen(),
          '/register': (context)=> RegisterScreen(),
        },
      ),
    );
  }
}


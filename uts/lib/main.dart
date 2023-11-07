import 'package:flutter/material.dart';
import 'login.dart';
import 'registrasi.dart';
import 'dashboard.dart';
import 'imt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RinLogin(),
        '/register': (context) => RinRegister(),
        '/dashboard': (context) => RinDashboard(),
        '/masatubuh': (context) => RinMasaTubuh(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

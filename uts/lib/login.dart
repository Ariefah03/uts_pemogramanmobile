import 'package:flutter/material.dart';

class RinLogin extends StatefulWidget {
  @override
  _RinLoginState createState() => _RinLoginState();
}

class _RinLoginState extends State<RinLogin> {
  void _handleSubmit() {
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  void _switchToRegister() {
    Navigator.pushReplacementNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleSubmit,
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _switchToRegister,
              child: Text('Belum punya akun? Daftar di sini'),
            ),
          ],
        ),
      ),
    );
  }
}

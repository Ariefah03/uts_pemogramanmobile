import 'package:flutter/material.dart';

class RinRegister extends StatefulWidget {
  @override
  _RinRegisterState createState() => _RinRegisterState();
}

class _RinRegisterState extends State<RinRegister> {
  void _handleSubmit() {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrasi')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Nama Lengkap'),
            ),
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
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

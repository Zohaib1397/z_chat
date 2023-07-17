import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:z_chat/constants.dart';
import 'package:z_chat/screens/welcome_screen.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "Registration_Screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              style: TextStyle(color: Colors.black),
              decoration: kTextFieldDecoration,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              style: TextStyle(color: Colors.black),
              decoration:
                  kTextFieldDecoration.copyWith(hintText: "Enter password"),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundButton(
              text: "Register",
              color: Colors.blueAccent,
              onPressed: () async {
                var newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                if(newUser != null){
                  Navigator.pushNamed(context, ChatScreen.id);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

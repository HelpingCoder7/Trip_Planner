// ignore_for_file: prefer_const_constructors

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safetyapp/dashboard.dart';
import 'package:safetyapp/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            children: [
              const Text(
                'WELCOME AGAIN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                './assets/images/plane.png',
                height: 280,
                width: 280,
              ),
              TextField(
                onChanged: (value) {
                  phoneNumber = value;
                },
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone_android_outlined),
                    hintText: 'Phone Number'),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              _login(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('DO NOT HAVE ACCOUNT | '),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text(
                      'CREATE ACCOUNT',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _login() {
    return GestureDetector(
      onTap: () async => {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resendToken) {
              auth.signInWithPhoneNumber(phoneNumber);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        ),
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            gradient: LinearGradient(colors: [Colors.deepOrange, Colors.red])),
        child: Center(
          child: GestureDetector(
            child: const InkWell(
              child: Text(
                'LOGIN',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

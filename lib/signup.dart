// ignore_for_file: implementation_imports

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safetyapp/login.dart';
import 'package:safetyapp/otpsrc.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  static String verify = '';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController countrycode = TextEditingController();

  @override
  void initState() {
    countrycode.text = "+91";
    super.initState();
  }

  String phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _backbtn(),
              const Text(
                'Signup',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                './assets/images/familytrip.jpg',
                height: 250,
                width: 250,
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                onChanged: (value) {
                  phoneNumber = value;
                },
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone_android_rounded),
                    hintText: 'Phone Number'),
              ),
              const SizedBox(
                height: 20,
              ),
              _signupbtn()
            ],
          ),
        ),
      ),
    );
  }

  _signupbtn() {
    return GestureDetector(
      onTap: () async => {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: countrycode.text + phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            // ignore: avoid_print
            print("verification faild");
          },
          codeSent: (String verificationId, int? resendToken) {
            Signup.verify = verificationId;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const otpsrc()));
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        )
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
            gradient:
                LinearGradient(colors: [Colors.red, Colors.yellowAccent])),
        child: Center(
          child: GestureDetector(
            child: const InkWell(
              child: Text(
                'Create Account',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _backbtn() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      },
      child: const Row(
        children: [Icon(Icons.arrow_back)],
      ),
    );
  }
}

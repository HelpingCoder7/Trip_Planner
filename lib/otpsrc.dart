import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safetyapp/dashboard.dart';
import 'package:safetyapp/signup.dart';

class otpsrc extends StatefulWidget {
  const otpsrc({super.key});

  @override
  State<otpsrc> createState() => _otpsrcState();
}

// ignore: camel_case_types
class _otpsrcState extends State<otpsrc> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String otp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Verify OTP',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                './assets/images/otpimg.jpg',
                height: 250,
                width: 250,
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                onChanged: (value) {
                  otp = value;
                },
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.numbers_sharp), hintText: 'OTP'),
              ),
              const SizedBox(
                height: 20,
              ),
              signupbtn(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  signupbtn() {
    return GestureDetector(
      onTap: () async {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: Signup.verify, smsCode: otp);
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Dashboard()),
            (route) => false);
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
                'Verify OTP',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

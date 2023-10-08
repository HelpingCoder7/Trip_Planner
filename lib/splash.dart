import 'package:flutter/material.dart';
import 'package:safetyapp/login.dart';

class splashscren extends StatefulWidget {
  const splashscren({super.key});

  @override
  State<splashscren> createState() => _splashscrenState();
}

class _splashscrenState extends State<splashscren> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settimeout();
  }

  settimeout()   async {
    await Future.delayed(Duration(milliseconds: 2500),(){});
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const Login())
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Image.asset(
                './assets/images/splashimg.jpg',
                height: 280,
                width: 280,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Plane your trip",
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

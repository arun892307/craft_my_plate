import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../Main_page.dart';
import 'Walkthrough_11.dart';

class Splash_Screen_2 extends StatefulWidget {
  const Splash_Screen_2({Key? key}) : super(key: key);

  @override
  State<Splash_Screen_2> createState() => _Splash_Screen_2State();
}

class _Splash_Screen_2State extends State<Splash_Screen_2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2),()
    {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainPage(),)
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Splash_2.png"),
                fit: BoxFit.fill
            )
        ),
      ),
    );
  }
}

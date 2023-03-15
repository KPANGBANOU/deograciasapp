// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, unused_element

import 'package:flutter/material.dart';

import '../wrapper.dart';

class Splash extends StatefulWidget {
  const Splash({key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(Duration(milliseconds: 3200), (() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => Wrapper())));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'images/icon.jpeg',
              width: 120,
              height: 120,
              scale: 2.5,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

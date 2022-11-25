import 'dart:async';
import 'package:flutter/material.dart';

import '../navbar/navbar.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Navbar(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Splash",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TeamsView extends StatelessWidget {
  const TeamsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(child: Text('Teams'))),
    );
  }
}
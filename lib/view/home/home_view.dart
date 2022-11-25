import 'package:flutter/material.dart';

import '../../services/get_all_contacts.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
    ? 'DarkTheme'
    : 'LightTheme';
    return const Scaffold(
      body: SafeArea(child: Center(child: Text('Home'))),
    );
  }
}
import 'package:flutter/material.dart';

class LoansView extends StatelessWidget {
  const LoansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(child: Text('Loans'))),
    );
  }
}
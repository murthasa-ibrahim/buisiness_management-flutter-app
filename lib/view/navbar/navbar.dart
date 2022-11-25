import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/navbar_provider.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavbarProvider>(
          builder: (_, provider, __) =>
              (provider.screens[provider.selectedIndex])),
      bottomNavigationBar: Consumer<NavbarProvider>(
        builder: (context, value, child) => BottomNavigationBar(
            iconSize: 30,
            currentIndex: value.selectedIndex,
            selectedItemColor:  Colors.lightBlueAccent,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: (index) => value.changeIndex(index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.monetization_on), label: 'Loans'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_page_sharp), label: 'Contacts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: 'Teams'),
                  BottomNavigationBarItem(
                  icon: Icon(Icons.chat), label: 'Chat'),
            ]),
      ),
    );
  }
}

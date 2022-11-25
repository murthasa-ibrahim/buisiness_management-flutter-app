import 'package:flutter/cupertino.dart';
import 'package:task_relu/view/chats/chats_view.dart';
import 'package:task_relu/view/contacts/contacts_view.dart';
import 'package:task_relu/view/home/home_view.dart';
import 'package:task_relu/view/loans/loans_view.dart';
import 'package:task_relu/view/teams/teams_view.dart';

class NavbarProvider extends ChangeNotifier{

  List<Widget> screens = const [
       HomeView(),
       LoansView(),
       ContactView(),
       TeamsView(),
       ChatView()
       
  ];
  int selectedIndex =0;
  void changeIndex(int index){
      selectedIndex = index;
      notifyListeners();
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_relu/services/invite_new_member.dart';
import 'package:task_relu/utils/utils.dart';

class InviteProvider extends ChangeNotifier {
  final emailInput = TextEditingController();
  final fomKey = GlobalKey<FormState>();
  String? validation(String? str) {
    
    const pattern=r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
     
    if (!regex.hasMatch(str ?? '')) {
      return 'Enter a valid mail';
    }
    return null;
  }

  List<String> teamRoles = [
    'Admin',
    "Approver",
    "Prepare",
    "Viewer",
    "Employee"
  ];
  int selectedIndex = 0;

  setTheRole(int index,BuildContext context){
     selectedIndex = index;
     notifyListeners();
     Navigator.of(context).pop();
  }

  submit(BuildContext context) {
    if (fomKey.currentState!.validate()) {
      InviteNewMemberApi().iviteNewMember(emailInput.text, selectedIndex+1).then((value){
        if(value.message != null){
           Utils.showSnackbar(value.message!, context);
        }
      });
    }
  }
}



import 'package:flutter/material.dart';
import 'package:task_relu/model/all_contact_model.dart';

import '../contacts/contacts_view.dart';

class SeeAllPeople extends StatelessWidget {
  const SeeAllPeople({Key? key, required this.contact}) : super(key: key);
  final List<Contact> contact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Invites'),
      ),
      body: ListView.builder(
        itemCount: contact.length,
        itemBuilder: (context, index) => ContactCard(contact: contact[index]),
      ),
      
    );
  }
}

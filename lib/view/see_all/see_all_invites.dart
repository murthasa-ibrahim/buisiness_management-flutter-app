

import 'package:flutter/material.dart';
import 'package:task_relu/model/all_contact_model.dart';

import '../contacts/contacts_view.dart';

class SeeAllInvites extends StatelessWidget {
  const SeeAllInvites({Key? key, required this.invites}) : super(key: key);
  final List<Invite> invites;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Invites'),
      ),
      body: ListView.builder(
        itemCount: invites.length,
        itemBuilder: (context, index) => InvitedPeopleCard(invite: invites[index]),
      ),
      
    );
  }
}

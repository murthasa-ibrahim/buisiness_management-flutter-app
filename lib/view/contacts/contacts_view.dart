import 'package:flutter/material.dart';
import 'package:task_relu/const/constant.dart';
import 'package:task_relu/model/all_contact_model.dart';
import 'package:task_relu/view/Invite_view/invite_view.dart';
import 'package:task_relu/view/see_all/see_all_invites.dart';
import 'package:task_relu/view/see_all/see_all_people.dart';

import '../../services/get_all_contacts.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<AllContacts>(
            future: GetAllContactsApi().getAllContact(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Teams',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      trailing: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                    ListTile(
                        title: Text(
                          'All people ${snapshot.data!.data.contacts.length}',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: TextButton(
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SeeAllPeople(
                                contact: snapshot.data!.data.contacts),
                          )),
                          child: const Text(
                            'See all',
                            style: TextStyle(
                                color: kblueAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),),
                    ListView.builder(
                      padding: const EdgeInsets.all(6),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) => ContactCard(
                        contact: snapshot.data!.data.contacts[index],
                      ),
                    ),
                    ListTile(
                        title: Text(
                            'Invited people. ${snapshot.data!.data.invites.length}'),
                        trailing: TextButton(
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SeeAllInvites(
                                invites: snapshot.data!.data.invites),
                          ),),
                          child: const Text(
                            'See all',
                            style: TextStyle(
                                color: kblueAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(6),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) => InvitedPeopleCard(
                          invite: snapshot.data!.data.invites[index],
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kblueAccent,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const InviteView(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
    required this.contact,
  }) : super(key: key);
  final Contact contact;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kwhite.withOpacity(.1),
      ),
      child: ListTile(
        leading: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 5, 111, 205),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
              child: Text(
            contact.firstname?[0]??'s',
            style: const TextStyle(fontSize: 16, color: kwhite),
          ),),
        ),
        title: Text(
          contact.firstname ?? 'name',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          contact.isactive ? 'Active' : 'Not Active',
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
        ),
        trailing: Text(
          contact.roleName.toString().split('.').last,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class InvitedPeopleCard extends StatelessWidget {
  const InvitedPeopleCard({
    Key? key,
    required this.invite,
  }) : super(key: key);
  final Invite invite;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kwhite.withOpacity(.1),
      ),
      child: ListTile(
        leading: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: Colors.brown, borderRadius: BorderRadius.circular(8)),
          child: const Center(
            child: Text(
              'KS',
              style: TextStyle(fontSize: 16, color: kwhite),
            ),
          ),
        ),
        title: Text(
          invite.configName.toString().split('.').first,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          invite.configName.toString().split('.').last,
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}

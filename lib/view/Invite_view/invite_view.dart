import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_relu/const/constant.dart';
import 'package:task_relu/view_model/invite_provider.dart';

class InviteView extends StatelessWidget {
  const InviteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<InviteProvider>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
              Text(
                'Invite',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              kheight,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).primaryColor),
                child: Form(
                  key: provider.fomKey,
                  child: TextFormField(
                    controller: provider.emailInput,
                    validator: (value) => provider.validation(value),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'Buisiness email',
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<InviteProvider>(
                builder: (_, provider, __) => Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).primaryColor),
                  child: Center(
                    child: ListTile(
                      title: Text(provider.teamRoles[provider.selectedIndex],style: const TextStyle(color: Colors.grey),),
                      trailing: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            context: context,
                            builder: (context) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 160),
                                  child: Divider(color: Theme.of(context).primaryColor,thickness: 6,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Team roles',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(16),
                                    itemCount: provider.teamRoles.length,
                                    itemBuilder: (context, index) =>
                                        TeamRollCard(index: index),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.keyboard_arrow_down_sharp,color: kblueAccent,),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => provider.submit(context),
          child: Container(
            decoration: BoxDecoration(
              color: kblueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 50,
            child: const Center(
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TeamRollCard extends StatelessWidget {
  const TeamRollCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final provider = context.read<InviteProvider>();
    return InkWell(
      onTap: () => provider.setTheRole(index, context),
      child: Container(
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: provider.selectedIndex == index
                ? Colors.blue.withOpacity(.2)
                : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            context.watch<InviteProvider>().teamRoles[index],
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: provider.selectedIndex == index
                    ? kblueAccent
                    : Colors.grey),
          ),
        ),
      ),
    );
  }
}

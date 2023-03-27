import 'package:entrepoty/ui/layout/layout.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../misc/misc.dart';
import '../../screens.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({
    super.key,
    required this.presenter,
  });
  final UserListPresenter presenter;
  @override
  Widget build(BuildContext context) {
    presenter.loadUsers();
    return HomeLayout(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(FluentIcons.search_12_regular),
            onPressed: () => Get.to(
              const SearchScreen(),
              transition: Transition.rightToLeft,
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: presenter.usersStream,
        builder: (context, snapshot) {
          return snapshot.data?.isNotEmpty == true
              ? ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) =>
                      UserListCard(user: snapshot.data![index])))
              : const Center(child: Text("Loading"));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "add-user",
        onPressed: () => Get.toNamed(Routes.createUser),
        icon: const Icon(Icons.add),
        label: const Text("Create user"),
      ),
    );
  }
}

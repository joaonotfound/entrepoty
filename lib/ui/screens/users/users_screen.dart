import 'package:entrepoty/ui/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:entrepoty/ui/screens/screens.dart';
import 'package:get/get.dart';

import '../../misc/misc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({
    super.key,
    required this.presenter,
  });
  final UsersScreenPresenter presenter;
  @override
  Widget build(BuildContext context) {
    presenter.loadUsers();
    return HomeLayout(
      body: StreamBuilder(
        stream: presenter.usersStream,
        builder: (context, snapshot) {
          return snapshot.data?.isNotEmpty == true
              ? ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) =>
                      UserCard(user: snapshot.data![index])))
              : Center(
                  child: Text("Loading"),
                );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "add-user",
        onPressed: () => Get.toNamed(Routes.createUser),
        icon: Icon(Icons.add),
        label: Text("Criar usuário"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:entrepoty/ui/components/components.dart';
import 'package:entrepoty/ui/screens/screens.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({
    super.key,
    required this.presenter,
  });
  final UsersScreenPresenter presenter;
  @override
  Widget build(BuildContext context) {
    presenter.loadUsers();
    return Scaffold(
      bottomNavigationBar: makeBottomNavigationBar(),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "add-user",
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text("Criar usuário"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: StreamBuilder(
              stream: presenter.usersStream,
              builder: (context, snapshot) {
                return snapshot.data?.isNotEmpty == true
                    ? ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10),
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) =>
                            UserCard(user: snapshot.data![index])))
                    : Center(
                        child: Text("Loading"),
                      );
              }),
        ),
      ),
    );
  }
}

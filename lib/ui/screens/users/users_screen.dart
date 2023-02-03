import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_desk_2/domain/domain.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({
    super.key,
    required this.presenter,
  });
  final UsersScreenPresenter presenter;
  @override
  Widget build(BuildContext context) {
    presenter.loadUsers();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: StreamBuilder(
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
          }),
    );
  }
}

class UserCard extends StatelessWidget {
  UserCard({
    super.key,
    required this.user,
  });
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Color.fromRGBO(0, 0, 0, 0.1),
          //     offset: Offset(0, 3),
          //     blurRadius: 4,
          //   ),
          // ],
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[100],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.network(
              user.profilePicture,
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            SizedBox(width: 15),
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

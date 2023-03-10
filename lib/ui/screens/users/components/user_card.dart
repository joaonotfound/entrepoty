import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../domain/domain.dart';

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

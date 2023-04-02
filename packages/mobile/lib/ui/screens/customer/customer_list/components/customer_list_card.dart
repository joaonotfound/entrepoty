import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../domain/domain.dart';

class CustomerListCard extends StatelessWidget {
  CustomerListCard({
    super.key,
    required this.user,
  });
  final CustomerEntity user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.network(
              "https://source.boringavatars.com/beam",
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            SizedBox(width: 15),
            Text(
              user.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

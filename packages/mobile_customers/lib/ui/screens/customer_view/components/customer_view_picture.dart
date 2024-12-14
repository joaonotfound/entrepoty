import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_customers/domain/domain.dart';

class CustomerViewPicture extends StatelessWidget {
  CustomerEntity customer;

  CustomerViewPicture({
    required this.customer, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.network(
            'https://source.boringavatars.com/beam',
            width: 120,
          ),
        ],
      ),
    );
  }
}

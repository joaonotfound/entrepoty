import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../../../domain/domain.dart';

class BorrowViewProduct extends StatelessWidget {
  BorrowEntity borrow;

  BorrowViewProduct({
    Key? key,
    required this.borrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backendProvider = Get.find<BackendProvider>();
    final model = borrow.productDetail;

    return Container(
      child: Column(
        children: [
          ClipRRect(
            child: FutureBuilder(
              initialData: "",
              future: backendProvider.loadResource(borrow.product.imagePath),
              builder: (context, snapshot) {
                return Image.network(
                  snapshot.data!,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                );
              }
            ),
          ),
          ListTile(
            title: Text(borrow.product.name),
            subtitle: Text(borrow.product.category),
          ),
          ListTile(
            title: const Text("Devolution Date"),
            subtitle: Text("${borrow.date.day}/${borrow.date.month}/${borrow.date.year}"),
          )
        ],
      ),
    );
  }
}

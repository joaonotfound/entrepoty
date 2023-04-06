import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/ui/providers/backend_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BorrowViewProduct extends StatelessWidget {
  BorrowEntity borrow;

  BorrowViewProduct({
    Key? key,
    required this.borrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backendProvider = Get.find<BackendProvider>();
    final model = borrow.product.model;

    return Container(
      child: Column(
        children: [
          ClipRRect(
            child: Image.network(
              backendProvider.loadResource(model.imagePath),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(model.name),
            subtitle: Text(model.category),
          ),
          ListTile(
            title: Text("Devolution Date"),
            subtitle: Text("${borrow.date.day}/${borrow.date.month}/${borrow.date.year}"),
          )
        ],
      ),
    );
  }
}

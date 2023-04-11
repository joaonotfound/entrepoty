import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_products/domain/domain.dart';

class StockViewProductDetail extends StatelessWidget {
  UniqueProductEntity product;

  StockViewProductDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backendProvider = Get.find<BackendProvider>();
    return Column(
      children: [
        FutureBuilder<String?>(
          future: backendProvider
              .loadResource(product.product.imagePath),
          builder: (context, snapshot) => Image.network(
            snapshot.data ?? "",
            height: 250,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            errorBuilder: (_, __, ___) => Text("No image"),

          ),
        ),
        ListTile(
          title: const Text("Product"),
          subtitle: Text(product.product.name),
        ),
        ListTile(
          title: const Text("Category"),
          subtitle: Text(product.product.category),
        ),
      ],
    );
  }
}

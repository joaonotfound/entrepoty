import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_products/domain/domain.dart';
import 'package:mobile_products/ui/components/equity_list_tile.dart';

class ProductCreationResultScreen extends StatelessWidget {
  List<ProductDetailEntity> equities;

  ProductCreationResultScreen({
    Key? key,
    required this.equities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Equities"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      EquityListTile(detail: equities[index]),
                  itemCount: equities.length,
                ),
              ),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text("Finish"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

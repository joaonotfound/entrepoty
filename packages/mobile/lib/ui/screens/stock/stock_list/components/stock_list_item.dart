import 'package:entrepoty/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

class StockListItem extends StatelessWidget {
  final ProductEntity item;

  StockListItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final backendProvider = Get.find<BackendProvider>();

    return ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          backendProvider.loadResource(item.model.imagePath),
        ),
      ),
      title: Text(
        item.model.name,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        item.quantity.toString() + "x Units.",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}

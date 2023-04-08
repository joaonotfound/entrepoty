import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../../../../domain/domain.dart';

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
      leading: FutureBuilder(
          future: backendProvider.loadResource(item.model.imagePath),
          builder: (context, snapshot) {
            return CircleAvatar(
              backgroundImage: NetworkImage(
                snapshot.data!,
              ),
            );
          }),
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

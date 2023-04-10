import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../../../../domain/domain.dart';

class StockListItem extends StatelessWidget {
  final ProductEntity item;

  const StockListItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final backendProvider = Get.find<BackendProvider>();

    return InkWell(
      onTap: () => Get.toNamed(
        Routes.getViewProduct(item.id),
      ),
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.surface,
        leading: FutureBuilder(
            future: backendProvider.loadResource(item.model.imagePath),
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? const CircleAvatar(backgroundColor: Colors.grey)
                  : CircleAvatar(
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
          "${item.quantity}x Units.",
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

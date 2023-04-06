import 'package:entrepoty/domain/domain.dart';
import 'package:flutter/material.dart';

class StockListItem extends StatelessWidget {
  final ProductEntity item;
  StockListItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      leading: Icon(
        Icons.image,
        size: 40,
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

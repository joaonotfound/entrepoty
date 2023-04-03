import 'package:entrepoty/domain/domain.dart';
import 'package:flutter/material.dart';

class StockListItem extends StatelessWidget {
  ProductEntity item;
  StockListItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.image,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.model.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      item.quantity.toString() + " units.",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

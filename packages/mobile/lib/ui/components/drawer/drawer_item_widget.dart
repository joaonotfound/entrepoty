import 'package:flutter/material.dart';

import 'drawer_item.dart';

class DrawerItemWidget extends StatelessWidget {
  final DrawerItem item;
  const DrawerItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          child: TextButton.icon(
            icon: Icon(
              item.icon,
              color:
                  item.selected ? Theme.of(context).primaryColor : Colors.white,
            ),
            label: Text(
              item.name,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: item.selected
                    ? Theme.of(context).primaryColor
                    : Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

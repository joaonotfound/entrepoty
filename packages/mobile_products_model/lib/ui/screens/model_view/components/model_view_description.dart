import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';

class ModelViewDescription extends StatelessWidget {
  final ProductModelEntity model;

  ModelViewDescription({Key? key, required this.model,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(
        model.name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        model.category,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

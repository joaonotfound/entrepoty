import 'package:entrepoty/domain/domain.dart';
import 'package:flutter/material.dart';

class ModelViewDescription extends StatelessWidget {
  ProductModelEntity model;

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

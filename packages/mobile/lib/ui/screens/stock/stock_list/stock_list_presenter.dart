import 'package:flutter/material.dart';
import 'package:entrepoty/domain/entities/category_entity.dart';
import 'package:entrepoty/domain/entities/product_entity.dart';

abstract class StockListPresenter implements Listenable {
  Stream<List<CategoryEntity>> get categoriesStream;
  Stream<List<ProductEntity>> get itemsStream;
  Future<void> loadScreen();
  void dispose();
}

import 'package:flutter/material.dart';
import 'package:entrepoty/domain/entities/category_entity.dart';
import 'package:entrepoty/domain/entities/product_entity.dart';

abstract class StockListPresenter implements Listenable {
  Stream<List<String>> get categoriesStream;
  Stream<List<ProductEntity>> get itemsStream;

  Future<List<String>> loadCategories();
  Future<void> loadScreen();

  void dispose();
}

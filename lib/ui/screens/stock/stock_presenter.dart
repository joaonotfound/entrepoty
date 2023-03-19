import 'package:flutter/material.dart';
import 'package:entrepoty/domain/entities/category_entity.dart';
import 'package:entrepoty/domain/entities/stock_item_entity.dart';

abstract class StockPresenter implements Listenable {
  Stream<List<CategoryEntity>> get categoriesStream;
  Stream<List<StockItemEntity>> get itemsStream;
  Future<void> loadScreen();
  void dispose();
}

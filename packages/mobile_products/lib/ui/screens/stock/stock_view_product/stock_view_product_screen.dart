import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_core/ui/components/components.dart';
import 'package:mobile_products/mobile_products.dart';
import 'package:mobile_products/ui/screens/stock/stock_view_product/components/components.dart';

class StockViewProductScreen extends StatefulWidget {
  StockViewProductPresenter presenter;

  StockViewProductScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<StockViewProductScreen> createState() => _StockViewProductScreenState();
}

class _StockViewProductScreenState extends State<StockViewProductScreen> {
  @override
  void initState() {
    widget.presenter.loadProduct(int.parse(Get.parameters['id'] ?? '0'));
    super.initState();
  }

  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
      ),
      body: StreamBuilder<UniqueProductEntity?>(
          stream: widget.presenter.productStream,
          builder: (context, snapshot) {
            return snapshot.data == null
                ? const Loading()
                : NotificationListener<ScrollUpdateNotification>(
                    onNotification: (notification) {
                      setState(() {
                        _scrollOffset = notification.metrics.pixels;
                      });
                      return true;
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child:
                              StockViewProductDetail(product: snapshot.data!),
                        ),
                        StockViewProductListEquities(products: snapshot.data!.details)
                      ],
                    ),
                  );
          }),
    );
  }
}

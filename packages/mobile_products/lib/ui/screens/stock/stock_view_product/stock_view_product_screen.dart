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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FluentIcons.search_20_regular),
          )
        ],
      ),
      body: StreamBuilder<UniqueProductEntity?>(
          stream: widget.presenter.productStream,
          builder: (context, snapshot) {
            return snapshot.data == null
                ? const Loading()
                : Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: NotificationListener<ScrollUpdateNotification>(
                          onNotification: (notification) {
                            setState(() {
                              _scrollOffset = notification.metrics.pixels;
                            });
                            return true;
                          },
                          child: CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: StockViewProductDetail(
                                    product: snapshot.data!),
                              ),
                              StockViewProductListEquities(
                                product: snapshot.data!.product,
                                  details: snapshot.data!.details,)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(FluentIcons.document_20_regular),
                          label: const Text("Download Receipt"),
                        ),
                      )
                    ],
                  );
          }),
    );
  }
}

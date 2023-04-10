import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';

import '../stock_list_presenter.dart';

class StockListWelcomeMessage extends StatelessWidget {
  const StockListWelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<StockListPresenter>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

      ],
    );
  }
}

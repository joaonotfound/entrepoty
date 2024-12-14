import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../../domain/domain.dart';
import '../../ui.dart';
import 'components/components.dart';

class BorrowViewScreen extends StatelessWidget {
  BorrowViewPresenter presenter;

  BorrowViewScreen({
    required this.presenter, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    presenter.loadBorrow(int.parse(Get.parameters['id'] ?? '0'));

    return StreamBuilder<BorrowEntity?>(
      stream: presenter.modelStream,
      builder: (context, snapshot) => Scaffold(
        appBar: AppBar(
          title: const Text('Borrow'),
        ),
        body: SafeArea(
          child: snapshot.data == null
              ? const Loading()
              : Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListView(
                        children: [
                          BorrowViewProduct(borrow: snapshot.data!),
                          BorrowViewCustomer(borrow: snapshot.data!),
                          BorrowViewEmployer(borrow: snapshot.data!),
                        ],
                      ),
                    ),
                    const BorrowViewWriteOff(),
                  ],
                ),
        ),
      ),
    );
  }
}

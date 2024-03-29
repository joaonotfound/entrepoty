import 'package:flutter/material.dart';
import '../../../domain/domain.dart';
import '../../ui.dart';
import 'components/components.dart';
import "package:mobile_core/mobile_core.dart";
import 'package:get/get.dart';

class BorrowViewScreen extends StatelessWidget {
  BorrowViewPresenter presenter;

  BorrowViewScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    presenter.loadBorrow(int.parse(Get.parameters['id'] ?? '0'));

    return StreamBuilder<BorrowEntity?>(
      stream: presenter.modelStream,
      builder: (context, snapshot) => Scaffold(
        appBar: AppBar(
          title: const Text("Borrow"),
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
                          BorrowViewEmployer(borrow: snapshot.data!)
                        ],
                      ),
                    ),
                    BorrowViewWriteOff(),
                  ],
                ),
        ),
      ),
    );
  }
}

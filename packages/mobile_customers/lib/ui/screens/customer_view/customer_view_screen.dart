import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_customers/mobile_customers.dart';
import 'package:mobile_customers/ui/screens/customer_view/components/components.dart';

class CustomerViewScreen extends StatefulWidget {
  CustomerViewPresenter presenter;

  CustomerViewScreen({
    required this.presenter, Key? key,
  }) : super(key: key);

  @override
  State<CustomerViewScreen> createState() => _CustomerViewScreenState();
}

class _CustomerViewScreenState extends State<CustomerViewScreen> {
  @override
  void initState() {
    super.initState();
    widget.presenter.loadCustomer(Get.parameters['enrollment'] ?? '');
  }

  @override
  Widget build(BuildContext context) {
    Get.put<CustomerViewPresenter>(widget.presenter);
    return StreamBuilder<CustomerEntity?>(
      stream: widget.presenter.customerStream,
      builder: (context, snapshot) => Scaffold(
        appBar: AppBar(
          title: const Text('Customer'),
        ),
        body: SafeArea(
          child: snapshot.data == null
              ? const Loading()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 12.0,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListView(
                          children: [
                            CustomerViewPicture(customer: snapshot.data!),
                            CustomerViewInformation(customer: snapshot.data!),
                          ],
                        ),
                      ),
                      CustomerViewDelete(customer: snapshot.data!,),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

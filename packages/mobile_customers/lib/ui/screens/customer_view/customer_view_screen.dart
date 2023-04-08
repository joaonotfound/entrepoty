import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_customers/mobile_customers.dart';
import 'package:get/get.dart';
import 'package:mobile_customers/ui/screens/customer_view/components/components.dart';

class CustomerViewScreen extends StatefulWidget {
  CustomerViewPresenter presenter;

  CustomerViewScreen({
    Key? key,
    required this.presenter,
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
    return StreamBuilder<CustomerEntity?>(
      stream: widget.presenter.customerStream,
      builder: (context, snapshot) => Scaffold(
        appBar: AppBar(
          title: const Text("Customer"),
        ),
        body: SafeArea(
          child: snapshot.data == null
              ? const Center(
                  child: Text("Loading"),
                )
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
                            CustomerViewInformation(customer: snapshot.data!)
                          ],
                        ),
                      ),
                      const CustomerViewDelete()
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

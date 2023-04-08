import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_customers/mobile_customers.dart';
import 'package:get/get.dart';

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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.network(
                                    "https://source.boringavatars.com/beam",
                                    width: 120,
                                  )
                                ],
                              ),
                            ),
                            ListTile(
                              leading: const CircleAvatar(
                                  child: Icon(FluentIcons.person_20_regular)),
                              title: const Text("Name"),
                              subtitle: Text(snapshot.data!.name),
                            ),
                            ListTile(
                              leading: const CircleAvatar(
                                child: Icon(
                                  FluentIcons.organization_20_regular,
                                ),
                              ),
                              title: const Text("Enrollment"),
                              subtitle: Text(snapshot.data!.enrollment),
                            ),
                            ListTile(
                              leading: const CircleAvatar(
                                child: Icon(FluentIcons.mail_20_regular),
                              ),
                              title: const Text("E-mail"),
                              subtitle: Text(snapshot.data!.email),
                            ),
                            ListTile(
                              leading: const CircleAvatar(
                                child:
                                    Icon(FluentIcons.organization_20_regular),
                              ),
                              title: Text("Sector"),
                              subtitle: Text(snapshot.data!.sector),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Delete"),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

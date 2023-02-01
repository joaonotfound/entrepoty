import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

class RegisterLotItemsListView extends StatelessWidget {
  const RegisterLotItemsListView({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final RegisterLotPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            StreamBuilder(
              stream: presenter.itemsStreams,
              builder: ((context, snapshot) => snapshot.data?.isNotEmpty == true
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) => Container()))
                  : Center(
                      child: Text("Não há itens cadastrados!"),
                    )),
            ),
            ListenableProvider(
              create: (_) => presenter,
              child: FloatingActionButton(
                onPressed: () => Get.toNamed("/stock/create_lot/item"),
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

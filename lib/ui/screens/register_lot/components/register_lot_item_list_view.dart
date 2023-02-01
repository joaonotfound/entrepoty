import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

class RegisterLotItemsListView extends StatelessWidget {
  const RegisterLotItemsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<RegisterLotPresenter>(context);
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
                onPressed: () => Get.to(RegisterLotItemScreen(
                  presenter: presenter,
                )),
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

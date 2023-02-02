import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:service_desk_2/domain/entities/entities.dart';
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
          children: [
            StreamBuilder<List<CreateStockItemEntity>>(
              stream: presenter.itemsStreams,
              builder: ((context, snapshot) => snapshot.data?.isNotEmpty == true
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) => RegisterLotItemCard(
                            item: snapshot.data![index],
                          )))
                  : Center(
                      child: Text("Não há itens cadastrados!"),
                    )),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ListenableProvider(
                create: (_) => presenter,
                child: FloatingActionButton(
                  onPressed: () => Get.to(RegisterLotItemScreen(
                    presenter: presenter,
                  )),
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterLotItemCard extends StatelessWidget {
  const RegisterLotItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CreateStockItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFFE6E6E6),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.image,
              color: Color.fromARGB(255, 78, 61, 61),
              size: 40,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text("${item.quantity} unidades"),
            ],
          ),
        ],
      ),
    );
  }
}

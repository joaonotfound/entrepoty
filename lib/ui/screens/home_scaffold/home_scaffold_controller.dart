import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_desk_2/ui/screens/stock/components/components.dart';
import 'package:service_desk_2/ui/ui.dart';

class HomeScaffoldController extends StatefulWidget {
  final List<HomeScaffoldScreen> screens;
  const HomeScaffoldController({
    super.key,
    required this.screens,
  });

  @override
  State<HomeScaffoldController> createState() => _HomeScaffoldControllerState();
}

class _HomeScaffoldControllerState extends State<HomeScaffoldController> {
  bool _searching = false;
  int _selectedIndex = 0;

  Widget getPage(int index) {
    return widget.screens.map((e) => e.widget).toList()[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppbar(),
      resizeToAvoidBottomInset: false,
      // drawer: makeDrawer(context),
      bottomNavigationBar: makeBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed("/stock/create_item/"),
        label: Text("Adicionar item"),
        icon: Icon(Icons.add),
      ),
      body: getPage(_selectedIndex),
    );
  }

  AppBar makeAppbar() {
    return AppBar(
      title: _searching ? StockSearchInput() : null,
      actions: [
        IconButton(
            onPressed: () => setState(() => _searching = !_searching),
            icon: Icon(_searching ? Icons.close : Icons.search)),
      ],
    );
  }

  Widget makeBottomNavigationBar() {
    return SizedBox(
      height: 64,
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() => _selectedIndex = value),
        items: widget.screens
            .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_manga_app/screens/screens.dart';
import 'package:read_manga_app/widgets/custom_navigatorbar.dart';

import '../providers/ui_provider.dart';

class HomePage extends StatelessWidget {
  static const String routerName = 'home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work in Progress"),
      ),
      body: _HomeScreenBody(),
      extendBody: true,
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    // cridam es provider per canviar de pantalla
    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return Text("Home");

      case 1:
        return Text("Search");

      case 2:
        return Text("Library");

      default:
        return MoreSettings();
    }
  }
}
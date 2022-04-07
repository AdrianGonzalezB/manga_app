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
      body: const _HomeScreenBody(),
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
    // Call UiProvider to Switch between screens
    final currentIndex = uiProvider.selectedMenuOpt;
    // Switch between screens
    switch (currentIndex) {
      case 0:
        return Text("Home");

      case 1:
        return Text("Search");

      case 2:
        return MangaLibrary();

      default:
        return MoreSettings();
    }
  }
}

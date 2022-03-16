// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
        onTap: (int index) => uiProvider.selectedMenuOpt = index,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          // Home BottomNavigationBar
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home Page',
          ),
          // Search BottomNavigationBar
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            tooltip: 'Search',
          ),
          // Library BottomNavigationBar
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Library',
            tooltip: 'library',
          ),
          // More BottomNavigationBar
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
            tooltip: 'More Options',
          ),
        ]);
  }
}

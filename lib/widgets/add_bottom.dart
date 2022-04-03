import 'dart:ffi';

import 'package:flutter/material.dart';

class AddBottom extends StatelessWidget {
  final List<int> items;
  AddBottom({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}

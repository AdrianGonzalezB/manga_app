import 'package:flutter/material.dart';
import 'package:read_manga_app/shared_preferences/preferences.dart';

class AddBottom extends StatefulWidget {
  const AddBottom({Key? key}) : super(key: key);

  @override
  State<AddBottom> createState() => _AddBottomState();
}

class _AddBottomState extends State<AddBottom> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  var list = Preferences.category;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      elevation: 0,
      onPressed: () async {
        final category = await openDialog();
        if (category == null || category.isEmpty) return;

        setState(() {
          list.add(category);
          Preferences.setCategory = list;
        });
      },
      icon: const Icon(
        Icons.add,
        semanticLabel: 'Add',
      ),
      label: const Text('Add'),
    );
  }

  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Add category'),
            content: TextField(
              autofocus: true,
              decoration: const InputDecoration(hintText: 'Category name'),
              controller: controller,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(controller.text);
                  },
                  child: const Text('Accept'))
            ],
          ));
}

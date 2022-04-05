import 'package:read_manga_app/shared_preferences/preferences.dart';
import 'package:read_manga_app/widgets/add_bottom.dart';

import '../widgets/widgets.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  var list = Preferences.category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Categories"),
      ),
      floatingActionButton: AddBottom(),
      body: ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        children: <Widget>[
          for (int index = 0; index < list.length; index += 1)
            ListTile(
              key: ValueKey(index),
              title: Text(
                list[index],
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(Icons.drag_handle), // Draggable icon
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
              final String item = Preferences.category.removeAt(oldIndex);
              list.insert(newIndex, item);
              Preferences.setCategory = list;
            }
          });
        },
      ),
    );
  }
}

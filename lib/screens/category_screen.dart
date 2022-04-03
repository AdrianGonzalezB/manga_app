import 'package:provider/provider.dart';
import 'package:read_manga_app/shared_preferences/preferences.dart';
import 'package:read_manga_app/widgets/add_bottom.dart';

import '../widgets/widgets.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  final List<String> _items = Preferences.category;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Categories"),
      ),
      floatingActionButton: AddBottom(),
      body: ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        children: <Widget>[
          for (int index = 0; index < _items.length; index += 1)
            ListTile(
              key: ValueKey(index),
              title: Text(
                _items[index],
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(Icons.drag_handle), // Draggable icon
              onTap: () {},
              // onLongPress: () {}, // Not necessari, bugs the dragable ListView
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final String item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}

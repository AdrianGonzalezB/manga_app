import 'package:read_manga_app/shared_preferences/preferences.dart';
import 'package:read_manga_app/widgets/add_bottom.dart';

import '../widgets/widgets.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  List<String> list = Preferences.category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Categories"),
      ),
      floatingActionButton: const AddBottom(),
      body: ReorderableListView(
        buildDefaultDragHandles: false,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        children: <Widget>[
          for (int index = 0; index < Preferences.category.length; index += 1)
            Dismissible(
              // Set a UniqueKey to resolve problems on the tree
              key: UniqueKey(),
              // Only can delete from 1 direction (rigth to left = endToStart)
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                child: const Align(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.delete_forever),
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
              child: Container(
                key: Key('$index'),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 64,
                      height: 64,
                      padding: const EdgeInsets.all(8),
                      // Contains the draggable Icon
                      child: ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Icons.drag_handle),
                      ),
                    ),
                    // The text of the category on each Container
                    Text(
                      Preferences.category[index],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              onDismissed: (DismissDirection direction) {
                // Remove the item from the data source.
                setState(() {
                  list.removeAt(index);
                  Preferences.setCategory = list;
                });
              },
            ),
        ],
        // User reorder the list
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            // Gets the old index and saves the new
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final String item = list.removeAt(oldIndex);
            list.insert(newIndex, item);
            Preferences.setCategory = list;
          });
        },
      ),
    );
  }
}

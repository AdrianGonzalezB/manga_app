import 'package:flutter/material.dart';

import '../shared_preferences/preferences.dart';

class MangaLibrary extends StatefulWidget {
  MangaLibrary({Key? key}) : super(key: key);

  @override
  State<MangaLibrary> createState() => _MangaLibraryState();
}

class _MangaLibraryState extends State<MangaLibrary> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Preferences.category.length,
        itemBuilder: (BuildContext context, int index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    child: Text(
                      Preferences.category[index],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      print(Preferences.category[index]);
                    },
                  ),
                ),
              ],
          ),
        );
  }
}

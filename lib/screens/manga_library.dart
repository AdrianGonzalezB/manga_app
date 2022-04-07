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
    return SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                for (int index = 0; index < Preferences.category.length; index += 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    child: Text(
                      Preferences.category[index],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}

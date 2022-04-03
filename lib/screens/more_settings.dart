import 'package:flutter/material.dart';
import 'package:read_manga_app/screens/category_screen.dart';

import 'screens.dart';

class MoreSettings extends StatelessWidget {
  const MoreSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          _Views(),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Appbar with scroll
    return SliverAppBar(
      //backgroundColor: Color.fromARGB(255, 41, 41, 43),
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 50),
          child: const Text(
            "More",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        /*background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage("assets/fondo.jpg"),
          fit: BoxFit.cover,
        ),*/
      ),
    );
  }
}

class _Views extends StatelessWidget {
  const _Views({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        ListTile(
          title: const Text(
            'Configuration',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: const Icon(Icons.settings),
          // OnTap go to SettingScreen
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsScreen()));
          },
        ),
        ListTile(
          title: const Text(
            'Categories',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: const Icon(Icons.label_outline_rounded),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CategoryPage()));
          },
        ),
      ]),
    );
  }
}

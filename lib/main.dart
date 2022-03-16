import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_manga_app/providers/providers.dart';
import 'package:read_manga_app/screens/home_page.dart';

import 'shared_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode),
      lazy: false,
    ),
    ChangeNotifierProvider(create: (_) => UiProvider()),
  ], child: MangaApp()));
}

class MangaApp extends StatelessWidget {
  const MangaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ReadManga',
      initialRoute: HomePage.routerName,
      routes: {
        HomePage.routerName: (_) => const HomePage(),
      },
      theme: Provider.of<ThemeProvider>(context).currenTheme,
    );
  }
}

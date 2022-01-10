import 'package:flutter/material.dart';
import 'package:flutter_datapersistence/src/screens/settings_view.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Local Data Persistence',
      debugShowCheckedModeBanner: false,
      
      themeMode:  ThemeMode.system,
      
      home:  SettingsView()
      // MyHomePage(title: 'Local Data Persistence'),
    );
  }
}
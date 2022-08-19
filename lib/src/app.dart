import 'package:bsl/src/home/home_page.dart';
import 'package:bsl/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: SettingsController.instance,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: SettingsController.instance.themeMode,
            theme: ThemeData(
                useMaterial3: true,
                colorSchemeSeed: Colors.red,
                appBarTheme: const AppBarTheme(
                  centerTitle: true,
                )),
            darkTheme: ThemeData(
                useMaterial3: true,
                colorSchemeSeed: Colors.red,
                brightness: Brightness.dark,
                appBarTheme: const AppBarTheme(
                  centerTitle: true,
                )),
            home: const HomePage(),
          );
        });
  }
}

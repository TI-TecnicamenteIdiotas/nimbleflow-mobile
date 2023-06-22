import 'package:flutter/material.dart';

import 'home/home_page.dart';
import 'shared/constants/global_keys_constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

    return MaterialApp(
      navigatorKey: kGlobalNavigatorKey,
      title: 'Nimbleflow',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: colorScheme.inversePrimary,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 2,
        )
      ),
      home: const HomePage(),
    );
  }
}

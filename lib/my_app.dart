import 'package:flutter/material.dart';

import 'home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

    return MaterialApp(
      title: 'Nimbleflow',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: colorScheme.inversePrimary,
        ),
      ),
      home: const HomePage(),
    );
  }
}

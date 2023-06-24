import 'package:flutter/material.dart';

import 'home/home_module_page.dart';
import 'shared/constants/global_keys_constants.dart';
import 'shared/constants/layout_constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: kGlobalNavigatorKey,
      title: 'Nimbleflow',
      theme: ThemeData(
        colorScheme: kColorScheme,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: kColorScheme.inversePrimary,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 2,
        )
      ),
      home: const HomeModulePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nimbleflow/shared/providers/hub.dart';
import 'package:nimbleflow/shared/providers/storage.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var storage = await storageProviderBuilder();
  var hub = await hubProviderBuilder();

  runApp(
    ProviderScope(
      overrides: [
        hubProvider.overrideWithValue(hub),
        storageProvider.overrideWithValue(storage),
      ],
      child: const MyApp(),
    ),
  );
}

import 'package:flutter/material.dart';

import 'my_app.dart';
import 'shared/services/hub_service.dart';
import 'shared/storage/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage().openStorage();
  await HubService.mainHubConnection.start();
  runApp(const MyApp());
}

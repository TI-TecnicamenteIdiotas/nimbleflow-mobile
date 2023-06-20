import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:signalr_core/signalr_core.dart';

import '../constants/hub_constants.dart';

part 'hub.g.dart';

Future<HubConnection> hubProviderBuilder() async {
  var hubBuilder = HubConnectionBuilder()
      .withUrl("$kMainHubServiceUrl/main")
      .withAutomaticReconnect(
        List.generate(
          kHubRetryConnectionCount,
          (_) => kHubRetryConnectionInMilliseconds,
        ),
      )
      .build();

  await hubBuilder.start();
  return hubBuilder;
}

@riverpod
HubConnection hub(HubRef ref) {
  throw UnimplementedError("Must await instance first");
}

import 'package:signalr_core/signalr_core.dart';

import '../constants/hub_constants.dart';

abstract class HubService {
  static final mainHubConnection = HubConnectionBuilder()
      .withUrl("$kMainHubServiceUrl/main")
      .withAutomaticReconnect(
        List.generate(
          kHubRetryConnectionCount,
          (_) => kHubRetryConnectionInMilliseconds,
        ),
      )
      .build();
}

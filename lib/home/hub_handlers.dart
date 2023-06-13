import 'package:flutter/material.dart';
import 'package:nimbleflow/shared/constants/hub_constants.dart';

import '../shared/services/hub_service.dart';
import '../shared/widgets/animated_linear_progression_widget.dart';

void handleHubConnectionClosed(BuildContext context) {
  HubService.mainHubConnection.onclose((exception) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        showCloseIcon: true,
        duration: Duration(milliseconds: kHubRetryConnectionInMilliseconds),
        content: Text('Conexão fechada!'),
      ),
    );
  });
}

void handleHubReconnection(BuildContext context) {
  HubService.mainHubConnection.onreconnecting((exception) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        duration: const Duration(
          milliseconds:
              kHubRetryConnectionInMilliseconds * kHubRetryConnectionCount,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Reconectando"),
            Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(left: 24),
              child: const CircularProgressIndicator(strokeWidth: 2),
            )
          ],
        ),
      ),
    );
  });
}

void handleHubReconnected(BuildContext context) {
  HubService.mainHubConnection.onreconnected((connectionId) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        showCloseIcon: true,
        duration: Duration(milliseconds: kHubRetryConnectionInMilliseconds),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reconectado"),
            AnimatedLinearProgressionWidget(),
          ],
        ),
      ),
    );
  });
}

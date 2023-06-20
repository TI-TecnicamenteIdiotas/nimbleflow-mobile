import 'package:flutter/material.dart';
import 'package:nimbleflow/shared/constants/hub_constants.dart';
import 'package:nimbleflow/shared/providers/hub.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../shared/widgets/animated_linear_progression_widget.dart';

part "hub_handlers.g.dart";

class HubHandlers {
  HubConnection hub;

  HubHandlers(this.hub);

  void handleHubConnectionClosed(BuildContext context) =>
      hub.onclose((_) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            showCloseIcon: true,
            duration: Duration(milliseconds: kHubRetryConnectionInMilliseconds),
            content: Text('Conexão fechada!'),
          ),
        );
      });

  void handleHubReconnection(BuildContext context) =>
      hub.onreconnecting((_) {
        ScaffoldMessenger.of(context).clearSnackBars();
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

  void handleHubReconnected(BuildContext context) =>
      hub.onreconnected((_) {
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

@riverpod
HubHandlers hubHandlers(HubHandlersRef ref) {
  var hub = ref.read(hubProvider);
  return HubHandlers(hub);
}

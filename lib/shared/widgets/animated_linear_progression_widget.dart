import 'package:flutter/material.dart';

import '../constants/hub_constants.dart';

class AnimatedLinearProgressionWidget extends StatelessWidget {
  const AnimatedLinearProgressionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: kHubRetryConnectionInMilliseconds),
      curve: Curves.linear,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (_, value, __) => LinearProgressIndicator(value: value),
    );
  }
}

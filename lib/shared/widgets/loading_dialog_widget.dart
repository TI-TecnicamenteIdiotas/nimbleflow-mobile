import 'package:flutter/material.dart';

class LoadingDialogWidget extends StatelessWidget {
  const LoadingDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      title: Text("Carregando", textAlign: TextAlign.center),
      insetPadding: EdgeInsets.all(16),
      children: [
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ChangeImageButtonWidget extends StatelessWidget {
  final String? imageUrl;
  final void Function() onPressed;

  const ChangeImageButtonWidget(this.imageUrl, this.onPressed, {super.key});

  String buildText() {
    if (imageUrl == null || imageUrl!.trim().isEmpty) {
      return "Adicionar imagem";
    }

    return "Mudar imagem";
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(buildText()),
          const SizedBox(width: 8),
          const Icon(Icons.image_rounded),
        ],
      ),
    );
  }
}

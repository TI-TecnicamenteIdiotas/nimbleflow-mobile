import 'package:flutter/material.dart';

class ChooseImageWidget extends StatelessWidget {
  final BuildContext context;
  final Future<bool> Function() selectImageFromGallery;
  final Future<bool> Function() selectImageFromCamera;

  const ChooseImageWidget(
      this.context, this.selectImageFromGallery, this.selectImageFromCamera,
      {super.key});

  void pop() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Origem da imagem", textAlign: TextAlign.center),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                var response = await selectImageFromGallery();
                if (!response) return;

                pop();
              },
              child: const Row(
                children: [
                  Text("Galeria"),
                  SizedBox(width: 8),
                  Icon(Icons.image_rounded),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var response = await selectImageFromCamera();
                if (!response) return;

                pop();
              },
              child: const Row(
                children: [
                  Text("Câmera"),
                  SizedBox(width: 8),
                  Icon(Icons.camera_alt_rounded),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

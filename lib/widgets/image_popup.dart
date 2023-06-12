import 'package:flutter/material.dart';

class ImagePopUp extends StatelessWidget {
  const ImagePopUp({Key? key, required this.imageUrl, this.width, this.height}) : super(key: key);
  final String imageUrl;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: Image.asset(
        imageUrl,
        width: width ?? double.infinity,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}

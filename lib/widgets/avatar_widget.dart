import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.imagePath, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      width: width ?? 96,
      height: height ?? 96,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColorDark,
      ),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(imagePath),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
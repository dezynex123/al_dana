import 'package:flutter/material.dart';

class BannerTile extends StatelessWidget {
  const BannerTile({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Card(
          color: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 0.0,
          child: Image.asset(imagePath, fit: BoxFit.contain)),
    );
  }
}

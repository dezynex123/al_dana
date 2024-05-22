import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GoBack extends StatelessWidget {
  final VoidCallback? onPressed;
  const GoBack({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => Get.back(),
      icon: SvgPicture.asset(
        'assets/icons/ic_back_arrow.svg',
        color: white,
      ),
    );
  }
}

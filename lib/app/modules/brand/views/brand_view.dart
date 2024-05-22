import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/brand_controller.dart';

class BrandView extends GetView<BrandController> {
  const BrandView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BrandView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BrandView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

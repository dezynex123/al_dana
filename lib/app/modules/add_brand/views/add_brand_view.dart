import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_brand_controller.dart';

class AddBrandView extends GetView<AddBrandController> {
  const AddBrandView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddBrandView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddBrandView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

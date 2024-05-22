import 'package:flutter/material.dart';

class InvoiceSplit extends StatelessWidget {
  const InvoiceSplit({
    super.key,
    required this.name,
    required this.width,
    required this.price,
  });
  final String name;
  final double width;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(price),
        ],
      ),
    );
  }
}
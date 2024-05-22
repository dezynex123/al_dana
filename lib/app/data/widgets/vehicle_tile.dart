import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data.dart';

class VehicleTile extends StatelessWidget {
  const VehicleTile({Key? key, required this.vehicle}) : super(key: key);
  final Vehicle vehicle;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: tileColor,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: textDark20),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: vehicle.brand!.image.isNotEmpty
                  ? Image.network(
                      '$domainName${vehicle.brand?.image}',
                      fit: BoxFit.contain,
                      width: Get.width * .15,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/img_placeholder.png',
                          fit: BoxFit.contain,
                          width: Get.width * .15,
                        );
                      },
                    )
                  : Image.asset(
                      'assets/images/img_placeholder.png',
                      fit: BoxFit.contain,
                      width: Get.width * .15,
                    ),
            ),
            const SizedBox(
              width: 14,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${vehicle.carModel?.name ?? ''} - ${vehicle.variant?.name ?? ''}',
                      style: tsPoppins(color: textDark80, size: 16)),
                  Text(
                      'Year ${vehicle.year ?? ''} | ${vehicle.colour?.name ?? ''}',
                      style: tsPoppins(
                        color: textDark40,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

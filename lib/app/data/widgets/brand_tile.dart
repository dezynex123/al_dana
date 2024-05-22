import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data.dart';

class BrandTile extends StatelessWidget {
  const BrandTile({Key? key, required this.brand, this.onTap})
      : super(key: key);
  final Brand brand;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                brand.image.isNotEmpty
                    ? Image.network(
                        '$domainName${brand.image}',
                        fit: BoxFit.contain,
                        width: Get.width * .15,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            brand.image,
                            fit: BoxFit.contain,
                            width: Get.width * .15,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/img_placeholder.png',
                                fit: BoxFit.contain,
                                width: Get.width * .15,
                              );
                            },
                          );
                        },
                      )
                    : Image.asset(
                        'assets/images/img_placeholder.png',
                        fit: BoxFit.contain,
                        width: Get.width * .15,
                      ),
                const SizedBox(
                  width: 13,
                ),
                Text(
                  brand.title,
                  style: tsPoppins(
                      weight: FontWeight.w400, size: 14, color: textDark40),
                )
              ],
            ),
            const Icon(
              Icons.arrow_forward_outlined,
              color: textDark40,
            )
          ],
        ),
      ),
    );
  }
}

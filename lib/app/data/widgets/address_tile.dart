import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({Key? key, required this.address, this.distance = 0})
      : super(key: key);
  final Address address;
  final double distance;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(address.addressType,
                style: tsPoppins(weight: FontWeight.w400, color: textDark80)),
            Text(address.location,
                style: tsPoppins(weight: FontWeight.w600, color: textDark80)),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/ic_call.svg'),
                    Text('${Common().currentUser.mobile}',
                        style: tsPoppins(
                            weight: FontWeight.w400, color: textDark80)),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: textDark80,
                      size: 10,
                    ),
                    Text('${distance.toStringAsFixed(2)} km',
                        style: tsPoppins(
                            weight: FontWeight.w400, color: textDark80)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';

class SpareCategoryTile extends StatelessWidget {
  const SpareCategoryTile(
      {Key? key, required this.spareCategory, this.onTap, this.onEdit})
      : super(key: key);
  final SpareCategory spareCategory;
  final GestureTapCallback? onTap, onEdit;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${spareCategory.name}',
                      style: tsPoppins(size: 14, color: textDark80),
                    ),
                    Text(
                      'spare types: ${spareCategory.spareList!.length}',
                      style: tsPoppins(color: textDark40),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: textDark,
                    size: 15,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

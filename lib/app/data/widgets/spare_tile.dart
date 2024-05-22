import 'package:flutter/material.dart';

import '../data.dart';

class SpareTile extends StatelessWidget {
  const SpareTile({Key? key, required this.spare, this.onTap, this.onEdit})
      : super(key: key);
  final Spare spare;
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
                      '${spare.name}',
                      style: tsPoppins(),
                    ),
                    Text(
                      'spare qty: ${spare.qty}',
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

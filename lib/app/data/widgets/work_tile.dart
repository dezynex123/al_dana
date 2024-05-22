import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';

class WorkTile extends StatelessWidget {
  const WorkTile({Key? key, required this.work, this.onTap, this.onEdit})
      : super(key: key);
  final Work work;
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
                      work.title,
                      style: tsPoppins(),
                    ),
                    Text(
                      work.subTitle,
                      style: tsPoppins(),
                    ),
                    Text(
                      work.desc,
                      style: tsPoppins(),
                    )
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

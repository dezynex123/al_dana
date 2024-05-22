import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key, required this.user, this.onTap, this.onEdit})
      : super(key: key);
  final User user;
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
                      '${user.name} ',
                      style: tsPoppins(size: 14, color: textDark80),
                    ),
                    Text(
                      '${user.mobile} ',
                      style: tsPoppins(size: 14, color: textDark40),
                    ),
                    Text(
                      '${user.email} ',
                      style: tsPoppins(size: 14, color: textDark40),
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

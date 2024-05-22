import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data.dart';

class NavItem extends StatelessWidget {
  const NavItem(
      {Key? key,
      required this.title,
      required this.icon,
      this.trailing,
      this.onTap})
      : super(key: key);
  final String title;
  final String icon;
  final Widget? trailing;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                icon,
                fit: BoxFit.fill,
                color: greenAppTheme,
              ),
            ),
            title: Text(
              title,
              style: tsPoppins(color: textDark80, size: 14),
            ),
            trailing: trailing,
          ),
          const Divider(
            thickness: 1,
            height: 0,
          )
        ],
      ),
    );
  }
}

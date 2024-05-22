import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';

class ServiceModeTile extends StatelessWidget {
  const ServiceModeTile(
      {Key? key,
      required this.mode,
      this.onTap,
      this.isSelect = false,
      this.onChanged})
      : super(key: key);
  final ServiceMode mode;
  final GestureTapCallback? onTap;
  final bool isSelect;
  final ValueChanged<bool?>? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: tileColor,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mode.title,
                      style: tsPoppins(weight: FontWeight.w600, color: black),
                    ),
                    // Text(
                    //   mode.desc,
                    //   style: tsPoppins(
                    //       size: 11, weight: FontWeight.w400, color: black),
                    // ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: white,
                  ),
                  child: Radio(
                      value: isSelect,
                      groupValue: true,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => greenAppTheme),
                      toggleable: true,
                      onChanged: onChanged),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

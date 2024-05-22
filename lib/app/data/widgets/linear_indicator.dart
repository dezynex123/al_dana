import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinearIndicator extends StatelessWidget {
  final int length, index;
  final Color activeColor, inactiveColor;

  const LinearIndicator(
      {Key? key,
      required this.index,
      required this.length,
      required this.activeColor,
      required this.inactiveColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 8,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: length,
          itemBuilder: (BuildContext context, int i) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 0.0),
                alignment: Alignment.bottomCenter,
                width: w * .5/length>w * .09?w * .05:w * .3/length,
                decoration: BoxDecoration(
                    color: index == i ? activeColor : inactiveColor,
                    shape: i==index?BoxShape.rectangle:BoxShape.circle,
                    borderRadius:i==index? BorderRadius.circular(15.0):null),
              ),
            );
          }),
    );
  }
}

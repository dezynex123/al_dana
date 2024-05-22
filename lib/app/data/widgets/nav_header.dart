import 'package:flutter/material.dart';

import '../data.dart';

class NavHeader extends StatelessWidget {
  const NavHeader({Key? key, this.name = '', this.image = ''})
      : super(key: key);
  final String name, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 5),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(30.0),
                    child: Image.network(
                      image,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        "assets/images/img_user_default.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                name,
                style:
                    tsPoppins(size: 14, color: white, weight: FontWeight.w600),
              ),
              // InkWell(
              //   onTap: () {
              //     Get.offAndToNamed(Routes.PROFILE);
              //   },
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              //     decoration: const BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(6)),
              //         color: textDark20),
              //     child: Text(
              //       "Edit Profile",
              //       style: tsPoppins(
              //           size: 12, color: textDark80, weight: FontWeight.w500),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

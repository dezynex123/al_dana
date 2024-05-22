import 'dart:developer';

import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {Key? key,
      required this.category,
      this.onTap,
      this.onEdit,
      this.isManage = false})
      : super(key: key);
  final Category category;
  final GestureTapCallback? onTap, onEdit;
  final bool isManage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // color: hexToColor(category.bgCardColor),
          color: tileColor,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 5, right: 5),
                      child: category.image.isNotEmpty
                          ? Image.network(
                              '$domainName${category.image}',
                              errorBuilder: (context, error, stackTrace) {
                                log('Category image error: $error');
                                return Image.asset(
                                  'assets/images/img_placeholder.png',
                                );
                              },
                            )
                          : Image.asset(
                              'assets/images/img_placeholder.png',
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          category.title,
                          style: tsPoppins(
                              weight: FontWeight.w600, color: greenAppTheme),
                        ),
                        Text(
                          category.desc,
                          overflow: TextOverflow.ellipsis,
                          style: tsPoppins(
                              size: 11, weight: FontWeight.w400, color: black),
                        ),
                        // const SizedBox(height: 5),
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: greenAppTheme,
                            child: Icon(
                              Icons.arrow_forward_sharp,
                              color: primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
              if (isManage)
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: onEdit,
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: white, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.edit,
                        color: textDark80,
                        size: 12,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}

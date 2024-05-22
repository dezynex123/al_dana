import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data.dart';

class PackageTile extends StatefulWidget {
  const PackageTile({
    Key? key,
    required this.package,
    this.onTap,
    this.onEdit,
    this.onChanged,
    this.isSelected = false,
    this.isManage = false,
  }) : super(key: key);
  final PackageModel package;
  final GestureTapCallback? onTap, onEdit;
  final bool isSelected, isManage;
  final void Function(bool?)? onChanged;

  @override
  State<PackageTile> createState() => _PackageTileState();
}

class _PackageTileState extends State<PackageTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    log('package tile called');
    String desc =
        widget.package.description.toString().capitalizeFirst.toString();

    return InkWell(
      onTap: widget.onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
              color: widget.isSelected ? greenAppTheme : tileColor, width: 3),
        ),
        // color: hexToColor(package.bgCardColor!),
        color: tileColor,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: widget.isManage
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Get.width * .3,
                    width: Get.width * .4,
                    alignment: Alignment.bottomCenter,
                    padding:
                        const EdgeInsets.only(top: 18.0, left: 5, right: 5),
                    child: widget.package.image!.isNotEmpty
                        ? Image.network(
                            '$domainName${widget.package.image!}',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/img_placeholder.png',
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : Image.asset(
                            'assets/images/img_placeholder.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    widget.package.title!,
                    style: tsPoppins(
                      weight: FontWeight.w600,
                      color: black,
                      size: 18,
                    ),
                  ),
                  Container(
                      height: 2,
                      width: 30,
                      decoration: BoxDecoration(
                          color: accent60,
                          borderRadius: BorderRadius.circular(100))),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.package.price.toString(),
                        style: tsPoppins(
                          weight: FontWeight.w600,
                          color: black,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'AED',
                        style: tsPoppins(
                          weight: FontWeight.w500,
                          color: greenAppTheme,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Service Includes',
                    style: tsPoppins(
                      color: bgColor25,
                      size: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.package.services!.length,
                      itemBuilder: (con, i) {
                        return Row(
                          children: [
                            const Icon(
                              Icons.arrow_right_rounded,
                              color: black,
                            ),
                            Text(
                              widget.package.services?[i].title ?? '',
                              style: tsPoppins(
                                  color: black, weight: FontWeight.w400),
                            )
                          ],
                        );
                      }),
                  if (desc.length <= 50)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        desc,
                      ),
                    ),
                  if (desc.length > 50)
                    SizedBox(
                      width: Get.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          desc,
                          maxLines: _isExpanded ? 10 : 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  if (desc.length > 50)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Text(
                          _isExpanded ? 'Show Less' : 'Show More',
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            if (widget.isManage)
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: widget.onEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: white,
                    size: 15,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

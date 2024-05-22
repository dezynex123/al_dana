import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../data.dart';

class BranchTile extends StatefulWidget {
  const BranchTile({
    Key? key,
    required this.branch,
    this.onTap,
    this.onEdit,
    this.isManage = false,
    this.isSelected = false,
  }) : super(key: key);
  final Branch branch;
  final GestureTapCallback? onTap, onEdit;
  final bool isManage;
  final bool isSelected;
  @override
  State<BranchTile> createState() => _BranchTileState();
}

class _BranchTileState extends State<BranchTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            widget.branch.image.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: greenAppTheme,
                    ),
                  )
                : Container(
                    constraints: BoxConstraints(
                        minHeight: 130,
                        maxHeight: 170,
                        minWidth: Get.width * .6,
                        maxWidth: Get.width),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: widget.isSelected
                              ? greenAppTheme
                              : Colors.transparent,
                          width: 4),
                      image: DecorationImage(
                        image: widget.branch.image.isNotEmpty
                            ? NetworkImage(
                                '$domainName${widget.branch.image.toString()}')
                            : const AssetImage('assets/images/img_branch_1.png')
                                as ImageProvider,
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) {
                          log('$domainName${widget.branch.image.toString()}');
                          log("Error of this image is $exception");
                          const AssetImage('assets/images/img_branch_1.png');
                        },
                      ),
                    ),
                  ),
            Container(
              constraints: BoxConstraints(
                  minHeight: 130,
                  maxHeight: 170,
                  minWidth: Get.width * .6,
                  maxWidth: Get.width),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: !widget.isSelected
                    ? LinearGradient(
                        colors: [
                          Colors.black.withOpacity(.5),
                          Colors.black.withOpacity(.5),
                          Colors.black.withOpacity(.7)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
              ),
              padding: const EdgeInsets.all(4),
              child: Stack(
                children: [
                  Positioned(
                      top: 15,
                      left: 15,
                      child: Container(
                        color: greenAppTheme,
                        padding: const EdgeInsets.all(3),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/ic_star.svg',
                                color: white),
                            Text('${widget.branch.rating}',
                                style: tsPoppins(size: 10, color: white))
                          ],
                        ),
                      )),
                  Positioned(
                      bottom: 0,
                      left: 15,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.branch.name,
                            style: tsPoppins(
                                color: greenAppTheme,
                                size: 16,
                                weight: FontWeight.w600),
                          ),
                          Text(
                            widget.branch.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: tsPoppins(
                                color: textDark10, weight: FontWeight.w400),
                          ),
                          widget.branch.distance > 0
                              ? Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: white,
                                      size: 15,
                                    ),
                                    Text(
                                      ' ${widget.branch.distance.toStringAsFixed(2)} Km',
                                      style: tsPoppins(color: white, size: 13),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink()
                        ],
                      )),
                  if (widget.isManage)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: widget.onEdit,
                        icon: Container(
                          padding: const EdgeInsets.all(6),
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
            ),
          ],
        ),
      ),
    );
  }
}

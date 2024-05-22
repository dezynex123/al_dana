import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceTile extends StatefulWidget {
  const ServiceTile({
    Key? key,
    required this.service,
    this.isSelected = false,
    this.isManage = false,
    this.onChanged,
    this.onTap,
    this.onEdit,
  }) : super(key: key);
  final Service service;
  final bool isSelected, isManage;
  final void Function(bool?)? onChanged;
  final void Function()? onTap, onEdit;

  @override
  State<ServiceTile> createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
              color: widget.isSelected ? greenAppTheme : tileColor, width: 3),
        ),
        color: tileColor,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                width: Get.width * .45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          maxHeight: Get.width * .2, maxWidth: Get.width * .35),
                      padding:
                          const EdgeInsets.only(top: 18.0, left: 5, right: 5),
                      alignment: Alignment.center,
                      child: widget.service.image!.isNotEmpty
                          ? Image.network(
                              '$domainName${widget.service.image}',
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${widget.service.price}',
                            style: tsPoppins(
                              weight: FontWeight.w600,
                              color: bgColor25,
                              size: 12,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            'AED',
                            style: tsPoppins(
                              weight: FontWeight.w500,
                              color: greenAppTheme,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.service.title ?? '',
                        style: tsPoppins(
                          weight: FontWeight.w600,
                          color: bgColor25,
                          size: 12,
                        ),
                      ),
                    ),
                    if (widget.service.desc != null)
                      widget.service.desc!.length > 40
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.service.desc ?? '',
                                          maxLines: _isExpanded ? 10 : 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: tsPoppins(
                                            weight: FontWeight.w400,
                                            color: bgColor25,
                                            size: 12,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isExpanded = !_isExpanded;
                                            });
                                          },
                                          child: Text(
                                            !_isExpanded ? 'More' : 'Less',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                widget.service.desc ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: tsPoppins(
                                  weight: FontWeight.w400,
                                  color: bgColor25,
                                  size: 12,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}

class ServiceTile2 extends StatefulWidget {
  const ServiceTile2(
      {Key? key,
      required this.service,
      required this.isSelected,
      this.onChanged,
      this.onTap})
      : super(key: key);
  final Service service;
  final bool isSelected;
  final void Function(bool?)? onChanged;
  final void Function()? onTap;

  @override
  State<ServiceTile2> createState() => _ServiceTile2State();
}

class _ServiceTile2State extends State<ServiceTile2> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
              color: widget.isSelected ? greenAppTheme : tileColor, width: 3),
        ),
        color: white,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                width: Get.width * .45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          maxHeight: Get.width * .15,
                          maxWidth: Get.width * .35),
                      padding:
                          const EdgeInsets.only(top: 18.0, left: 5, right: 5),
                      child: widget.service.image!.isNotEmpty
                          ? Image.network(
                              '$domainName${widget.service.image}',
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
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.service.price.toString(),
                            textAlign: TextAlign.center,
                            style: tsPoppins(
                              weight: FontWeight.w600,
                              color: black,
                              size: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            'AED',
                            textAlign: TextAlign.center,
                            style: tsPoppins(
                              weight: FontWeight.w500,
                              color: greenAppTheme,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.service.title ?? '',
                        style: tsPoppins(
                          weight: FontWeight.w600,
                          color: textDark80,
                          size: 14,
                        ),
                      ),
                    ),
                    if (widget.service.desc != null)
                      widget.service.desc!.length > 25
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.service.desc ?? '',
                                          maxLines: _isExpanded ? 10 : 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: tsPoppins(
                                            weight: FontWeight.w400,
                                            color: bgColor25,
                                            size: 12,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isExpanded = !_isExpanded;
                                            });
                                          },
                                          child: Text(
                                            !_isExpanded ? 'More' : 'Less',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                widget.service.desc ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: tsPoppins(
                                  weight: FontWeight.w400,
                                  color: bgColor25,
                                  size: 12,
                                ),
                              ),
                            ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

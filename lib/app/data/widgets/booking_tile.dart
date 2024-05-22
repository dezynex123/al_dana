import 'dart:developer';

import 'package:al_dana/app/modules/invoice/provider/invoice_provider.dart';
import 'package:al_dana/app/modules/invoice/views/invoice_view.dart';
import 'package:al_dana/app/modules/tracking/views/tracking_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../data.dart';

class BookingTile extends StatelessWidget {
  const BookingTile({
    Key? key,
    required this.booking,
    this.onChanged,
  }) : super(key: key);
  final Booking booking;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      color: bgColor1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  booking.packageList != null && booking.packageList!.isNotEmpty
                      ? 'Packages'
                      : booking.services != null && booking.services!.isNotEmpty
                          ? 'Services'
                          : '',
                  style: tsPoppins(
                    weight: FontWeight.w600,
                    color: textDark80,
                    size: 18,
                  ),
                ),
                Container(
                    height: 2,
                    width: 30,
                    decoration: BoxDecoration(
                        color: accent60,
                        borderRadius: BorderRadius.circular(100))),
                const SizedBox(height: 5),
                if (booking.packageList != null &&
                    booking.packageList!.isNotEmpty)
                  Text(
                    booking.packageList![0].title ?? '',
                    style: tsPoppins(
                      color: bgColor27,
                      size: 14,
                    ),
                  ),
                const SizedBox(height: 5),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: booking.packageList?.length,
                    itemBuilder: (con, i) {
                      log(booking.packageList.toString());
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: booking.packageList?[i].services?.length,
                          itemBuilder: (context, j) {
                            return Row(
                              children: [
                                const Icon(
                                  Icons.arrow_right_rounded,
                                  color: textDark80,
                                ),
                                Text(
                                  booking.packageList?[i].services?[j].title ??
                                      '',
                                  style: tsPoppins(
                                      color: textDark80,
                                      weight: FontWeight.w400),
                                ),
                              ],
                            );
                          });
                    }),
                if (booking.services != null && booking.services!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (booking.packageList != null &&
                          booking.packageList!.isNotEmpty)
                        Text(
                          'Services',
                          style: tsPoppins(
                            weight: FontWeight.w600,
                            color: textDark80,
                            size: 18,
                          ),
                        ),
                      if (booking.packageList != null &&
                          booking.packageList!.isNotEmpty)
                        Container(
                            height: 2,
                            width: 30,
                            decoration: BoxDecoration(
                                color: accent60,
                                borderRadius: BorderRadius.circular(100))),
                    ],
                  ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: booking.services!.length,
                    itemBuilder: (con, i) {
                      log('image url');
                      log(booking.vehicle?.image.toString() ?? '');
                      return Row(
                        children: [
                          const Icon(
                            Icons.arrow_right_rounded,
                            color: textDark80,
                          ),
                          Text(
                            booking.services?[i].title ?? '',
                            style: tsPoppins(
                                color: textDark80, weight: FontWeight.w400),
                          )
                        ],
                      );
                    }),
                const SizedBox(height: 5),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                Text(
                  booking.date?.substring(0, booking.date?.indexOf("T")) ?? '',
                  textAlign: TextAlign.right,
                  style: tsPoppins(color: textDark80, weight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                Text('AED ${booking.price.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: tsRubik(color: bgColor27, size: 14)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrackingView(
                          bookingId: booking.id ?? '',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenAppTheme,
                  ),
                  child: Text(
                    'Track',
                    style: tsPoppins(
                      weight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                    ),
                    onPressed: () {
                      log("Elevated button booking id - ${booking.id}");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const InvoiceView(),
                        ),
                      );
                      Provider.of<InvoiceProvider>(context, listen: false)
                          .fetchInvoice(
                        booking.id.toString(),
                      );
                    },
                    child: const Text('Invoice'))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BookingTile2 extends StatelessWidget {
  const BookingTile2({
    Key? key,
    required this.booking,
    this.onTap,
    this.onChanged,
  }) : super(key: key);
  final Booking booking;
  final GestureTapCallback? onTap;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: white,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: Get.width * .3, maxHeight: 100),
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      booking.packageList?[0].image ?? '',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        log('This image has $error');
                        return Image.asset(
                          'assets/images/img_placeholder.png',
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${booking.id}',
                                style: tsPoppins(
                                    weight: FontWeight.w600,
                                    size: 16,
                                    color: textDark80),
                              ),
                              Text(
                                'Time Slot',
                                textAlign: TextAlign.end,
                                style: tsPoppins(
                                    weight: FontWeight.w400, color: textDark40),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Booking ID',
                                style: tsPoppins(color: textDark40),
                              ),
                              Text(
                                '${outputDateFormat2.format(outputDateFormat.parse(booking.date!))},\n ${booking.slot}',
                                textAlign: TextAlign.end,
                                style: tsPoppins(color: textDark80),
                              ),
                            ],
                          ),
                          Text(
                            'Address',
                            style: tsPoppins(
                                weight: FontWeight.w400, color: textDark40),
                          ),
                          Text(
                            'Downtown Dubai - Dubai - United Arab Gold Palace, UAE, Baniyas Road Dubai,',
                            style: tsPoppins(
                                weight: FontWeight.w400,
                                color: textDark40,
                                size: 10),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(backgroundColor: bgColor29),
                      child: Text(
                        '   Cancel   ',
                        style: tsPoppins(weight: FontWeight.w600, color: white),
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(backgroundColor: bgColor37),
                      child: Text(
                        '  Reassign  ',
                        style: tsPoppins(weight: FontWeight.w600, color: white),
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(backgroundColor: bgColor38),
                      child: Text(
                        '   Accept   ',
                        style: tsPoppins(weight: FontWeight.w600, color: white),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          )),
    );
  }
}

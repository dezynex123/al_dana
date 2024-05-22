import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';


class TrackerTile extends StatelessWidget {
  final Booking booking;

  const TrackerTile({Key? key, required this.booking}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, serviceIndex) {
        return const SizedBox(
          height: 4,
        );
      },
      itemCount: booking.services!.length,
      itemBuilder: (context, serviceIndex) {
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: bgColor33,
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text:
                              "${booking.services![serviceIndex].title} ",
                          style: tsPoppins(color: black, size: 13)),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: SizedBox(
                    width: 2,
                    height: 60,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: LinearProgressIndicator(
                        value:  0.0,
                        backgroundColor: Colors.grey[300],
                        color: textDark40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'status',
                              style: tsPoppins(),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 4,
                        );
                      },
                      itemCount:2),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

// class _TrackerTileState extends State<TrackerTile>
//     with TickerProviderStateMixin {
//   ///This is first animation progress bar controller.
//   AnimationController? controller;

//   ///This is second animation progress bar controller.
//   AnimationController? controller2;

//   ///This is third animation progress bar controller.
//   AnimationController? controller3;

//   ///This is conditional variable.
//   bool isFirst = false;
//   bool isSecond = false;
//   bool isThird = false;

//   @override
//   void initState() {
//     // if (widget.status?.name == Status.order.name) {
//     ///initialize first controller
//     // controller = AnimationController(
//     //   vsync: this,
//     //   duration: const Duration(seconds: 2),
//     // )..addListener(() {
//     //     if (controller?.value != null && controller!.value > 0.99) {
//     //       controller?.stop();
//     //     }
//     //     setState(() {});
//     //   });
//     // } else if (widget.status?.name == Status.shipped.name) {
//     ///initialize first controller
//     //   controller = AnimationController(
//     //     vsync: this,
//     //     duration: const Duration(seconds: 2),
//     //   )..addListener(() {
//     //       if (controller?.value != null && controller!.value > 0.99) {
//     //         controller?.stop();
//     //         controller2?.stop();
//     //         isFirst = true;
//     //         controller2?.forward(from: 0.0);
//     //       }
//     //       setState(() {});
//     //     });

//     //   ///initialize second controller
//     //   controller2 = AnimationController(
//     //     vsync: this,
//     //     duration: const Duration(seconds: 2),
//     //   )..addListener(() {
//     //       if (controller2?.value != null && controller2!.value > 0.99) {
//     //         controller2?.stop();
//     //         controller3?.stop();
//     //         isSecond = true;
//     //         controller3?.forward(from: 0.0);
//     //       }
//     //       setState(() {});
//     //     });
//     // } else if (widget.status?.name == Status.outOfDelivery.name ||
//     //     widget.status?.name == Status.delivered.name) {
//     ///initialize first controller
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..addListener(() {
//         if (controller?.value != null && controller!.value > 0.99) {
//           controller?.stop();
//           controller2?.stop();
//           controller3?.stop();
//           isFirst = true;
//           controller2?.forward(from: 0.0);
//         }
//         setState(() {});
//       });

//     ///initialize second controller
//     controller2 = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..addListener(() {
//         if (controller2?.value != null && controller2!.value > 0.99) {
//           controller2?.stop();
//           controller3?.stop();
//           isSecond = true;
//           controller3?.forward(from: 0.0);
//         }
//         setState(() {});
//       });

//     ///initialize third controller
//     controller3 = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..addListener(() {
//         if (controller3?.value != null && controller3!.value > 0.99) {
//           controller3?.stop();
//           isThird = true;
//         }
//         setState(() {});
//       });
//     // }

//     controller?.repeat(reverse: false);
//     controller2?.repeat(reverse: false);
//     controller3?.repeat(reverse: false);
//     super.initState();
//   }

 
// }

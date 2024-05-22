import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/data.dart';
import '../../../routes/app_pages.dart';
import '../controllers/slider_controller.dart';

class SliderView extends GetView<SliderController> {
  const SliderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemWidth: Get.width,
      containerWidth: Get.width,
      autoplayDisableOnInteraction: true,
      itemBuilder: (BuildContext context, int index) {
        return slider_view(index);
      },
      onTap: (index) {
        //Constants().showMessageInScaffold(context, banners[index]);
      },
      onIndexChanged: (index) {
        controller.sliderIndex.value = index;
      },
      itemCount: 3,
      index: 0,
      pagination: SwiperCustomPagination(
        builder: (context, config) {
          return Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 20),
              child: LinearIndicator(
                index: controller.sliderIndex.value,
                length: 3,
                activeColor: bgColor4,
                inactiveColor: textDark20,
              ));
        },
      ),
      autoplay: false,
      autoplayDelay: 4000,
      duration: 800,
      viewportFraction: 1.0,
      scale: 1.0,
      loop: false,
    );
  }

  slider_view(int index) {
    print('slider index $index');

    switch (index) {
      case 1:
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/img_bg_splash.png',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/img_slider_2.png',
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: Get.height * .1,
                right: 25,
                left: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Choose what your\nCar needs?',
                        style: tsPoppins(
                            color: accent, size: 18, weight: FontWeight.w600)),
                    Text(
                        'No matter how busy you are, We can clean your ride. We offer users to hassle free card wash services around the country with higher satisfaction',
                        style: tsPoppins(color: primary, size: 14)),
                  ],
                ))
          ],
        );

      case 2:
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/img_bg_splash.png',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/img_slider_3.png',
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: Get.height * .1,
                right: 25,
                left: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order your\nDoorstep car wash',
                        style: tsPoppins(
                            color: accent, size: 18, weight: FontWeight.w600)),
                    Text(
                        'No matter how busy you are, We can clean your ride. We offer users to hassle free card wash services around the country with higher satisfaction',
                        style: tsPoppins(color: primary, size: 14)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.AUTH);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              minimumSize: Size(Get.width, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text(
                            'REGISTER HERE',
                            style: tsPoppins(color: white, size: 18),
                          )),
                    )
                  ],
                ))
          ],
        );

      default:
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/img_bg_splash.png',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/img_slider_1.png',
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: Get.height * .1,
                right: 25,
                left: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Need a Wash?',
                        style: tsPoppins(
                            color: accent, size: 18, weight: FontWeight.w600)),
                    Text(
                        'No matter how busy you are, We can clean your ride. We offer users to hassle free card wash services around the country with higher satisfaction',
                        style: tsPoppins(color: primary, size: 14)),
                  ],
                ))
          ],
        );
    }
  }
}
// class SliderView extends GetView<SliderController> {
//   int i = 0;
//   SliderView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: Get.height,
//         color: black,
//         child: PageView.builder(
//             itemCount: 3,
//             onPageChanged: (index) {
//               controller.sliderIndex.value = index;
//             },
//             itemBuilder: (BuildContext context, int index) {
//               return slider_view(index);
//             }),
//       ),
//     );
//   }

//   slider_view(int index) {
//     print('slider index ${index}');
//     print('slider i ${i++}');

//     switch (index) {
//       case 1:
//         return Stack(
//           fit: StackFit.expand,
//           children: [
//             Image.asset(
//               'assets/images/img_bg_splash.png',
//               fit: BoxFit.cover,
//             ),
//             Image.asset(
//               'assets/images/img_slider_2.png',
//               fit: BoxFit.cover,
//             ),
//             Positioned(
//                 bottom: Get.height * .1,
//                 right: 25,
//                 left: 25,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Need a Wash?',
//                         style: tsPoppins(
//                             color: accent, size: 18, weight: FontWeight.w600)),
//                     Text(
//                         'No matter hoGet.widthbusy you are, We can cleanyour ride. We offer users to hassle free card wasGet.heightservices around the country witGet.heighthigher satisfaction',
//                         style: tsPoppins(color: primary, size: 14)),
//                   ],
//                 ))
//           ],
//         );

//       case 2:
//         return Stack(
//           fit: StackFit.expand,
//           children: [
//             Image.asset(
//               'assets/images/img_bg_splash.png',
//               fit: BoxFit.cover,
//             ),
//             Image.asset(
//               'assets/images/img_slider_3.png',
//               fit: BoxFit.cover,
//             ),
//             Positioned(
//                 bottom: Get.height * .1,
//                 right: 25,
//                 left: 25,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Need a Wash?',
//                         style: tsPoppins(
//                             color: accent, size: 18, weight: FontWeight.w600)),
//                     Text(
//                         'No matter hoGet.widthbusy you are, We can cleanyour ride. We offer users to hassle free card wasGet.heightservices around the country witGet.heighthigher satisfaction',
//                         style: tsPoppins(color: primary, size: 14)),
//                   ],
//                 ))
//           ],
//         );

//       default:
//         return Stack(
//           fit: StackFit.expand,
//           children: [
//             Image.asset(
//               'assets/images/img_bg_splash.png',
//               fit: BoxFit.cover,
//             ),
//             Image.asset(
//               'assets/images/img_slider_1.png',
//               fit: BoxFit.cover,
//             ),
//             Positioned(
//                 bottom: Get.height * .1,
//                 right: 25,
//                 left: 25,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Need a Wash?',
//                         style: tsPoppins(
//                             color: accent, size: 18, weight: FontWeight.w600)),
//                     Text(
//                         'No matter hoGet.widthbusy you are, We can cleanyour ride. We offer users to hassle free card wasGet.heightservices around the country witGet.heighthigher satisfaction',
//                         style: tsPoppins(color: primary, size: 14)),
//                   ],
//                 ))
//           ],
//         );
//     }
//   }
// }

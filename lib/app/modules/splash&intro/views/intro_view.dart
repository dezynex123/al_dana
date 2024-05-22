import 'package:al_dana/app/data/data.dart';
import 'package:al_dana/app/modules/splash&intro/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../routes/app_pages.dart';

class IntroScreen extends GetView<SplashController> {
  IntroScreen({super.key});

  final List<Map<String, String>> boardingData = [
    {
      'image': 'assets/intro/car-wash.png',
      'title': 'Full Service Car Wash',
      'subtitle':
          'It is a long estalished fact that a reader will be distracted by the readable content of a page when looking at its layout',
    },
    {
      'image': 'assets/intro/location.png',
      'title': 'Find your Location',
      'subtitle':
          'It is a long estalished fact that a reader will be distracted by the readable content of a page when looking at its layout',
    },
    {
      'image': 'assets/intro/mode.png',
      'title': "What's your preffered mode?",
      'subtitle':
          'It is a long estalished fact that a reader will be distracted by the readable content of a page when looking at its layout',
    },
  ];

  final PageController _pageController = PageController();
  final int _numPages = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _numPages,
                itemBuilder: (context, index) {
                  return buildBoardingPage(boardingData[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _numPages,
                effect: const SwapEffect(
                  activeDotColor: greenAppTheme,
                  dotWidth: 8,
                  dotHeight: 8,
                  radius: 8,
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenAppTheme,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (_pageController.page!.round() < _numPages - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    Get.offAndToNamed(Routes.AUTH);
                  }
                },
                child: const Text('Next'),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: greenAppTheme),
              onPressed: () {
                Get.offAndToNamed(Routes.AUTH);
              },
              child: const Text('Skip'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildBoardingPage(Map<String, String> data) {
  return Column(
    children: [
      const Spacer(),
      Image.asset(data['image']!),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          data['title']!,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      FractionallySizedBox(
        widthFactor: 0.8,
        child: Center(
          child: Text(
            data['subtitle']!,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      const Spacer(),
    ],
  );
}

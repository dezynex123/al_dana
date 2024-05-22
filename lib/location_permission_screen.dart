import 'package:al_dana/app/data/data.dart';
import 'package:al_dana/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Location permission is mandatory for this app to function properly.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: greenAppTheme),
              onPressed: () async {
                await openAppSettings();
              },
              child: const Text('Open Settings'),
            ),
            TextButton(
              onPressed: () async {
                var status = await Permission.location.status;
                if (PermissionStatus.granted == status) {
                  Get.offAllNamed(Routes.BRANCH);
                } else {
                  Get.snackbar('Sorry', 'Enable location permission');
                }
              },
              child: const Text(
                'Back',
                style: TextStyle(color: greenAppTheme),
              ),
            )
          ],
        ),
      ),
    );
  }
}

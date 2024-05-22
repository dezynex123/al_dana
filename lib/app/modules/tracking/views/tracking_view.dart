import 'package:al_dana/app/data/data.dart';
import 'package:al_dana/app/modules/tracking/providers/tracking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrackingView extends StatefulWidget {
  final String bookingId;
  const TrackingView({super.key, required this.bookingId});

  @override
  State<TrackingView> createState() => _TrackingViewState();
}

class _TrackingViewState extends State<TrackingView> {
  @override
  void initState() {
    super.initState();
    Provider.of<TrackingProvider>(context, listen: false)
        .fetchTracking(widget.bookingId);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final track = Provider.of<TrackingProvider>(context);
    final tracking = Provider.of<TrackingProvider>(context).tracking?.data?[0];
    final trackingStatus = Provider.of<TrackingProvider>(context)
        .tracking
        ?.data?[0]
        .trackingStatus;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          title: const Text('Tracking Status'),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            ),
          ),
          bottom: const TabBar(tabs: [
            Tab(text: 'Tracking Progress'),
            Tab(text: 'Images'),
          ]),
        ),
        body: track.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: primary,
                ),
              )
            : track.hasError
                ? const Center(
                    child: Text('Error'),
                  )
                : TabBarView(
                    children: [
                      TrackingStatusTab(trackingStatus: trackingStatus),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              'Before Image',
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
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            if (tracking!.beforeImage!.isNotEmpty ||
                                tracking.beforeImage != [] ||
                                tracking.beforeImage != null)
                              SizedBox(
                                height: height * 0.2,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: tracking.beforeImage!.length,
                                  itemBuilder: (context, index) {
                                    return tracking
                                            .beforeImage![index].isNotEmpty
                                        ? Image.network(
                                            "$domainName${tracking.beforeImage?[index]}",
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Text('No Image');
                                            },
                                          )
                                        : const Text('No Image');
                                  },
                                ),
                              ),
                            Text(
                              'After Image',
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
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            if (tracking.afterImage!.isNotEmpty ||
                                tracking.afterImage != [] ||
                                tracking.afterImage != null)
                              SizedBox(
                                height: height * 0.2,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: tracking.afterImage!.length,
                                  itemBuilder: (context, index) {
                                    return tracking
                                            .afterImage![index].isNotEmpty
                                        ? Image.network(
                                            "$domainName${tracking.afterImage?[index]}",
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Text('No Image');
                                            },
                                          )
                                        : const Text('No Image');
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}

class TrackingStatusTab extends StatelessWidget {
  const TrackingStatusTab({
    super.key,
    required this.trackingStatus,
  });

  final String? trackingStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stepper(
          controlsBuilder: (context, details) => const SizedBox(),
          currentStep: 3,
          steps: <Step>[
            Step(
              isActive: trackingStatus == 'Pending',
              title: const Text('Pending'),
              content: const Text(''),
            ),
            Step(
              isActive: trackingStatus == 'Started',
              title: const Text('Started'),
              content: const Text('Content for Step 2'),
            ),
            Step(
              isActive: trackingStatus == 'On Progress',
              title: const Text('On Progress'),
              content: const Text(''),
            ),
            Step(
              isActive: trackingStatus == 'Completed',
              title: const Text('Completed'),
              content: const Text(''),
            ),
          ],
        ),
      ],
    );
  }
}

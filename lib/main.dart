import 'package:al_dana/app/data/providers/vat_provider.dart';
import 'package:al_dana/app/modules/invoice/provider/invoice_provider.dart';
import 'package:al_dana/app/modules/rewards/provider/reward_provider.dart';
import 'package:al_dana/app/modules/tracking/providers/tracking_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'app/data/data.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InvoiceProvider()),
        ChangeNotifierProvider(create: (_) => VATProvider()),
        ChangeNotifierProvider(create: (_) => TrackingProvider()),
        ChangeNotifierProvider(create: (_) => RewardProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<VATProvider>(context, listen: false).fetchVAT();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    debugPaintSizeEnabled = false;
    return GetMaterialApp(
      title: "Al Dana",
      debugShowCheckedModeBanner: false,
      theme: MyTheme.themeData(isDarkTheme: false, context: context),
      darkTheme: MyTheme.themeData(isDarkTheme: true, context: context),
      themeMode: ThemeMode.light,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: AppPages.routes[0],
    );
  }
}

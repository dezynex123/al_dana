import 'package:al_dana/app/modules/splash&intro/views/intro_view.dart';
import 'package:get/get.dart';

import '../modules/add_booking/bindings/add_booking_binding.dart';
import '../modules/add_booking/views/add_booking_view.dart';
import '../modules/add_brand/bindings/add_brand_binding.dart';
import '../modules/add_brand/views/add_brand_view.dart';
import '../modules/add_vehicle/bindings/add_vehicle_binding.dart';
import '../modules/add_vehicle/views/add_vehicle_view.dart';
import '../modules/add_work/bindings/add_work_binding.dart';
import '../modules/add_work/views/add_work_view.dart';
import '../modules/address_map/bindings/address_map_binding.dart';
import '../modules/address_map/views/address_map_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/booking_page/bindings/booking_page_binding.dart';
import '../modules/booking_page/views/booking_page_view.dart';
import '../modules/branch/bindings/branch_binding.dart';
import '../modules/branch/views/branch_view.dart';
import '../modules/brand/bindings/brand_binding.dart';
import '../modules/brand/views/brand_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/map_page/bindings/map_page_binding.dart';
import '../modules/map_page/views/map_page_view.dart';
import '../modules/payment_page/bindings/payment_page_binding.dart';
import '../modules/payment_page/views/payment_page_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/service/bindings/service_binding.dart';
import '../modules/service/views/service_view.dart';
import '../modules/service_details/bindings/service_details_binding.dart';
import '../modules/service_details/views/service_details_view.dart';
import '../modules/slider/bindings/slider_binding.dart';
import '../modules/slider/views/slider_view.dart';
import '../modules/splash&intro/bindings/splash_binding.dart';
import '../modules/splash&intro/views/splash_view.dart';
import '../modules/subscription_page/bindings/subscription_page_binding.dart';
import '../modules/subscription_page/views/subscription_page_view.dart';

import '../modules/vehicle/bindings/vehicle_binding.dart';
import '../modules/vehicle/views/vehicle_view.dart';
import '../modules/work/bindings/work_binding.dart';
import '../modules/work/views/work_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.WORK,
      page: () => const WorkView(),
      binding: WorkBinding(),
    ),
    GetPage(
      name: _Paths.ADD_WORK,
      page: () => AddWorkView(),
      binding: AddWorkBinding(),
    ),
    GetPage(
      name: _Paths.BRAND,
      page: () => const BrandView(),
      binding: BrandBinding(),
    ),
    GetPage(
      name: _Paths.ADD_BRAND,
      page: () => const AddBrandView(),
      binding: AddBrandBinding(),
    ),
    GetPage(
      name: _Paths.VEHICLE,
      page: () => const VehicleView(),
      binding: VehicleBinding(),
    ),
    GetPage(
      name: _Paths.ADD_VEHICLE,
      page: () => const AddVehicleView(),
      binding: AddVehicleBinding(),
    ),
    GetPage(
      name: _Paths.MAP_PAGE,
      page: () => const MapPageView(),
      binding: MapPageBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE,
      page: () => const ServiceView(),
      binding: ServiceBinding(),
    ),
    GetPage(
      name: _Paths.SLIDER,
      page: () => const SliderView(),
      binding: SliderBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_DETAILS,
      page: () => const ServiceDetailsView(),
      binding: ServiceDetailsBinding(),
    ),
    GetPage(
      name: _Paths.BRANCH,
      page: () => const BranchView(),
      binding: BranchBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_PAGE,
      page: () => const PaymentPageView(),
      binding: PaymentPageBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_PAGE,
      page: () => const BookingPageView(),
      binding: BookingPageBinding(),
    ),
    GetPage(
      name: _Paths.ADD_BOOKING,
      page: () => const AddBookingView(),
      binding: AddBookingBinding(),
    ),
    
    GetPage(
      name: _Paths.SUBSCRIPTION_PAGE,
      page: () => const SubscriptionPageView(),
      binding: SubscriptionPageBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_MAP,
      page: () => AddressMapView(),
      binding: AddressMapBinding(),
    ),
  ];
}

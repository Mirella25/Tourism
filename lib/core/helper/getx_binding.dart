import 'package:get/get.dart';
import 'package:tourism_app/controller/splash_controller.dart';
import 'package:tourism_app/controller/user/country_controller.dart';
import 'package:tourism_app/controller/user/facility_details_controller.dart';
import 'package:tourism_app/controller/user/home_controller.dart';
import 'package:tourism_app/controller/user/trip_details_controller.dart';
import 'package:tourism_app/core/services/country_service.dart';
import 'package:tourism_app/core/services/facility_details_service.dart';
import 'package:tourism_app/core/services/home_service.dart';
import 'package:tourism_app/core/services/trip_details_service.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    /// for controllers
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => HomeControllerImp(homeService: Get.find()));
    Get.lazyPut(() => CountryController(countryService: Get.find()),
        fenix: true);
    Get.lazyPut(() => TripDetailsController(tripDetailsService: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => FacilityDetailsController(facilityDetailsService: Get.find()),
        fenix: true);

    /// for services
    Get.lazyPut(() => HomeService());
    Get.lazyPut(() => CountryService(), fenix: true);
    Get.lazyPut(() => TripDetailsService(), fenix: true);
    Get.lazyPut(() => FacilityDetailsService(), fenix: true);
  }
}

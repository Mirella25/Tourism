// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:tourism_app/core/services/home_service.dart';
import 'package:tourism_app/data/model/countries_model.dart';
import 'package:tourism_app/data/model/trips_model.dart';

abstract class HomeController extends GetxController {
  openDrawer();
  closeDrawer();
  changeValuesInEngToOpen();
  changeValuesInArToOpen();
  changeValuesInToClose();
}

class HomeControllerImp extends HomeController {
  var value = 0.0.obs;
  var xOffset = 0.0.obs;
  var yOffset = 0.0.obs;
  var scaleFector = 1.0.obs;
  var isDrawerOpen = false.obs;
  @override
  closeDrawer() {
    value.value = 0;
  }

  @override
  openDrawer() {
    value.value = 1;
  }

  @override
  changeValuesInEngToOpen() {
    xOffset.value = 230;
    yOffset.value = 150;
    scaleFector.value = 0.6;
    isDrawerOpen.value = true;
  }

  @override
  changeValuesInToClose() {
    xOffset.value = 0;
    yOffset.value = 0;
    scaleFector.value = 1;
    isDrawerOpen.value = false;
  }

  @override
  changeValuesInArToOpen() {
    xOffset.value = -120;
    yOffset.value = 150;
    scaleFector.value = 0.6;
    isDrawerOpen.value = true;
  }

  final HomeService homeService;

  HomeControllerImp({required this.homeService});
  bool isLoading = false;
  bool searchLoading = false;
  List<TripsModel> recommendedList = <TripsModel>[];
  List<TripsModel> offersList = <TripsModel>[];
  List<CountriesModel> countriesList = <CountriesModel>[];
  List<TripsModel> resultsTripsList = <TripsModel>[];

  Future<void> getHomeRecommended() async {
    isLoading = true;
    Response response = await homeService.getHomeRecommended();
    if (response.statusCode == 200) {
      recommendedList = [];

      for (int i = 0; i < response.body['data'].length; i++) {
        recommendedList.add(TripsModel.fromJson(response.body['data'][i]));
      }
    }
    isLoading = false;
    update();
  }

  Future<void> getHomeOffers() async {
    isLoading = true;
    Response response = await homeService.getHomeOffers();
    if (response.statusCode == 200) {
      offersList = [];
      for (int i = 0; i < response.body['data'].length; i++) {
        offersList.add(TripsModel.fromJson(response.body['data'][i]));
      }
    }
    isLoading = false;
    update();
  }

  Future<void> getHomeCountries() async {
    isLoading = true;
    Response response = await homeService.getHomeCountries();
    if (response.statusCode == 200) {
      countriesList = [];
      for (int i = 0; i < response.body['data'].length; i++) {
        countriesList.add(CountriesModel.fromJson(response.body['data'][i]));
      }
    }
    isLoading = false;
    update();
  }

  Future<bool> searchHomeCountries(String query) async {
    searchLoading = true;
    update();
    Response response = await homeService.searchHomeTrips(query);
    if (response.statusCode == 200) {
      resultsTripsList = [];
      if (response.body['data'] == null) {
      } else {
        for (int i = 0; i < response.body['data'].length; i++) {
          resultsTripsList.add(TripsModel.fromJson(response.body['data'][i]));
        }
      }
      searchLoading = false;
      update();
      return true;
    } else {
      searchLoading = false;
      return false;
    }
  }

  Future<void> searchTrip(String field) async {
    searchLoading = true;
    update();
    Response response = await homeService.searchTrip(field);
    if (response.statusCode == 200) {
      resultsTripsList = [];
      for (int i = 0; i < response.body['data'].length; i++) {
        resultsTripsList.add(TripsModel.fromJson(response.body['data'][i]));
      }
    }
    searchLoading = false;
    update();
  }
}

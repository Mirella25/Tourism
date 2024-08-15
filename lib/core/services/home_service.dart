import 'package:get/get.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/helper/api.dart';

class HomeService {
  Future<Response> getHomeRecommended() async {
    return await Api()
        .get(url: ApiRoute.baseUrl + ApiRoute.getHomeRecommendedUrl);
  }

  Future<Response> getHomeOffers() async {
    return await Api().get(url: ApiRoute.baseUrl + ApiRoute.getHomeOffersUrl);
  }

  Future<Response> getHomeCountries() async {
    return await Api().get(url: ApiRoute.baseUrl + ApiRoute.getHomeCountiesUrl);
  }

  // todo check later
  Future<Response> searchHomeTrips(String query) async {
    return await Api().post(
        url: ApiRoute.baseUrl + ApiRoute.searchHomeTripsUrl,
        body: {"field": query});
  }

  Future<Response> searchTrip(String field) async {
    return await Api().post(
        url: ApiRoute.baseUrl + ApiRoute.searchHomeTripsUrl,
        body: {"field": field});
  }
}

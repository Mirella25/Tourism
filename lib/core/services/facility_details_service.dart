import 'package:get/get.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/helper/api.dart';

class FacilityDetailsService {
  Future<Response> facilityDetails(String facilityId) async {
    return await Api().post(
        url: ApiRoute.baseUrl + ApiRoute.facilityDetailsUrl,
        body: {"id": facilityId});
  }

  Future<Response> addRate(String facilityId, String rate) async {
    return await Api().post(
        url: ApiRoute.baseUrl + ApiRoute.addRateUrl,
        body: {"facility_id": facilityId, "rate": rate});
  }

  Future<Response> deleteRate(String rateId) async {
    return await Api().post(
        url: ApiRoute.baseUrl + ApiRoute.addRateUrl, body: {"id": rateId});
  }

  Future<Response> updateRate(String rateId, String rate) async {
    return await Api().post(
        url: ApiRoute.baseUrl + ApiRoute.addRateUrl,
        body: {"id": rateId, "rate": rate});
  }
}

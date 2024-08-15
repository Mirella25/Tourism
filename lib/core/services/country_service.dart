import 'package:get/get.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/helper/api.dart';

class CountryService {
  Future<Response> countryDetails(String countryId) async {
    return await Api().post(
        url: ApiRoute.baseUrl + ApiRoute.countryDetailsUrl,
        body: {"id": countryId});
  }
}

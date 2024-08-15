import 'package:get/get.dart';
import 'package:tourism_app/core/services/country_service.dart';
import 'package:tourism_app/data/model/country_details_model.dart';

class CountryController extends GetxController {
  final CountryService countryService;

  CountryController({required this.countryService});

  CountryDetailsModel? countryDetails;
  bool isLoading = false;

  Future<void> getCountryDetails(String countryId) async {
    isLoading = true;
    Response response = await countryService.countryDetails(countryId);
    if (response.statusCode == 200) {
      countryDetails = CountryDetailsModel.fromJson(response.body);
    }
    isLoading = false;
    update();
  }
}

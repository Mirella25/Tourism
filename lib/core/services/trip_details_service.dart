import 'package:get/get.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/helper/api.dart';

class TripDetailsService {
  Future<Response> tripDetails(String tripId) async {
    return await Api().post(
        url: ApiRoute.baseUrl + ApiRoute.tripDetailsUrl, body: {"id": tripId});
  }

  Future<Response> addReview(String tripId, String review) async {
    return await Api().post(
        url: ApiRoute.baseUrl + ApiRoute.addReviewUrl,
        body: {"trip_id": tripId, "comment": review});
  }

  Future<Response> deleteReview(String reviewId) async {
    return await Api().post(
        url: ApiRoute.baseUrl + ApiRoute.deleteReviewUrl,
        body: {"id": reviewId});
  }

  Future<Response> addAppointment(String tripId, String numberOfPlaces) async {
    return await Api().post(
        url: ApiRoute.baseUrl + ApiRoute.addAppointmentUrl,
        body: {"trip_id": tripId, "number_of_places": numberOfPlaces});
  }
}

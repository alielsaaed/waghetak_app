import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waghetak_app/model/booking_model.dart';
import '../../constants/linkapi.dart';
import '../../model/home_model.dart';

class HomeApi {

  Future<List<HomeModel>> getHomeInfo() async {
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer 6|yaTC540mEF5UWS8WsLOckEbBPJOHNWeNgxkmn7PIdf7ff333"
      };

      http.Response response = await http.get(Uri.parse(linkTrips), headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['data'];
        return data.map((item) => HomeModel.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load data: $e");
    }
  }
  Future<List<BookingModel>> bookingOrder() async {
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer 6|yaTC540mEF5UWS8WsLOckEbBPJOHNWeNgxkmn7PIdf7ff333"
      };

      http.Response response = await http.get(Uri.parse(linkBooking), headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['data'];
        return data.map((item) => BookingModel.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load data: $e");
    }
  }
}

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places_app/utils/google_api.dart';
import 'package:http/http.dart' as http;

class LocationUtil {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=${GoogleApi.GOOGLE_API_KEY}';
  }

  static Future<String> getAddressFrom(LatLng position) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${GoogleApi.GOOGLE_API_KEY}';
    final response = await http.get(Uri.parse(url));
    return jsonDecode(response.body)['results'][0]['formatted_address'];
  }
}

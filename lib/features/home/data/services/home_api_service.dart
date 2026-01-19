import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/house_model.dart';

class HomeApiService {
  static const String baseUrl = "http://10.0.2.2:8000/api";

  Future<List<House>> fetchHouses({String? search}) async {
    final url = search == null
        ? "$baseUrl/houses/"
        : "$baseUrl/houses/?search=$search";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => House.fromJson(e)).toList();
    } else {
      throw Exception("Erreur chargement maisons");
    }
  }
}

import 'package:flutter_http_example/src/models/brands.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final String baseUrl = "https://10.0.2.2:7206";
  Client client = Client();

  Future<List<Brands>> getBrandss() async {
    final response = await client.get("$baseUrl/api/Brands");
    if (response.statusCode == 200) {
      return BrandsFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createBrands(Brands data) async {
    final response = await client.post(
      "$baseUrl/api/Brands",
      headers: {"content-type": "application/json"},
      body: BrandsToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateBrands(Brands data) async {
    final response = await client.put(
      "$baseUrl/api/Brands/${data.id}",
      headers: {"content-type": "application/json"},
      body: BrandsToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteBrands(int id) async {
    final response = await client.delete(
      "$baseUrl/api/Brands/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}

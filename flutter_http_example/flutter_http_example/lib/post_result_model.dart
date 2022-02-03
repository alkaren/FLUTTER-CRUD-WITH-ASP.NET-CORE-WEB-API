import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Map<String, String> headers = {'Content-Type': 'application/json'};

class Brands {
  int id;
  String brand_name;

  Brands({this.id, this.brand_name});

  factory Brands.createPostBrands(Map<String, dynamic> object) {
    return Brands(id: object['brandId'], brand_name: object['brandName']);
  }

  static Future<Brands> connectToAPI(int id, String brand_name) async {
    String apiURL = "https://10.0.2.2:7206/api/Brands";
    final msg = jsonEncode({"brandId": id, "brandName": brand_name});

    var apiResult = await http.post(apiURL, body: msg, headers: headers);
    var jsonObject = json.decode(apiResult.body);

    return Brands.createPostBrands(jsonObject);
  }
}

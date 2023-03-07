import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latihan_bloc/data/models/masakan.dart';

class MasakanProvider {
  Future<Map<String, dynamic>> getDataMasakan() async {
    try {
      Uri url = Uri.parse("https://masak-apa-tomorisakura.vercel.app/api/recipesa");
      var response = await http.get(url);

      if (response.statusCode != 200) {
        return {
          "error": true,
          "message": "${response.statusCode}",
        };
      }

      Map<String, dynamic> body = jsonDecode(response.body);

      return {
        "error": false,
        "message": "Berhasil get data masakan",
        "data": MasakanModel.fromJson(body),
      };
    } catch (e) {
      return {
        "error": true,
        "message": "$e",
      };
    }
  }
}

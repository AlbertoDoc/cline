import 'dart:convert';

import 'package:cline/features/service/API.dart';
import 'package:cline/models/clinic.dart';
import 'package:http/http.dart' as http;

class ClinicService {
  static Future<List<Clinic>> searchClinic(String searchString) async {
    List<Clinic> clinics = [];

     await http.post(
        Uri.parse(API.BASE_URL + API.SEARCH_CLINIC),

        headers: {
          "Content-Type": "application/json"
        },

        body: jsonEncode({"search": searchString})
    ).then((response) {
      //TODO Implement error treatment
      dynamic body = jsonDecode(response.body);
      dynamic clinicJson = body["data"]["clinics"];

      for (var item in clinicJson) {
        clinics.add(new Clinic(item["id"], item["name"], "", ""));
      }

      return clinics;
    });

    return clinics;
  }
}
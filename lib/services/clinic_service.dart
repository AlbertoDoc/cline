import 'dart:convert';

import 'package:cline/models/clinic.dart';
import 'package:http/http.dart' as http;

import 'API.dart';

class ClinicService {
  static Future<List<Clinic>> searchClinic(String searchString) async {
    List<Clinic> clinics = [];

     await http.post(
        Uri.parse(API.BASE_URL + API.CLINIC_PREFIX),

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
  
  static Future<dynamic> getClinicOverviewAndDoctors(String clinicId) async {
    dynamic retorno;

    await http.get(
      Uri.parse(API.BASE_URL + API.CLINIC_PREFIX + clinicId + "/doctors"),
    ).then((response) {
      retorno = jsonDecode(response.body);
    });

    return retorno;
  }
}
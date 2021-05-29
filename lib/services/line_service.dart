import 'dart:convert';

import 'package:cline/models/patient.dart';
import 'package:cline/services/API.dart';

import 'package:http/http.dart' as http;

class LineService {

  static Future<String> getDoctor(String clinicId, String doctorId) async {
    String doctorName = "";

    await http.get(
      Uri.parse(API.BASE_URL + API.SEARCH_CLINIC + clinicId + "/doctors/" + doctorId + "/line"),
    ).then((response) {
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        doctorName = jsonDecode(response.body)["data"]["doctor"]["name"];
      }
    });

    return doctorName;
  }

  static Future<List<Patient>> getLine(String clinicId, String doctorId) async {
    await http.get(
      Uri.parse(API.BASE_URL + clinicId + "doctors/" + doctorId + "/line"),
    ).then((response) {
      print(response);

    });

  }
}
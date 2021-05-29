import 'dart:async';

import 'package:cline/models/clinic.dart';
import 'package:cline/models/doctor.dart';
import 'package:cline/services/clinic_service.dart';
import 'package:cline/widgets/select_box/round_selected_box.dart';

abstract class ClinicOverviewController {
  Stream<String> get searchState;
  Stream<Clinic> get clinicInfoState;
  Stream<List<Doctor>> get doctorListState;

  void onSearchChange(String text);
  void onClinicInfoChange(String clinicId);
  void onDoctorListChange(dynamic doctorsJson);
  void dispose();
}

class ClinicOverviewImpl extends ClinicOverviewController {
  final _searchFieldController = StreamController<String>();
  final _clinicInfoController = StreamController<Clinic>();
  final _doctorListController = StreamController<List<Doctor>>();

  @override
  Stream<String> get searchState => _searchFieldController.stream;

  @override
  Stream<Clinic> get clinicInfoState => _clinicInfoController.stream;

  @override
  Stream<List<Doctor>> get doctorListState => _doctorListController.stream;

  @override
  void onSearchChange(String text) {
    print("pesquisei");
    // TODO integration with api and apply debouncer
    _searchFieldController.add(text);
  }

  @override
  void onClinicInfoChange(String clinicId) {
    ClinicService.getClinicOverviewAndDoctors(clinicId)
    .then((response) {
      print(response);
      if (response != null) {
        var clinicJson = response["data"]["clinic"];

        //onDoctorListChange(response["data"]["doctors"]);
        print(clinicJson["id"]);
        print(clinicJson["name"]);
        print(clinicJson["address"]);
        print(clinicJson["phone"]);

        _clinicInfoController.sink.add(new Clinic(clinicJson["id"], clinicJson["name"], clinicJson["address"], clinicJson["phone"]));
      }
    });
  }

  @override
  void onDoctorListChange(dynamic doctorsJson) {
    List<Doctor> doctorList = [];
    for (var item in doctorsJson) {
      doctorList.add(new Doctor(item["id"], item["name"]));
    }

    _doctorListController.sink.add(doctorList);
  }

  @override
  void dispose() {
    _searchFieldController.close();
    _clinicInfoController.close();
    _doctorListController.close();
  }
}
import 'dart:async';

import 'package:cline/models/clinic.dart';
import 'package:cline/models/patient.dart';
import 'package:cline/services/clinic_service.dart';
import 'package:cline/services/line_service.dart';

abstract class QueueController {

  Stream<Clinic> get clinicInfoState;
  Stream<String> get doctorNameState;
  Stream<List<Patient>> get patientListState;

  void onClinicInfoChange(String clinicId);
  void onDoctorNameChange(String clinicId, String doctorId);
  void onPatientListChange(String clinicId, String doctorId);
}

class QueueImpl extends QueueController {
  final _clinicInfoController = StreamController<Clinic>();
  final _doctorNameController = StreamController<String>();
  final _patientListController = StreamController<List<Patient>>();

  @override
  Stream<Clinic> get clinicInfoState => _clinicInfoController.stream;

  @override
  Stream<String> get doctorNameState => _doctorNameController.stream;

  @override
  Stream<List<Patient>> get patientListState => _patientListController.stream;

  @override
  void onClinicInfoChange(String clinicId) {
    ClinicService.getClinicOverviewAndDoctors(clinicId)
        .then((response) {
      if (response != null) {
        var clinicJson = response["data"]["clinic"];

        _clinicInfoController.sink.add(new Clinic(
            clinicJson["id"],
            clinicJson["name"],
            clinicJson["address"],
            clinicJson["phone"])
        );
      }
    });
  }

  @override
  void onDoctorNameChange(String clinicId, String doctorId) {
    LineService.getDoctor(clinicId, doctorId)
        .then((value) {
          print(value);
          _doctorNameController.sink.add(value);
    });
  }

  @override
  void onPatientListChange(String clinicId, String doctorId) {
    LineService.getLine(clinicId, doctorId)
        .then((value) {
          print(value);
          _patientListController.sink.add(value);
    });
  }

  @override
  void dispose() {
    _clinicInfoController.close();
    _patientListController.close();
  }
}
import 'package:cline/features/clinicOverview/clinic_overview_controller.dart';
import 'package:cline/models/clinic.dart';
import 'package:cline/models/doctor.dart';
import 'package:cline/widgets/cards/doctor_card.dart';
import 'package:cline/widgets/input_field/input_search_field_clinic.dart';
import 'package:flutter/material.dart';

class ClinicOverviewPage extends StatefulWidget {
  final String clinicId;

  ClinicOverviewPage(this.clinicId);

  @override
  _ClinicOverviewPageState createState() => _ClinicOverviewPageState();
}

class _ClinicOverviewPageState extends State<ClinicOverviewPage> {
  final ClinicOverviewController _controller = ClinicOverviewImpl();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  _clinicInfo(),
                  SizedBox(
                    height: 20,
                  ),
                  _searchField(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Expanded(child: _doctorsList()),
          ],
        ),
      ),
    );
  }

  Widget _clinicInfo() {
    return StreamBuilder<Clinic>(
        stream: _controller.clinicInfoState,
        builder: (context, snapshot) {
          final clinic = snapshot.data;
          return Column(
            children: [
              Text(
                clinic == null ? "" : clinic.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(clinic == null ? "" : clinic.address),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  Text(
                    clinic == null ? "" : clinic.phone,
                  )
                ],
              )
            ],
          );
        });
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: StreamBuilder<String>(
          stream: _controller.searchState,
          initialData: '',
          builder: (context, snapshot) {
            return InputSearchFieldClinic(
                controller: _searchController,
                onChanged: _controller.onSearchChange);
          }),
    );
  }

  Widget _doctorsList() {
    return StreamBuilder(
        stream: _controller.doctorListState,
        initialData: [],
        builder: (context, snapshot) {
          final doctorsList = snapshot.data as List<Doctor>;
          final doctorsListWidget = doctorsList.map((doctor) {
            return DoctorCard(doctor.id, doctor.name, doctor.isAttendingToday,
                widget.clinicId);
          }).toList();
          return ListView.builder(
              itemCount: doctorsListWidget.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return doctorsListWidget[index];
              });
        });
  }

  @override
  void initState() {
    super.initState();
    _controller.onClinicInfoChange(widget.clinicId);
  }
}

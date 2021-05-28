import 'package:cline/core/values/cline_colors.dart';
import 'package:cline/features/clinicOverview/clinic_overview_controller.dart';
import 'package:cline/features/queue/queue_screen.dart';
import 'package:cline/models/clinic.dart';
import 'package:cline/widgets/cards/doctor_card.dart';
import 'package:cline/widgets/cards/specialization_card.dart';
import 'package:cline/widgets/input_field/input_search_field_clinic.dart';
import 'package:flutter/material.dart';

final list = [
  SpecializationCard(),
  DoctorCard(),
  DoctorCard(),
  DoctorCard(),
  DoctorCard(),
  DoctorCard(),
  DoctorCard(),
  DoctorCard(),
  DoctorCard(),
  DoctorCard(),
  SpecializationCard(),
  DoctorCard(),
  SpecializationCard(),
  DoctorCard()
];

class ClinicOverviewPage extends StatefulWidget {
  @override
  _ClinicOverviewPageState createState() => _ClinicOverviewPageState();
}

class _ClinicOverviewPageState extends State<ClinicOverviewPage> {
  final ClinicOverviewController _controller = ClinicOverviewImpl();
  final TextEditingController _searchController = TextEditingController();
  
  Clinic clinic = new Clinic("1", "Clínica Santa Bárbara", "R. Barros Falcão - nº 365 - Matatu Salvador - BA", "(71) 3233- 3315");

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
                  SizedBox(height: 20,),
                  _searchField(),
                  SizedBox(height: 20,),
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
    return Column(
      children: [
        Text(clinic.name,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 20,),
        Text(clinic.address),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone),
            Text(clinic.phone,)
          ],
        )
      ],
    );
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
                onChanged: _controller.onSearchChange
            );
          }
      ),
    );
  }

  Widget _doctorsList() {
    return ListView.builder(
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return list[index];
      }
    );
  }
}

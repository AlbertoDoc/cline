import 'package:cline/core/values/cline_colors.dart';
import 'package:cline/features/clinicOverview/clinic_overview_controller.dart';
import 'package:cline/widgets/input_field/input_search_field_clinic.dart';
import 'package:flutter/material.dart';

class ClinicOverviewPage extends StatefulWidget {
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
                  _searchField()
                ],
              ),
            ),
            _specializationContainer(),
            _doctorContainer(),
            //_doctorsList()
          ],
        ),
      ),
    );
  }

  Widget _clinicInfo() {
    return Column(
      children: [
        Text("Clínica Santa Bárbara",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10,),
        Text("R. Barros Falcão - nº 365 - Matatu Salvador - BA"),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone),
            Text("(71) 3233- 3315")
          ],
        )
      ],
    );
  }

  Widget _searchField() {
    return StreamBuilder<String>(
        stream: _controller.searchState,
        initialData: '',

        builder: (context, snapshot) {
          return InputSearchFieldClinic(
              controller: _searchController,
              onChanged: _controller.onSearchChange
          );
        }
    );
  }

  // Specialization Container Style
  Widget _specializationContainer() {
    return Align(
      alignment: Alignment(-1.0, 0.0),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: ClineColors.specialization_container,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50)
          )
        ),
        child: Center(
            child: Text(
              "Dermatologia",
              style: TextStyle(
                  color: ClineColors.white,
                  fontSize: 20
              ),
            )
        ),
      ),
    );
  }

  // Doctor Container Style
  Widget _doctorContainer() {
    return Align(
      alignment: Alignment(-1.0, 0.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: ClineColors.doctor_container,
        child: Row(
          children: [
            SizedBox(width: 5,),
            Icon(Icons.thumb_up_alt),
            SizedBox(width: 5,),
            Text("Dr. Fulano de Tal")
          ],
        ),
      ),
    );
  }

  Widget _doctorsList() {
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        // TODO build list item
      }
    );
  }
}

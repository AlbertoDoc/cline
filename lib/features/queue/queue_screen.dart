import 'package:cline/core/values/cline_colors.dart';
import 'package:cline/features/queue/queue_controller.dart';
import 'package:cline/models/clinic.dart';
import 'package:cline/models/patient.dart';
import 'package:cline/widgets/cards/patient_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QueuePage extends StatefulWidget {
  
  final String doctorId;
  final String clinicId;

  QueuePage(this.doctorId, this.clinicId);

  @override
  _QueuePageState createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {

  final _controller = QueueImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5,),
            _clinicInfo(),
            SizedBox(height: 20,),
            Text(
              "Fila de Atendimento",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15,),
            _doctorView(),
            _listHeader(),
            _divider(),
            Expanded(child: _queue())
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
              Text(clinic == null ? "" : clinic.name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Text(clinic == null ? "" : clinic.address),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  Text(clinic == null ? "" : clinic.phone,)
                ],
              )
            ],
          );
        }
    );
  }

  Widget _doctorView() {
    return StreamBuilder<String>(
        stream: _controller.doctorNameState,
        initialData: "",
        builder: (context, snapshot) {
          final String doctorName = snapshot.data;
          return Align(
            alignment: Alignment(-1.0, 0.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ClineColors.specialization_container,
              ),
              child: Center(
                  child: Text(
                    doctorName,
                    style: TextStyle(
                        color: ClineColors.white,
                        fontSize: 20
                    ),
                  )
              ),
            ),
          );
        }
    );
  }

  Widget _listHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Posição",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Text(
            "Nome",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              "Tempo",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 13, top: 10),
      child: Divider(
        thickness: 2,
        color: Colors.black,
      ),
    );
  }

  Widget _queue() {
    return StreamBuilder<List<Patient>>(
      stream: _controller.patientListState,
        initialData: [],
        builder: (context, snapshot) {
          final listPatient = snapshot.data;
          final listPatientWidget = listPatient.map((item) {
            return PatientCard(item.name);
          }).toList();
          return ListView.builder(
              itemCount: listPatientWidget.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return listPatientWidget[index];
              }
          );
        }
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.onClinicInfoChange(widget.clinicId);
    _controller.onDoctorNameChange(widget.clinicId, widget.doctorId);
    _controller.onPatientListChange(widget.clinicId, widget.doctorId);
  }
}

import 'package:cline/core/values/cline_colors.dart';
import 'package:cline/features/queue/queue_screen.dart';
import 'package:cline/models/doctor.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {

  final Doctor doctor = new Doctor(1, "Dr. Fulano de Tal");

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ClineColors.doctor_container,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: ClineColors.doctor_container,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => QueuePage())
            );
          },
          child: Row(
            children: [
              SizedBox(width: 5,),
              Icon(Icons.verified, color: Colors.green,),
              SizedBox(width: 5,),
              Text(doctor.name)
            ],
          ),
        ),
      ),
    );
  }
}

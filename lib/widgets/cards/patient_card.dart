import 'package:cline/core/values/cline_colors.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {

  final String name;
  final int position;
  final String waitingTime;

  PatientCard(this.name, this.position, this.waitingTime);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: ClineColors.patient_container,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 32, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(position.toString() + "º"),
                Text(name),
                Text(waitingTime)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

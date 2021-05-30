import 'package:cline/core/values/cline_colors.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {

  final String name;
  final int position;
  final String waitingTime;
  
  String formatedWaitingTime;

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
            padding: const EdgeInsets.only(left: 32, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(position.toString() + "º",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(_formatTime(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime() {
    formatedWaitingTime = "";

    if (waitingTime.split(":")[1] != "00") {
      formatedWaitingTime += waitingTime.split(":")[1] + "h";
    } else if (waitingTime.split(":")[2] != "00") {
      formatedWaitingTime += waitingTime.split(":")[2] + "min";
    }

    return formatedWaitingTime;
  }
}

import 'package:cline/core/values/cline_colors.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {

  final String name;

  PatientCard(this.name);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ClineColors.doctor_container,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: ClineColors.doctor_container,
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}

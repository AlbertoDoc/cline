import 'package:cline/core/values/cline_colors.dart';
import 'package:flutter/material.dart';

class SpecializationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
import 'package:cline/core/values/cline_colors.dart';
import 'package:cline/features/queue/queue_screen.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {

  final String id;
  final String name;
  final bool isAttendingToday;

  DoctorCard(this.id, this.name, this.isAttendingToday);

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
              Icon(
                isAttendingToday ? Icons.verified : Icons.close,
                color: isAttendingToday ? Colors.green : Colors.red,
              ),
              SizedBox(width: 5,),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}

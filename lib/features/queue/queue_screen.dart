import 'package:cline/core/values/cline_colors.dart';
import 'package:flutter/material.dart';

class QueuePage extends StatefulWidget {
  @override
  _QueuePageState createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {

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
            _queue()
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
        SizedBox(height: 20,),
        Text("R. Barros Falcão - nº 365 - Matatu Salvador - BA"),
        SizedBox(height: 20,),
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

  Widget _doctorView() {
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
              "Dr. Fulano de Tal",
              style: TextStyle(
                  color: ClineColors.white,
                  fontSize: 20
              ),
            )
        ),
      ),
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

  Widget _queue() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13, right: 13, top: 10),
          child: Divider(
            thickness: 2,
            color: Colors.black,
          ),
        ),
        //ListView()
      ],
    );
  }
}

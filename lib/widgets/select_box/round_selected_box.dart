import 'package:cline/core/values/cline_colors.dart';
import 'package:cline/core/values/text_styles.dart';
import 'package:flutter/material.dart';

enum SelectBoxType {
  clinic,
  specialty,
  doctor,
}

class RoundSelectedBox extends StatelessWidget {
  final SelectBoxType type;
  final Function tapHandler;
  final Function searchHandler;
  final TextEditingController searchController;
  final bool selected;

  RoundSelectedBox({
    required this.type,
    required this.tapHandler,
    required this.searchHandler,
    required this.searchController,
    required this.selected,
  });

  void _tapHandlerWrapper() {
    tapHandler(type: type);

    searchHandler(searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _tapHandlerWrapper,
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: selected
                  ? ClineColors.main_primary
                  : ClineColors.unselect_box,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: _iconBox(),
          ),
          SizedBox(
            height: 5,
          ),
          _textInfo(),
        ],
      ),
    );
  }

  Widget _textInfo() {
    String info;
    switch (type) {
      case SelectBoxType.clinic:
        info = 'Clínica';
        break;
      case SelectBoxType.doctor:
        info = 'Médico';
        break;
      default:
        info = 'Especialidade';
        break;
    }

    return Text(
      info,
      style: TextStyles.selectInfoText,
    );
  }

  Widget _iconBox() {
    IconData icon;
    switch (type) {
      case SelectBoxType.clinic:
        icon = Icons.home;
        break;
      case SelectBoxType.doctor:
        icon = Icons.medical_services;
        break;
      default:
        icon = Icons.mediation;
        break;
    }
    return Icon(
      icon,
      size: 30,
      color: ClineColors.white,
    );
  }
}

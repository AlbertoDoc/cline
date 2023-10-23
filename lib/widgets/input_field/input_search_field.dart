import 'package:cline/core/values/cline_colors.dart';
import 'package:cline/core/values/text_styles.dart';
import 'package:cline/widgets/select_box/round_selected_box.dart';
import 'package:flutter/material.dart';

class InputSearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function onChanged;
  final SelectBoxType selectType;

  InputSearchField({
    required this.controller,
    required this.onChanged,
    required this.selectType,
  });

  void onChangedWrapper(String text) {
    onChanged(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChangedWrapper,
      controller: controller,
      style: TextStyles.inputField,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        hintText: 'Buscar Clínica...',
        hintStyle: TextStyles.hintField,
        enabledBorder: _setBorder(ClineColors.input_border),
        focusedBorder: _setBorder(ClineColors.main_primary),
        prefixIcon: Icon(
          Icons.search,
          color: ClineColors.main_primary,
        ),
      ),
    );
  }

  InputBorder _setBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}

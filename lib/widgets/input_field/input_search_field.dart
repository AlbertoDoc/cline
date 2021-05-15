import 'package:cline/core/values/cline_colors.dart';
import 'package:cline/core/values/text_styles.dart';
import 'package:flutter/material.dart';

class InputSearchField extends StatefulWidget {
  @override
  _InputSearchFieldState createState() => _InputSearchFieldState();
}

class _InputSearchFieldState extends State<InputSearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyles.inputField,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        hintText: 'Buscar Clínica...',
        hintStyle: TextStyles.hintField,
        enabledBorder: _setBorder(color: ClineColors.input_border),
        focusedBorder: _setBorder(color: ClineColors.main_primary),
        prefixIcon: Icon(
          Icons.search,
          color: ClineColors.main_primary,
        ),
      ),
    );
  }

  InputBorder _setBorder({@required Color color}) {
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

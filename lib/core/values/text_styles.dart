import 'package:cline/core/values/cline_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle get hintField => TextStyle(
        color: ClineColors.input_hint,
      );

  static TextStyle get inputField => TextStyle(
        color: ClineColors.input_text,
      );

  static TextStyle get clinicListText => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get selectInfoText => TextStyle(
        fontWeight: FontWeight.w400,
      );
}

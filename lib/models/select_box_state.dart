import 'package:cline/widgets/select_box/round_selected_box.dart';
import 'package:flutter/material.dart';

class SelectBoxState {
  final SelectBoxType type;
  final bool selected;

  SelectBoxState({
    @required this.type,
    @required this.selected,
  });
}

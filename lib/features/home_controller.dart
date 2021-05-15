import 'dart:async';

import 'package:cline/widgets/input_field/round_selected_box.dart';
import 'package:flutter/material.dart';

class SelectBoxState {
  final SelectBoxType type;
  final bool selected;

  SelectBoxState({
    @required this.type,
    @required this.selected,
  });
}

abstract class HomeController {
  Stream<List<SelectBoxState>> get selectState;
  void onSelectHandler({SelectBoxType type = SelectBoxType.clinic});
  void dispose();
}

class HomeControllerImpl extends HomeController {
  final _selectBoxController = StreamController<List<SelectBoxState>>();

  @override
  Stream<List<SelectBoxState>> get selectState => _selectBoxController.stream;

  @override
  void onSelectHandler({SelectBoxType type = SelectBoxType.clinic}) {
    final boxStates = _generateBaseState(type);

    _selectBoxController.add(boxStates);
  }

  @override
  void dispose() {
    _selectBoxController.close();
  }

  List<SelectBoxState> _generateBaseState(SelectBoxType type) {
    List<SelectBoxState> boxStates = [];
    for (var value in SelectBoxType.values) {
      boxStates.add(SelectBoxState(
        type: value,
        selected: value == type,
      ));
    }

    return boxStates;
  }
}

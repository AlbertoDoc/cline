import 'package:cline/features/home_controller.dart';
import 'package:cline/widgets/input_field/input_search_field.dart';
import 'package:cline/widgets/input_field/round_selected_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeControllerImpl();

  @override
  void initState() {
    super.initState();
    _controller.onSelectHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            InputSearchField(),
            _optionRow(),
          ],
        ),
      ),
    );
  }

  Widget _optionRow() {
    return StreamBuilder<List<SelectBoxState>>(
      stream: _controller.selectState,
      initialData: [],
      builder: (context, snapshot) {
        final boxStates = snapshot.data;
        return Row(
          children: <Widget>[
            ...boxStates.map((boxState) {
              return RoundSelectedBox(
                type: boxState.type,
                tapHandler: _controller.onSelectHandler,
                selected: boxState.selected,
              );
            }).toList()
          ],
        );
      },
    );
  }
}

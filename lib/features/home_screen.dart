import 'package:cline/features/home_controller.dart';
import 'package:cline/widgets/input_field/input_search_field.dart';
import 'package:cline/widgets/select_box/round_selected_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeControllerImpl();
  final TextEditingController _searchController = TextEditingController();
  SelectBoxType _selectedBox = SelectBoxType.clinic;

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
            _searchField(),
            _optionRow(),
          ],
        ),
      ),
    );
  }

  Widget _searchField() {
    return StreamBuilder<String>(
      stream: _controller.searchState,
      initialData: '',
      builder: (context, snapshot) {
        return InputSearchField(
          controller: _searchController,
          onChanged: _controller.onSearchChange,
          selectType: _selectedBox,
        );
      },
    );
  }

  Widget _optionRow() {
    return StreamBuilder<List<SelectBoxState>>(
      stream: _controller.selectState,
      initialData: [],
      builder: (context, snapshot) {
        final boxStates = snapshot.data;
        final boxWidgetList = boxStates.map((boxState) {
          if (boxState.selected) _selectedBox = boxState.type;
          return RoundSelectedBox(
            type: boxState.type,
            tapHandler: _controller.onSelectHandler,
            searchController: _searchController,
            searchHandler: _controller.onSearchChange,
            selected: boxState.selected,
          );
        }).toList();
        return Row(
          children: boxWidgetList,
        );
      },
    );
  }
}

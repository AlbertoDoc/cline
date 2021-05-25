import 'package:cline/features/clinicOverview/clinic_overview_screen.dart';
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
            SizedBox(height: 20,),
            _searchField(),
            SizedBox(height: 20,),
            _optionRow(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ClinicOverviewPage())
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: StreamBuilder<String>(
        stream: _controller.searchState,
        initialData: '',
        builder: (context, snapshot) {
          return InputSearchField(
            controller: _searchController,
            onChanged: _controller.onSearchChange,
            selectType: _selectedBox,
          );
        },
      ),
    );
  }

  Widget _optionRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: StreamBuilder<List<SelectBoxState>>(
        stream: _controller.selectState,
        initialData: [],
        builder: (context, snapshot) {
          final boxStates = snapshot.data;
          final boxWidgetList = boxStates.map((boxState) {
            if (boxState.selected) _selectedBox = boxState.type;
            return Column(
              children: [
                RoundSelectedBox(
                  type: boxState.type,
                  tapHandler: _controller.onSelectHandler,
                  searchController: _searchController,
                  searchHandler: _controller.onSearchChange,
                  selected: boxState.selected,
                ),
                SizedBox(height: 2,),
                Text(_chooseSelectedBoxText(boxState))
              ],
            );
          }).toList();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: boxWidgetList,
          );
        },
      ),
    );
  }

  String _chooseSelectedBoxText(SelectBoxState boxState) {
    if (boxState.type == SelectBoxType.clinic) {
      return "Clínica";
    } else if (boxState.type == SelectBoxType.specialty) {
      return "Especialidade";
    } else {
      return "Médico";
    }
  }
}

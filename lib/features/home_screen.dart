import 'package:cline/core/values/cline_colors.dart';
import 'package:cline/core/values/dimens.dart';
import 'package:cline/features/home_controller.dart';
import 'package:cline/models/select_box_state.dart';
import 'package:cline/widgets/cards/custom_card.dart';
import 'package:cline/widgets/input_field/input_search_field.dart';
import 'package:cline/widgets/select_box/round_selected_box.dart';
import 'package:flutter/material.dart';

final list = [
  CustomCard(),
  CustomCard(),
  CustomCard(),
  CustomCard(),
  CustomCard(),
  CustomCard(),
  CustomCard(),
  CustomCard(),
  CustomCard(),
  CustomCard(),
  CustomCard(),
  CustomCard(),
  CustomCard(),
  CustomCard(),
  CustomCard(),
];

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _searchBox(),
            _dividerLine(context),
            Expanded(child: _searchList()),
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      width: Dimens.search_box_width,
      height: Dimens.search_box_height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _searchField(),
          _optionRow(),
        ],
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: boxWidgetList,
        );
      },
    );
  }

  Widget _searchList() {
    return GridView.builder(
      padding: EdgeInsets.all(5),
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Dimens.item_per_row,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return list[index];
      },
    );
  }

  Widget _dividerLine(BuildContext context) {
    return Container(
      height: 2,
      width: MediaQuery.of(context).size.width * 0.5,
      color: ClineColors.main_primary,
    );
  }
}

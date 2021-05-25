import 'dart:async';

abstract class ClinicOverviewController {
  Stream<String> get searchState;
  // TODO Add stream for back-end response

  void onSearchChange(String text);
  void dispose();
}

class ClinicOverviewImpl extends ClinicOverviewController {
  final _searchFieldController = StreamController<String>();

  @override
  Stream<String> get searchState => _searchFieldController.stream;

  @override
  void onSearchChange(String text) {
    print("pesquisei");
    // TODO integration with api and apply debouncer
    _searchFieldController.add(text);
  }

  @override
  void dispose() {
    _searchFieldController.close();
  }
}
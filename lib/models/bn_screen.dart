import 'package:flutter/cupertino.dart';

class BottomNavigationScreen {
  String _title;
  Widget _widget;

  BottomNavigationScreen(this._title, this._widget);

  Widget get widget => _widget;

  set widget(Widget value) {
    _widget = value;
  }
  String get title => _title;

  set title(String value) {
    _title = value;
  }
}

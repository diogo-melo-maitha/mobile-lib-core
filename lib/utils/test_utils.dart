import 'package:flutter/material.dart';

class TestUtils {
  static Widget buildTestableWidget(Widget widget) {
    return MaterialApp(
      home: Scaffold(
        body: widget,
      ),
    );
  }
}

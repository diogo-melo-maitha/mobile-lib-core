import 'package:flutter/material.dart';

class TmTestUtils {
  static Widget buildTestableWidget(Widget widget) {
    return MaterialApp(
      home: Scaffold(
        body: widget,
      ),
    );
  }
}
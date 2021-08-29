import 'package:flutter/material.dart';
import '../design/tm_scaffold.dart';

class TmLayoutColumn extends StatelessWidget {
  final List<Widget> children;

  const TmLayoutColumn({
    this.children = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return TmScaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

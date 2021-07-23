import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/widgets/design/tm_detailed_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  const key = Key('key');

  group('DetailedScaffold tests', () {
    testWidgets('DetailedScaffold is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmDetailedScaffold(
        key: key,
        body: Text(''),
      )));
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given body is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmDetailedScaffold(
        key: key,
        body: Text('text'),
      )));

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

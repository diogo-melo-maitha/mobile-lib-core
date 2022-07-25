import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/loading/rotate_sticks.dart';

void main() {
  const key = Key('key');
  final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: const TestVSync(),
  );

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance
      ..resetEpoch()
      ..platformDispatcher.onBeginFrame = null
      ..platformDispatcher.onDrawFrame = null;
  });
  group('RotateSticks tests', () {
    testWidgets('RotateSticks properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          RotateSticks(
            key: key,
            duration: const Duration(seconds: 1),
            controller: controller,
            size: 41,
          ),
        ),
      );
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Find RotationTransition and SvgPicture', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          const MediaQuery(
            data: MediaQueryData(),
            child: MaterialApp(
              home: RotateSticks(
                key: key,
                duration: Duration(seconds: 1),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.byType(RotationTransition), findsWidgets);
      expect(find.byType(SvgPicture), findsWidgets);
    });
  });
}

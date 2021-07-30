// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:tm_lib_core/widgets/buttons/tm_default_button.dart';
// import 'package:flutter/material.dart';
// import 'package:tm_lib_core/widgets/toast/tm_toast.dart';
//
//
// void main() {
//   group('TmToast tests', () {
//     testWidgets('TmToast is properly created', (tester) async {
//       await tester.pumpWidget(MaterialApp(
//         home: Scaffold(
//           body: Builder(
//             builder: (context) {
//               return Center(
//                 child: TmDefaultButton(
//                   title: '',
//                   onPressed: () {
//                     TmToast.showSuccess(title: 'success', context: context);
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ));
//
//       await tester.pump();
//       await tester.tap(find.byType(TmDefaultButton));
//       await Future.delayed(const Duration(seconds: 5));
//
//       expect(find.byType(Flushbar), findsOneWidget);
//     });
//   });
// }
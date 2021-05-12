flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
flutter test --machine --coverage test > tests.output
flutter pub global activate remove_from_coverage
flutter pub global run remove_from_coverage:remove_from_coverage -f coverage/lcov.info -r '.g.dart$' -r 'module.dart$'


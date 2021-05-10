import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tm_lib_core/security/security_repository.dart';

import 'security_repository_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
main() {
  const String key = '(H+MbQeThWmZq4t7w!z%C&F)J@NcRfUj';
  const String plainText = 'plainText123';

  SecurityRepository? repository;
  MockFlutterSecureStorage? secureStorage;

  setUp(() {
    secureStorage = MockFlutterSecureStorage();
    repository = SecurityRepository(secureStorage!);
  });

  group('security repository test', () {
    test('encryption key is properly save in secure storage', () async {
      await repository!.saveCoreEncryptionKey('key');

      verify(secureStorage!.write(key: 'coreEncryptionStorageKey', value: anyNamed('value'))).called(1);
    });

    test('encrypt sensitive data is correctly using storage key', () async {
      when(secureStorage!.read(key: anyNamed('key'))).thenAnswer((_) => Future.value(key));

      await repository!.encryptSensitiveData(plainText);

      verify(secureStorage!.read(key: 'coreEncryptionStorageKey')).called(1);
    });

    test('encrypt sensitive data is correctly returning valid result', () async {
      when(secureStorage!.read(key: anyNamed('key'))).thenAnswer((_) => Future.value(key));

      final result = await repository!.encryptSensitiveData(plainText);

      expect(result.mac, isNotNull);
      expect(result.nonce, isNotNull);
      expect(result.cipherText, isNotNull);
    });

    test('decrypt sensitive data is correctly using storage key and returns valid plainText', () async {
      when(secureStorage!.read(key: anyNamed('key'))).thenAnswer((_) => Future.value(key));
      final result = await repository!.encryptSensitiveData(plainText);

      final decryptResult = await repository!.decryptSensitiveData(result.cipherText, result.nonce, result.mac);

      expect(decryptResult, plainText);

      verify(secureStorage!.read(key: 'coreEncryptionStorageKey')).called(2);
    });
  });
}

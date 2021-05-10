import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/security/cryptography_utils.dart';

main() {
  const String key = '(H+MbQeThWmZq4t7w!z%C&F)J@NcRfUj';
  const String plainText = 'plainText123';

  group('Cryptography utils tests', () {
    test('encryption correctly returns result', () async {
      final result = await encryptAesGcm(plainText, key);

      expect(result.mac, isNotNull);
      expect(result.nonce, isNotNull);
      expect(result.cipherText, isNotNull);
    });

    test('decryption correctly translate cipher', () async {
      final encryptionResult = await encryptAesGcm(plainText, key);

      final result =
          await decryptAesGcm(encryptionResult.cipherText, key, encryptionResult.nonce, encryptionResult.mac);

      expect(result, plainText);
    });

    test('decryption throws exception with incorrect mac', () async {
      final encryptionResult = await encryptAesGcm(plainText, key);

      expect(() => decryptAesGcm(encryptionResult.cipherText, key, encryptionResult.nonce, 'invalidMac12'),
          throwsA(anything));
    });

    test('decryption throws exception with incorrect nonce', () async {
      final encryptionResult = await encryptAesGcm(plainText, key);

      expect(() => decryptAesGcm(encryptionResult.cipherText, key, 'invalidNonce', encryptionResult.mac),
          throwsA(anything));
    });

    test('decryption throws exception with incorrect key', () async {
      final encryptionResult = await encryptAesGcm(plainText, key);

      expect(
          () => decryptAesGcm(encryptionResult.cipherText, 'fake_QeThWmZq4t7w!z%C&F)J@NcRfUj', encryptionResult.nonce,
              encryptionResult.mac),
          throwsA(anything));
    });
  });
}

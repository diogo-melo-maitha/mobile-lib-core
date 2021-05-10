import 'dart:convert';
import 'package:cryptography/cryptography.dart';
import 'package:tm_lib_core/security/model/cryptography_result.dart';

/// cryptography library is being used initially for implementation simplicity, it is possible a future update to an internal implementation
/// After scope definition of the project, this implementation may change, so, it will only have basic tests for now

Future<CryptographyResult> encryptAesGcm(String valueToEncrypt, String key) async {
  final algorithm = AesGcm.with256bits();
  final nonce = algorithm.newNonce();
  final mKey = await algorithm.newSecretKeyFromBytes(utf8.encode(key));

  final result = await algorithm.encrypt(base64Decode(valueToEncrypt), secretKey: mKey, nonce: nonce);

  return CryptographyResult(
      base64Encode(result.nonce), base64Encode(result.cipherText), base64Encode(result.mac.bytes));
}

Future<String> decryptAesGcm(String valueToDecrypt, String key, String nonce, String mac) async {
  final secretBox = SecretBox(base64Decode(valueToDecrypt), nonce: base64Decode(nonce), mac: Mac(base64Decode(mac)));
  final algorithm = AesGcm.with256bits();
  final mKey = await algorithm.newSecretKeyFromBytes(utf8.encode(key));

  final result = await algorithm.decrypt(secretBox, secretKey: mKey);

  return base64Encode(result);
}

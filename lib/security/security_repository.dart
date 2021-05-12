import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'cryptography_utils.dart';
import 'model/cryptography_result.dart';

class SecurityRepository {
  final String _coreEncryptionStorageKey = 'coreEncryptionStorageKey';
  final FlutterSecureStorage _secureStorage;

  SecurityRepository(this._secureStorage);

  Future<void> saveCoreEncryptionKey(String key) async {
    return _secureStorage.write(key: _coreEncryptionStorageKey, value: key);
  }

  Future<CryptographyResult> encryptSensitiveData(String data) async {
    final cryptographyKey = await _secureStorage.read(key: _coreEncryptionStorageKey);

    return encryptAesGcm(data, cryptographyKey!);
  }

  Future<String> decryptSensitiveData(String data, String nonce, String mac) async {
    final cryptographyKey = await _secureStorage.read(key: _coreEncryptionStorageKey);

    return decryptAesGcm(data, cryptographyKey!, nonce, mac);
  }
}

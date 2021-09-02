import 'package:flutter/foundation.dart';

enum Environment { DEV, PROD, HML }

class EnvironmentConfig {
  final Environment? environment;
  final String baseUrl;

  static EnvironmentConfig? _instance;

  factory EnvironmentConfig({Environment? environment, String baseUrl = ''}) {
    return _instance ??= EnvironmentConfig._internal(environment, baseUrl);
  }

  EnvironmentConfig._internal(this.environment, this.baseUrl);

  @visibleForTesting
  // ignore: unnecessary_getters_setters
  static set instance(EnvironmentConfig? environmentConfig) => _instance = environmentConfig;

  // ignore: unnecessary_getters_setters
  static EnvironmentConfig? get instance => _instance;

  static bool isProd() => _instance?.environment == Environment.PROD;

  static bool isDev() => _instance?.environment == Environment.DEV;

  static bool isHml() => _instance?.environment == Environment.HML;
}

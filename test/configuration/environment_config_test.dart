import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/configuration/environment_config.dart';

void main() {
  group('EnvironmentConfig tests', () {
    test('singleton instance is truly singleton', () {
      final config = EnvironmentConfig(environment: Environment.PROD, baseUrl: 'baseURL');

      expect(EnvironmentConfig().environment, config.environment);
      expect(EnvironmentConfig().baseUrl, config.baseUrl);
    });

    test('true isProd correctly returns value', () {
      EnvironmentConfig.instance = null;
      EnvironmentConfig.instance = EnvironmentConfig(environment: Environment.PROD, baseUrl: 'baseURL');
      expect(EnvironmentConfig.isProd(), true);
    });

    test('false isProd correctly returns value', () {
      EnvironmentConfig.instance = null;
      EnvironmentConfig.instance = EnvironmentConfig(environment: Environment.DEV, baseUrl: 'baseURL');

      expect(EnvironmentConfig.isProd(), false);
    });

    test('true isDev correctly returns value', () {
      EnvironmentConfig.instance = null;
      EnvironmentConfig.instance = EnvironmentConfig(environment: Environment.DEV, baseUrl: 'baseURL');

      expect(EnvironmentConfig.isDev(), true);
    });

    test('false isDev correctly returns value', () {
      EnvironmentConfig.instance = null;
      EnvironmentConfig.instance = EnvironmentConfig(environment: Environment.PROD, baseUrl: 'baseURL');

      expect(EnvironmentConfig.isDev(), false);
    });
  });
}

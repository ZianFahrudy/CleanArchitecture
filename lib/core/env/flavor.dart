import 'package:fl_clean_arch/core/env/env_config.dart';

/// * This file is configuration to make separate between environment
/// see details about [flutter flavor]
class FlavorSettings {
  FlavorSettings.development() {
    EnvConfig.getInstance(
      flavorName: 'development',
      apiBaseUrl: 'http://restapi.adequateshop.com',
    );
  }

  FlavorSettings.staging() {
    EnvConfig.getInstance(
      flavorName: 'staging',
      apiSentry: 'yuhuuuu',
      apiBaseUrl: 'http://restapi.adequateshop.com',
    );
  }

  FlavorSettings.production() {
    EnvConfig.getInstance(
      flavorName: 'production',
      apiBaseUrl: 'http://restapi.adequateshop.com',
    );
  }
}

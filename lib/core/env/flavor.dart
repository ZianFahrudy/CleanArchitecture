import 'package:fl_clean_arch/core/env/env_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// * This file is configuration to make separate between environment
/// see details about [flutter flavor]
class FlavorSettings {
  FlavorSettings.development() {
    EnvConfig.getInstance(
      flavorName: 'development',
      apiBaseUrl: dotenv.env['BASE_URL'].toString(),
    );
  }

  FlavorSettings.staging() {
    EnvConfig.getInstance(
      flavorName: 'staging',
      apiSentry: 'yuhuuuu',
      apiBaseUrl: dotenv.env['BASE_URL'].toString(),
    );
  }

  FlavorSettings.production() {
    EnvConfig.getInstance(
      flavorName: 'production',
      apiBaseUrl: dotenv.env['BASE_URL'].toString(),
    );
  }
}

// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:developer';

import 'package:fl_clean_arch/app/app.dart';
import 'package:fl_clean_arch/bootstrap.dart';
import 'package:fl_clean_arch/core/env/env_config.dart';
import 'package:fl_clean_arch/core/env/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorSettings.staging();

  bootstrap(() => const App());

  ///[console] flavor running
  if (!kReleaseMode) {
    final settings = EnvConfig.getInstance();
    log('🚀 APP FLAVOR NAME      : ${settings.flavorName}', name: 'ENV');
    log('🚀 APP API_BASE_URL     : ${settings.apiBaseUrl}', name: 'ENV');
    log('🚀 APP API_SENTRY       : ${settings.apiSentry}', name: 'ENV');
  }
}

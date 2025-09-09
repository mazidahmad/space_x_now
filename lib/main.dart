import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/di/service_locator.dart';
import 'flavors.dart';

Future<void> main() async => runZonedGuarded(
      () async {
        F.appFlavor = Flavor.values.firstWhere(
          (element) => element.name == appFlavor,
        );

        configureDependencies();

        runApp(App());
      },
      (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
      },
    );

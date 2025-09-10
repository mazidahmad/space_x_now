import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_x_now_core/core.dart';

import 'app.dart';
import 'flavors.dart';

Future<void> main() async => runZonedGuarded(
      () async {
        F.appFlavor = Flavor.values.firstWhere(
          (element) => element.name == appFlavor,
        );

        WidgetsFlutterBinding.ensureInitialized();
        await Hive.initFlutter();

        configureDependencies();

        runApp(App());
      },
      (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
      },
    );

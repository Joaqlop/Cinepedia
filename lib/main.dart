import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinepedia/config/router/app_router.dart';
import 'package:cinepedia/config/theme/app_theme.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:intl/intl.dart';

Future<void> main() async {
  Intl.defaultLocale = 'es_ES';
  initializeDateFormatting('es_ES', null);
  await dotenv.load(fileName: '.env');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}

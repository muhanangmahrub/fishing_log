import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class FishingLogApp extends StatelessWidget {
  const FishingLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fishing Log',
      theme: buildTheme(),
      routerConfig: appRouter,
    );
  }
}

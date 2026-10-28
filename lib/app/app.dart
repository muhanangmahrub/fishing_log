import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router.dart';
import 'theme.dart';

class FishingLogApp extends ConsumerWidget {
  const FishingLogApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Fishing Log',
      theme: buildTheme(),
      routerConfig: ref.watch(routerProvider),
    );
  }
}

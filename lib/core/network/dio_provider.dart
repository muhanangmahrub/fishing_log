import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_identity.dart';

const networkTimeout = Duration(seconds: 10);

/// Dio bersama dengan timeout 10 detik (SPEC §5).
final dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(
      connectTimeout: networkTimeout,
      sendTimeout: networkTimeout,
      receiveTimeout: networkTimeout,
      headers: {'User-Agent': appUserAgent},
    ),
  ),
);

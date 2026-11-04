import 'package:dio/dio.dart';
import 'package:fishing_log/core/network/app_identity.dart';
import 'package:fishing_log/core/network/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'dioProvider mengirim User-Agent aplikasi pada setiap request',
    () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final dio = container.read(dioProvider);

      RequestOptions? captured;
      dio.httpClientAdapter = _CapturingAdapter((o) => captured = o);
      await dio.get<Object?>('https://example.test/ping');

      expect(appUserAgent, 'fishing_log.personal');
      expect(captured, isNotNull);
      expect(captured!.headers['User-Agent'], appUserAgent);
    },
  );
}

class _CapturingAdapter implements HttpClientAdapter {
  _CapturingAdapter(this.onFetch);

  final void Function(RequestOptions) onFetch;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    onFetch(options);
    return ResponseBody.fromString('{}', 200);
  }

  @override
  void close({bool force = false}) {}
}

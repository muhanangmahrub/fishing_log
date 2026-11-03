import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/formatters.dart';
import '../data/weather_repository.dart';
import '../domain/weather_code.dart';
import '../domain/weather_snapshot.dart';

/// Kartu cuaca di detail sesi + tombol ambil/refresh.
class WeatherCard extends ConsumerStatefulWidget {
  const WeatherCard({super.key, required this.sessionId, this.weather});

  final String sessionId;
  final WeatherSnapshot? weather;

  @override
  ConsumerState<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends ConsumerState<WeatherCard> {
  bool _loading = false;

  Future<void> _fetch() async {
    setState(() => _loading = true);
    final ok = await ref
        .read(weatherRepositoryProvider)
        .refresh(widget.sessionId);
    if (!mounted) return;
    setState(() => _loading = false);
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal mengambil cuaca. Coba lagi.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.weather;
    final button = FilledButton.tonalIcon(
      onPressed: _loading ? null : _fetch,
      icon: _loading
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.refresh),
      label: Text(w == null ? 'Ambil cuaca' : 'Refresh cuaca'),
    );

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: w == null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cuaca', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  const Text('Belum ada data cuaca.'),
                  const SizedBox(height: 8),
                  button,
                ],
              )
            : _Content(weather: w, button: button),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.weather, required this.button});

  final WeatherSnapshot weather;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    final w = weather;
    final c = describeWeatherCode(w.weatherCode);
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(c.icon, size: 40),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${w.temperatureC.round()}°C · ${c.label}',
                    style: theme.textTheme.titleMedium,
                  ),
                  Text('Terasa ${w.apparentTempC.round()}°C'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 4,
          children: [
            Text('Kelembapan ${w.humidity.round()}%'),
            Text('Tekanan ${w.pressureHpa.round()} hPa'),
            Text(
              'Angin ${w.windSpeedKmh.round()} km/j '
              '${_compass(w.windDirectionDeg)}',
            ),
            Text('Awan ${w.cloudCover.round()}%'),
            Text('Hujan ${w.precipitationMm} mm'),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Diambil ${formatDateTime(w.fetchedAt)}',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        button,
      ],
    );
  }
}

String _compass(double deg) {
  const dirs = ['U', 'TL', 'T', 'TG', 'S', 'BD', 'B', 'BL'];
  return dirs[((deg % 360) / 45).round() % 8];
}

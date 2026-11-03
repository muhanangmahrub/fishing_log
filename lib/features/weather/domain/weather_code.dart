import 'package:flutter/material.dart';

class WeatherCondition {
  const WeatherCondition(this.label, this.icon);

  final String label;
  final IconData icon;
}

/// Kode cuaca WMO (Open-Meteo) → label Indonesia + ikon.
WeatherCondition describeWeatherCode(int code) => switch (code) {
  0 => const WeatherCondition('Cerah', Icons.wb_sunny),
  1 => const WeatherCondition('Cerah berawan', Icons.wb_sunny_outlined),
  2 => const WeatherCondition('Berawan sebagian', Icons.wb_cloudy_outlined),
  3 => const WeatherCondition('Mendung', Icons.cloud),
  45 || 48 => const WeatherCondition('Berkabut', Icons.foggy),
  51 || 53 || 55 => const WeatherCondition('Gerimis', Icons.grain),
  56 || 57 => const WeatherCondition('Gerimis beku', Icons.grain),
  61 => const WeatherCondition('Hujan ringan', Icons.water_drop_outlined),
  63 => const WeatherCondition('Hujan sedang', Icons.water_drop),
  65 => const WeatherCondition('Hujan lebat', Icons.water_drop),
  66 || 67 => const WeatherCondition('Hujan beku', Icons.ac_unit),
  71 ||
  73 ||
  75 ||
  77 ||
  85 ||
  86 => const WeatherCondition('Salju', Icons.ac_unit),
  80 || 81 || 82 => const WeatherCondition('Hujan deras', Icons.umbrella),
  95 => const WeatherCondition('Badai petir', Icons.thunderstorm),
  96 ||
  99 => const WeatherCondition('Badai petir disertai es', Icons.thunderstorm),
  _ => const WeatherCondition('Tidak diketahui', Icons.help_outline),
};

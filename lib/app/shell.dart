import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Kerangka dengan bottom navigation untuk empat tab utama.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        // Ketuk tab yang sedang aktif → kembali ke halaman awal tab itu.
        onDestinationSelected: (i) => navigationShell.goBranch(
          i,
          initialLocation: i == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.history), label: 'Riwayat'),
          NavigationDestination(icon: Icon(Icons.map_outlined), label: 'Peta'),
          NavigationDestination(
            icon: Icon(Icons.place_outlined),
            label: 'Spot',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: 'Statistik',
          ),
        ],
      ),
    );
  }
}

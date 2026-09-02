import 'package:flutter/material.dart';
import 'data_kelompok_page.dart';
import 'kalkulator_page.dart';
import 'ganjil_genap_page.dart';
import 'total_angka_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DataKelompokPage(),
    KalkulatorPage(),
    GanjilGenapPage(),
    TotalAngkaPage(),
  ];

  final List<String> _titles = const [
    'Data Kelompok',
    'Operasi Matematika',
    'Cek Ganjil / Genap',
    'Hitung Total Digit',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.group),
            label: 'Kelompok',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          NavigationDestination(
            icon: Icon(Icons.exposure),
            label: 'Ganjil/Genap',
          ),
          NavigationDestination(
            icon: Icon(Icons.pin),
            label: 'Total Angka',
          ),
        ],
      ),
    );
  }
}

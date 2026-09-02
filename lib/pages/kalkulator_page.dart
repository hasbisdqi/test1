import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final _angka1Controller = TextEditingController();
  final _angka2Controller = TextEditingController();
  String _hasil = '-';

  void _hitung(String operasi) {
    final a = double.tryParse(_angka1Controller.text);
    final b = double.tryParse(_angka2Controller.text);

    if (a == null || b == null) {
      setState(() {
        _hasil = 'Masukkan angka yang valid';
      });
      return;
    }

    double res = 0;
    if (operasi == '+') {
      res = a + b;
    } else if (operasi == '-') {
      res = a - b;
    } else if (operasi == 'x') {
      res = a * b;
    } else if (operasi == '/') {
      if (b == 0) {
        setState(() {
          _hasil = 'Tidak bisa dibagi 0';
        });
        return;
      }
      res = a / b;
    }

    setState(() {
      _hasil = res % 1 == 0 ? res.toInt().toString() : res.toString();
    });
  }

  @override
  void dispose() {
    _angka1Controller.dispose();
    _angka2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _angka1Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Angka Pertama',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _angka2Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Angka Kedua',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: [
              ElevatedButton(
                onPressed: () => _hitung('+'),
                child: const Text('Tambah (+)'),
              ),
              ElevatedButton(
                onPressed: () => _hitung('-'),
                child: const Text('Kurang (-)'),
              ),
              ElevatedButton(
                onPressed: () => _hitung('x'),
                child: const Text('Kali (x)'),
              ),
              ElevatedButton(
                onPressed: () => _hitung('/'),
                child: const Text('Bagi (/)'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Hasil: $_hasil',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

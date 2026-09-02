import 'package:flutter/material.dart';

class TotalAngkaPage extends StatefulWidget {
  const TotalAngkaPage({super.key});

  @override
  State<TotalAngkaPage> createState() => _TotalAngkaPageState();
}

class _TotalAngkaPageState extends State<TotalAngkaPage> {
  final _inputController = TextEditingController();
  String _banyakDigit = '-';
  String _totalPenjumlahan = '-';

  void _hitungTotal() {
    final text = _inputController.text;
    final digits = text.replaceAll(RegExp(r'[^0-9]'), '');

    if (digits.isEmpty) {
      setState(() {
        _banyakDigit = '0';
        _totalPenjumlahan = '0';
      });
      return;
    }

    int sum = 0;
    for (int i = 0; i < digits.length; i++) {
      sum += int.parse(digits[i]);
    }

    setState(() {
      _banyakDigit = '${digits.length} digit';
      _totalPenjumlahan = '$sum (Penjumlahan digit: ${digits.split('').join(' + ')})';
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _inputController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Input Deret / Data Angka',
              border: OutlineInputBorder(),
              hintText: 'Contoh: 12345',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _hitungTotal,
            child: const Text('Hitung Total Angka'),
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Banyak Karakter Angka: $_banyakDigit',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Jumlah Total: $_totalPenjumlahan',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GanjilGenapPage extends StatefulWidget {
  const GanjilGenapPage({super.key});

  @override
  State<GanjilGenapPage> createState() => _GanjilGenapPageState();
}

class _GanjilGenapPageState extends State<GanjilGenapPage> {
  final _inputController = TextEditingController();
  String _hasil = '-';

  void _cek() {
    final n = int.tryParse(_inputController.text.trim());
    if (n == null) {
      setState(() {
        _hasil = 'Masukkan bilangan bulat valid';
      });
      return;
    }

    setState(() {
      _hasil = (n % 2 == 0) ? '$n adalah Bilangan GENAP' : '$n adalah Bilangan GANJIL';
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
              labelText: 'Input Bilangan',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _cek,
            child: const Text('Cek Ganjil / Genap'),
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

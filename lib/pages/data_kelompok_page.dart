import 'package:flutter/material.dart';

class DataKelompokPage extends StatelessWidget {
  const DataKelompokPage({super.key});

  final List<Map<String, String>> members = const [
    {'nama': 'Muhammad Hasbi Assidiqi', 'nim': '124240135'},
    {'nama': 'Muhammad Ridho Nadika', 'nim': '124240137'},
    {'nama': 'Muhammad Ghaffari', 'nim': '124240090'},
    {'nama': 'Laksana Bagus S. A. J.', 'nim': '124240188'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: members.length,
      itemBuilder: (context, index) {
        final member = members[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              child: Text('${index + 1}'),
            ),
            title: Text(
              member['nama']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('NIM: ${member['nim']}'),
          ),
        );
      },
    );
  }
}

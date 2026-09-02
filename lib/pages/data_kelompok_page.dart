import 'package:flutter/material.dart';

class DataKelompokPage extends StatelessWidget {
  const DataKelompokPage({super.key});

  final List<Map<String, String>> members = const [
    {'nama': 'Anggota 1', 'nim': '123200001'},
    {'nama': 'Anggota 2', 'nim': '123200002'},
    {'nama': 'Anggota 3', 'nim': '123200003'},
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

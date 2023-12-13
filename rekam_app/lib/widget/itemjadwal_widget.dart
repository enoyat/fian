// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import '../models/jadwal.dart';
import '../screen/ajuan.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.jadwal,
  }) : super(key: key);
  final Jadwal jadwal;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 7, 117, 22),
      child: Column(
        children: [
          ListTile(
            autofocus: true,
            leading: const Icon(
              Icons.cabin,
              color: Colors.white,
            ),
            title: Text("${jadwal.tanggal} ${jadwal.jam} wib",
                style: const TextStyle(color: Colors.white)),
            subtitle: Text(jadwal.namadokter,
                style: const TextStyle(color: Colors.white)),
            trailing: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AjuanPage(jadwal: jadwal);
                  },
                ));
              },
              child: const Text('Daftar',
                  style: TextStyle(color: Color.fromARGB(255, 237, 253, 5))),
            ),
          ),
        ],
      ),
    );
  }
}

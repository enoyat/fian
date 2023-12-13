// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:administrasi_app/models/pendaftaramodel.dart';
import 'package:flutter/material.dart';

class ItemDaftarWidget extends StatelessWidget {
  const ItemDaftarWidget({
    Key? key,
    required this.pendaftaranmodel,
  }) : super(key: key);
  final PendaftaranModel pendaftaranmodel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 233, 7, 120),
      child: Column(
        children: [
          ListTile(
            autofocus: true,
            leading: const Icon(
              Icons.history,
              color: Colors.white,
            ),
            title: Text(
                "${pendaftaranmodel.tanggal} ${pendaftaranmodel.jam} wib",
                style: const TextStyle(color: Colors.white)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pendaftaranmodel.namadokter,
                    style: const TextStyle(color: Colors.white)),
                const SizedBox(
                  width: 10,
                ),
                Text('No. Antrian: ${pendaftaranmodel.noantrian}',
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
            trailing: TextButton(
              onPressed: () {},
              child: const Icon(Icons.add_reaction),
            ),
          ),
        ],
      ),
    );
  }
}

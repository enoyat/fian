// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/rekam.dart';

class ItemDoneWidget extends StatelessWidget {
  const ItemDoneWidget({
    Key? key,
    required this.rekam,
    required this.handleRefresh,
  }) : super(key: key);
  final Rekam rekam;
  final Function handleRefresh;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 245, 237, 212),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(rekam.tanggal),
                  Text(rekam.namadokter),
                  Text('Subject: ${rekam.subject}'),
                  Text('Object: ${rekam.object}'),
                  Text('assasment: ${rekam.assasment}'),
                  Text('plan: ${rekam.plan}'),
                  Text('resep: ${rekam.resep}'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(rekam.status,
                      style: const TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

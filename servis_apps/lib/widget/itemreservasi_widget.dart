// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/reservasimodel.dart';

class ItemReservasiWidget extends StatelessWidget {
  const ItemReservasiWidget({
    Key? key,
    required this.reservasi,
    required this.handleRefresh,
  }) : super(key: key);
  final ReservasiModel reservasi;
  final Function handleRefresh;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reservasi.idreservasi.toString()),
                const SizedBox(
                  height: 5,
                ),
                Text(reservasi.idmekanik.toString()), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}

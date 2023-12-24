// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/reservasigetmodel.dart';

class ItemReservasiWidget extends StatelessWidget {
  const ItemReservasiWidget({
    Key? key,
    required this.reservasi,
    required this.handleRefresh,
  }) : super(key: key);
  final ReservasigetModel reservasi;
  final Function handleRefresh;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('No. Reservasi = ${reservasi.idreservasi}'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('No. Mekanik = ${reservasi.idmekanik}'), 
                  const SizedBox(
                    height: 5,
                  ),
                   Text('No. Polisi = ${reservasi.nopolisi}'), 
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Tanggal Reservasi = ${reservasi.tglreservasi}'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Waktu Reservasi = ${reservasi.jam}'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Status Reservasi = ${reservasi.statusreservasi}'),
                  const SizedBox(
                    height: 5,
                  ),
                  Image.network(
                    'http://192.168.10.254:8000/assets/img/${reservasi.gambar}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

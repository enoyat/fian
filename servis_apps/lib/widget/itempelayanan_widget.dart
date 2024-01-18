// ignore_for_file: public_member_api_docs
// ignore_for_file: public_ItemPelayananWidgetmember_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/Pelayanangetmodel.dart';

class ItemPelayananWidget extends StatelessWidget {
  const ItemPelayananWidget({
    Key? key,
    required this.pelayanan,
    required this.handleRefresh,
  }) : super(key: key);
  final PelayanangetModel pelayanan;
  final Function handleRefresh;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          Text(
            'No. Pelayanan = ${pelayanan.idpelayanan}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'No. Reservasi = ${pelayanan.nopolisi}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
      ],

    );
 
  }
}

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
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(pelayanan.idpelayanan.toString()),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(pelayanan.nopolisi.toString()),
                                        const SizedBox(
                      width: 5,
                    ),
                    Text(pelayanan.statuspelayanan.toString()),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/history.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.history,
    required this.handleRefresh,
  }) : super(key: key);
  final History history;
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
                Text(history.namadokumen!),
                const SizedBox(
                  height: 5,
                ),
                Text(history.status,
                    style: const TextStyle(
                      color: Colors.red,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

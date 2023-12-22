// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/motormodel.dart';


class ItemMotorWidget extends StatelessWidget {
  const ItemMotorWidget({
    Key? key,
    required this.motor,
    required this.handleRefresh,
  }) : super(key: key);
  final Motor motor;
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
                Text(motor.nopolisi.toString()),
                const SizedBox(
                  height: 5,
                ),
                Text(motor.jenismerk.toString()), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../models/rekam.dart';
import '../utils/network_manager.dart';
import '../widget/itemdoneajuan_widget.dart';

class HistoryDonePage extends StatefulWidget {
  const HistoryDonePage({
    Key? key,
    required this.userid,
  }) : super(key: key);
  final int userid;

  @override
  State<HistoryDonePage> createState() => _HistoryDonePageState();
}

class _HistoryDonePageState extends State<HistoryDonePage> {
  List<Rekam> historydone = [];
  bool isLoading = false;
  int historydoneCount = 0;
  int userid = 0;

  void refreshData() async {
    setState(() {
      isLoading = true;
    });
    await NetworkManager().listrekam(widget.userid).then((value) {
      setState(() {
        historydone = value;
        historydoneCount = historydone.length;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    userid = widget.userid;

    refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History Rekam Medis',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                refreshData();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daftar Rekam Medis',
                style: textTheme.bodyText1,
              ),
            ],
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: historydone.isEmpty
                      ? const Center(
                          child: Text('Tidak ada item'),
                        )
                      : ListView.builder(
                          itemCount: historydone.length,
                          itemBuilder: (context, index) {
                            return ItemDoneWidget(
                              rekam: historydone[index],
                              handleRefresh: refreshData,
                            );
                          }),
                ),
        ]),
      ),
    );
  }
}

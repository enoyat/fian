// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:servis_apps/models/pendaftaran.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:servis_apps/screen/home_page.dart';

import '../models/dokumen.dart';
import '../models/jadwal.dart';
import '../models/transaction.dart';
import '../utils/network_manager.dart';

class AjuanPage extends StatefulWidget {
  const AjuanPage({
    Key? key,
    required this.jadwal,
  }) : super(key: key);
  final Jadwal jadwal;

  @override
  State<AjuanPage> createState() => _AjuanPageState();
}

class _AjuanPageState extends State<AjuanPage> {
  bool isLoading = false;
  bool isCheck = true;
  int userid = 0;

  void _setter() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userid = prefs.getInt('userid')!;
      isLoading = false;
    });
  }

  @override
  void initState() {
    _setter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 20),
          isLoading
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    const SizedBox(height: 20),
                    Text('ID Pasien : $userid'),
                    const SizedBox(height: 20),
                    Text('Kode Jadwal  : ${widget.jadwal.id!}',
                        style: const TextStyle(fontSize: 20)),
                    Text('Tanggal Periksa : ${widget.jadwal.tanggal}',
                        style: const TextStyle(fontSize: 20)),
                    Text('Jam Periksa : ${widget.jadwal.jam}',
                        style: const TextStyle(fontSize: 20)),
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Nama Dokter : ${widget.jadwal.namadokter}'),
                            const SizedBox(height: 20),
                            CheckboxListTile(
                              title: const Text(
                                  'Saya menyatakan data diatas benar'),
                              value: isCheck,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheck = value!;
                                });
                              },
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Pendaftaran item = Pendaftaran(
                                      idjadwal: widget.jadwal.id!,
                                      idpasien: userid,
                                      mediadaftar: "online",
                                      status: "aktif");
                                  NetworkManager().postTransaction(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Pendaftaran berhasil')));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                },
                                child: const Text('Daftar')),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ]),
      ),
    );
  }
}

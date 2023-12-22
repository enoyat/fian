// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:servis_apps/models/reservasimodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:servis_apps/screen/home_page.dart';

import '../utils/network_manager.dart';

class ReservasiPage extends StatefulWidget {
  const ReservasiPage({
    Key? key,
    required this.rerservasi,
  }) : super(key: key);
  final ReservasiModel rerservasi;

  @override
  State<ReservasiPage> createState() => _ReservasiPageState();
}

class _ReservasiPageState extends State<ReservasiPage> {
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
        title: const Text('Reservasi'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 20),
          isLoading
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    const SizedBox(height: 20),
                    Text('ID : $userid'),
                    const SizedBox(height: 20),                    
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('No Pelayanan : ${widget.jadwal.namadokter}'),
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

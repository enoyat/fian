import 'package:servis_apps/models/jenismerk_model.dart';
import 'package:servis_apps/models/merkmodel.dart';
import 'package:flutter/material.dart';
import 'package:servis_apps/utils/merk_dio.dart';


class JenisMerkAdminPage extends StatefulWidget {
  const JenisMerkAdminPage({super.key});

  @override
  State<JenisMerkAdminPage> createState() => _JenisMerkAdminPageState();
}

class _JenisMerkAdminPageState extends State<JenisMerkAdminPage> {
  

  final _formKey = GlobalKey<FormState>();
  final keterangan = TextEditingController();
   final gambar = TextEditingController();
   List<Merkmodel> xlistmerk = [];
     int idmerk = 0;
  bool isLoading = false;

  void refreshdata() {
    setState(() {
      isLoading = true;
    });
    MerkDio().listmerk().then((value) {
      setState(() {
        xlistmerk = value;       
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    refreshdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text('Jenis Merk', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: xlistmerk.isEmpty
                    ? const SizedBox()
                    : DropdownButtonFormField(
                        hint: const Text('Pilih Merk'),
                        onChanged: (value) {
                          setState(() {
                            idmerk = value as int;
                     
                          });
                          
                        },
                        items: xlistmerk
                            .map((e) => DropdownMenuItem(
                                  value: e.idmerk,
                                  child: Text(e.jenismerk),
                                ))
                            .toList(),
                      ),
              ),
               const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: keterangan,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Keterangan',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Keterangan';
                    }
                    return null;
                  },
                ),
              ),
             
              const SizedBox(height: 20),
               Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: gambar,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Gambar',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Gambar';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
             
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        
                        final Jenismerkmodel item = Jenismerkmodel(
                            idmerk: idmerk,                            
                            keterangan: keterangan.text,
                            gambar: 'icon.png'
                            );
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')));

                          await MerkDio().postjenismerk(item).then((value) {
                            value["status"] == false
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Failed, cek kembali data anda')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Success')));
                                        
                            Future.delayed(
                                const Duration(seconds: 1)
                                // ignore: avoid_types_on_closure_parameters
                                , () {
                              Navigator.pop(context);

                            });
                          });
                        }
                      },
                      child: const Text('Simpan'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Batal'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

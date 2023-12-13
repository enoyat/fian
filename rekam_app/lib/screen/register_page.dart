import 'package:administrasi_app/utils/customer_dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/register.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> listidentitas = [
      const DropdownMenuItem(value: "1", child: Text("BPJS")),
      const DropdownMenuItem(value: "2", child: Text("KTP")),
      const DropdownMenuItem(value: "3", child: Text("SIM")),
    ];
    return listidentitas;
  }

  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final birthday = TextEditingController();
  final tempat = TextEditingController();
  final pekerjaan = TextEditingController();
  final status = TextEditingController();
  final nokartu = TextEditingController();
  final nohp = TextEditingController();
  final kelurahan = TextEditingController();
  late DateTime selectedDate = DateTime.now();
  String agama = 'Islam';
  String statuskeluarga = 'Menikah';
  String _identitas = '1';
  final agamalist = <String>[
    'Islam',
    'Kristen',
    'Katolik',
    'Budha',
    'Hindu',
    'Kepercayaan',
  ];
  final statuskeluargalist = <String>[
    'Menikah',
    'Belum Menikah',
  ];
  String gender = "";
  final password = TextEditingController();
  bool isLoading = false;

  void refreshdata() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshdata();
  }

  void _selectedDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2050),
    );
    if (date != null && date != selectedDate) {
      setState(() {
        selectedDate = date;
        birthday.text =
            '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
      });
    }
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
                child: Text('Register', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: username,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    const Text('Male'),
                    Radio(
                        value: "male",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        }),
                    const SizedBox(height: 10),
                    const Text('Female'),
                    Radio(
                        value: "female",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        }),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: address,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'alamat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'alamat';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: birthday,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Birthday'),
                  onTap: () {
                    _selectedDate(context);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Birthday';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: tempat,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'tempat lahir'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'tempat';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text('Agama'),
              DropdownButton(
                value: agama,
                items: agamalist
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (String? val) {
                  setState(() {
                    if (val != null) {
                      agama = val;
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: pekerjaan,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Pekerjaan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pekerjaan';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text('Identitas'),
              DropdownButton(
                value: _identitas,
                items: dropdownItems,
                onChanged: (String? val) {
                  setState(() {
                    if (val != null) {
                      _identitas = val;
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: nokartu,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'No Kartu'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'no kartu';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: nohp,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'nohp'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'nohp';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: kelurahan,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'kelurahan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kelurahan';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text('Status Keluarga'),
              DropdownButton(
                value: statuskeluarga,
                items: statuskeluargalist
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (String? val) {
                  setState(() {
                    if (val != null) {
                      statuskeluarga = val;
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
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
                        DateFormat dateFormat = DateFormat("yyyy-MM-dd");
                        final RegisterModel item = RegisterModel(
                            password: password.text,
                            birthday: dateFormat.format(selectedDate),
                            tempat: tempat.text,
                            agama: agama,
                            pekerjaan: pekerjaan.text,
                            status: status.text,
                            kelurahan: kelurahan.text,
                            idkartu: _identitas,
                            nokartu: nokartu.text,
                            statuskeluarga: statuskeluarga,
                            name: username.text,
                            gender: gender.toString(),
                            address: address.text,
                            email: email.text,
                            nohp: nohp.text);
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')));

                          await CustomerDio().register(item).then((value) {
                            value["status"] == false
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Register Failed, cek kembali data anda')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Register Success')));
                            Future.delayed(
                                const Duration(seconds: 5)
                                // ignore: avoid_types_on_closure_parameters
                                , () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const LoginPage(),
                                ),
                                (route) => false,
                              );
                            });
                          });
                        }
                      },
                      child: const Text('Daftar'),
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

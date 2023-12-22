import 'package:flutter/material.dart';
import 'package:servis_apps/screen/register_motor.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/jadwal.dart';
import '../models/pendaftaramodel.dart';
import '../utils/network_manager.dart';
import 'listajuandone_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;
  int iddokumen = 0;
  bool isLoading = false;
  String? username = "";
  String? email = "";
  int? userid = 0;

  List<Jadwal> jadwal = [];
  List<PendaftaranModel> pendaftaranmodel = [];

  void _ontap(int index) async {
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HistoryDonePage(
          userid: userid!,
        );
      }));
    } else if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HistoryDonePage(
          userid: userid!,
        );
      }));
    } else if (index == 3) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LoginPage();
      }));
    }
    setState(() {
      selectedindex = index;
    });
  }

  void refresh() async {
    await NetworkManager().jadwal().then((value) {
      setState(() {
        jadwal = value;
      });
    });
    await NetworkManager().listpendaftaran(userid!).then((value) {
      setState(() {
        pendaftaranmodel = value;
      });
    });
  }

  void _setter() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 2));
    setState(() {
      userid = prefs.getInt('userid');
      username = prefs.getString('username');
      email = prefs.getString('email');

      isLoading = false;
    });
  }

  @override
  void initState() {
    _setter();
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: MenuBar(
                    children: <Widget>[
                      SubmenuButton(
                        menuChildren: <Widget>[
                          MenuItemButton(
                            onPressed: () {
                              showAboutDialog(
                                context: context,
                                applicationName: 'MenuBar Sample',
                                applicationVersion: '1.0.0',
                              );
                            },
                            child: const MenuAcceleratorLabel('&Motor'),
                          ),
                          MenuItemButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const RegisterMotor();
                                },
                              ));
                            },
                            child:
                                const MenuAcceleratorLabel('&Registrasi Motor'),
                          ),
                        ],
                        child: const MenuAcceleratorLabel('&Motor'),
                      ),
                      SubmenuButton(
                        menuChildren: <Widget>[
                          MenuItemButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Magnify!'),
                                ),
                              );
                            },
                            child: const MenuAcceleratorLabel('&Reservasi'),
                          ),
                          MenuItemButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Minify!'),
                                ),
                              );
                            },
                            child:
                                const MenuAcceleratorLabel('&History Layanan'),
                          ),
                        ],
                        child: const MenuAcceleratorLabel('&Layanan'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 120,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                color: const Color.fromARGB(255, 3, 68, 17),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Member Dashboard',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 196, 190, 190),
                        )),
                    const SizedBox(height: 5),
                    const Text('Bengkel Oka Motor',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 196, 190, 190),
                        ),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 5),
                    isLoading
                        ? const CircularProgressIndicator()
                        : Text("ID :$userid - ${username!}",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 196, 190, 190),
                            ),
                            textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 4, 163, 226),
        iconSize: 20,
        currentIndex: selectedindex,
        onTap: _ontap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Reservasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}

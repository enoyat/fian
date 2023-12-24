import 'package:flutter/material.dart';
import 'package:servis_apps/screen/admin/listjenismerk.dart';
import 'package:servis_apps/screen/admin/listmerk.dart';
import 'package:servis_apps/screen/admin/listreservasi.dart';
import 'package:servis_apps/screen/admin/pelayanan.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int selectedindex = 0;
  int iddokumen = 0;
  bool isLoading = false;
  String? username = "";
  String? email = "";
  int? userid = 0;

  void _ontap(int index) async {
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const AdminPage();
      }));
    } else if (index == 1) {
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ListMerkAdminPage();
                              }));                            
                            },
                            child: const MenuAcceleratorLabel('&Merk Motor'),
                          ),
                          MenuItemButton(
                            onPressed: () {
                               Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ListJenisMerkAdminPage();
                              })); 
                             
                            },
                            child:
                                const MenuAcceleratorLabel('&Jenis Merk Motor'),
                          ),
                        ],
                        child: const MenuAcceleratorLabel('&Master'),
                      ),
                      SubmenuButton(
                        menuChildren: <Widget>[
                          MenuItemButton(
                            onPressed: () {
                               Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ListPelayananAdminPage();
                              })); 
                            },
                            child: const MenuAcceleratorLabel('&Pelayanan'),
                          ),
                          MenuItemButton(
                            onPressed: () {
                               Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ListReservasiAdminPage();
                              })); 
                            },
                            child:
                                const MenuAcceleratorLabel('&Reservasi Motor'),
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
                    const Text('Admin Dashboard',
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
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}

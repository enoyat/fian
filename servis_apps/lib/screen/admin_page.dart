import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/jadwal.dart';
import '../models/pendaftaramodel.dart';
import '../utils/network_manager.dart';
import 'listajuandone_page.dart';
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
  String? username="";
  String? email="";
  int? userid = 0;

  List<Jadwal> jadwal = [];
  List<PendaftaranModel> pendaftaranmodel = [];

  void _ontap(int index) async {
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const AdminPage();
      }));
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HistoryDonePage(
          userid: userid!,
        );
      }));
    } else if (index == 2) {
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
    Future.delayed( const Duration(seconds: 2));
    setState(() {
      userid = prefs.getInt('userid');
      username = prefs.getString('username');
      email = prefs.getString('email');
      
      isLoading= false;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 120,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                color: const Color.fromARGB(255, 99, 5, 13),
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
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Menu Dashboard'),
              ],
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
            label: 'Rekam Medis',
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

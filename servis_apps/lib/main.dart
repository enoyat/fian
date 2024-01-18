import 'package:servis_apps/screen/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bengkel Oka Motor App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Nunito',
        textTheme:Theme.of(context).textTheme.apply(
          fontSizeFactor: 0.7,
          fontSizeDelta: 1.0,
        ),
      ),
      
      home: const LoginPage(),
    );
  }
}

import 'package:administrasi_app/screen/lupapassword.dart';
import 'package:administrasi_app/screen/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/network_manager.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _isLogin = true;
  var email = '';
  var password = '';
  var username = '';
  late int? userid = 0;
  bool status = false;

  _setter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('username', username);
    await prefs.setString('email', email);
    await prefs.setInt('userid', userid!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(255, 7, 55, 95),
      padding: const EdgeInsets.all(30),
      child: Center(
          child: Card(
              child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  key: const ValueKey('email'),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email address'),
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                TextFormField(
                  key: const ValueKey('password'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'Password must be at least 7 characters long.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    final isValid = _formKey.currentState!.validate();
                    FocusScope.of(context).unfocus();

                    if (isValid) {
                      _formKey.currentState!.save();
                      await NetworkManager()
                          .login(email, password)
                          .then((value) => {
                                if (value["status"] == true)
                                  {
                                    setState(() {
                                      username = value["username"];
                                      email = value["email"];
                                      status = value["status"];
                                      userid = value["userid"];
                                      _setter();
                                    }),
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const HomePage();
                                      },
                                    ))
                                  }
                                else
                                  {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Informasi'),
                                            content: const Text(
                                                'Login Gagal, username atau password salah'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('OK'))
                                            ],
                                          );
                                        })
                                  }
                              });

                      // Use those values to send our auth request ...
                    }
                  },
                  child: Text(_isLogin ? 'Login' : 'Signup'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const ForgotPassword();
                          },
                        ));
                      },
                      child: const Text('Lupa Password'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const RegisterPage();
                          },
                        ));
                      },
                      child: const Text('Register'),
                    )
                  ],
                )
              ],
            )),
      ))),
    ));
  }
}

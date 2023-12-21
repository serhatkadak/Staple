import 'package:flutter/material.dart';
import 'package:staple/pages/home_page.dart';
import 'package:staple/screens/login_page.dart';
import 'package:staple/screens/signIn_page.dart';
import 'package:staple/screens/tab_bar_controller.dart';
import 'package:staple/veritabani_islem/veritabani_kontrol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            VeritabaniKontrol() //HomePage()TapBarController() //LoginPage()  ,
        );
  }
}

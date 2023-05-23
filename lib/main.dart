import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_app/views/buka_investasi.dart';
import 'package:tubes_app/views/main_pages/home_page.dart';
import 'package:tubes_app/views/main_pages/news_page.dart';
import 'package:tubes_app/views/pengajuan_pendanaan.dart';
import 'package:tubes_app/views/buka_investasi.dart';
import 'package:tubes_app/views/utils/landing_page.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/main_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // primaryColor: HexColor('#F5F5F5'),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      // MainHome(),
      // NewsPage(),

    );
  }
}

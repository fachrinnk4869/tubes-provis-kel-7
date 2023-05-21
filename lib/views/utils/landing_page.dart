import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/auth/login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.to(() => LoginPage());
    });
    return Scaffold(
      backgroundColor: HexColor("#F5F5F5"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "public/images/logo.png", //pastikan file ada di [project]/assets/images
              height: 150,
            ),
            const Text(
              "Investasi Sekarang, Bersenang Senang Kemudian!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        // Text(
        //   'Logo',
        //   style: TextStyle(
        //     color: Colors.red,
        //     fontSize: 30,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
    );
  }
}

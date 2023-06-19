import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/auth/login_page.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/utils/welcome_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration:
              Duration(milliseconds: 500), // Durasi animasi transisi
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: WelcomePage(),
            );
          },
        ),
      );
      // LoadingPage();
      // Timer(const Duration(seconds: 3), () {
      //   Get.to(() => LoadingPage());
      //   Timer(const Duration(seconds: 5), () {
      //     Navigator.push(
      //       context,
      //       PageRouteBuilder(
      //         transitionDuration:
      //             Duration(milliseconds: 500), // Durasi animasi transisi
      //         pageBuilder: (context, animation, secondaryAnimation) {
      //           return SlideTransition(
      //             position: Tween<Offset>(
      //               begin: Offset(1.0, 0.0), // Awal posisi halaman
      //               end: Offset.zero, // Akhir posisi halaman (posisi asli)
      //             ).animate(animation),
      //             child: WelcomePage(),
      //           );
      //         },
      //       ),
      //     );
      //   });
      // });
    });
    return WillPopScope(
        onWillPop: () async {
          // Mengabaikan perintah "back" saat loadingPage sedang ditampilkan
          return false;
        },
        child: Scaffold(
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
        ));
  }
}

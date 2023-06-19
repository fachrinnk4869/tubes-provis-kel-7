import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/admin/help.page.dart';
import 'package:tubes_app/views/admin/login.page.dart';
import 'package:tubes_app/views/admin/register.page.dart';
import 'package:tubes_app/views/auth/login_page.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/utils/role_page.dart';
import 'package:tubes_app/views/widgets/button.form.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  DateTime?
      currentBackPressTime; // Menambahkan "late" untuk menginisialisasi variabel nanti

  @override
  void initState() {
    super.initState();

    // Tampilkan loadingPage selama 2 detik saat aplikasi baru dibuka
    Future.delayed(Duration(seconds: 0), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration:
              Duration(milliseconds: 500), // Durasi animasi transisi
          pageBuilder: (context, animation, secondaryAnimation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0), // Awal posisi halaman
                end: Offset.zero, // Akhir posisi halaman (posisi asli)
              ).animate(animation),
              child: WelcomePageContent(),
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingPage(),
    );
  }
}

class WelcomePageContent extends StatefulWidget {
  const WelcomePageContent({super.key});

  @override
  State<WelcomePageContent> createState() => _WelcomePageContentState();
}

class _WelcomePageContentState extends State<WelcomePageContent> {
  DateTime?
      currentBackPressTime; // Menambahkan "late" untuk menginisialisasi variabel nanti

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Jika currentBackPressTime belum diatur atau telah berbeda lebih dari 2 detik
        if (currentBackPressTime == null ||
            DateTime.now().difference(currentBackPressTime!) >
                Duration(seconds: 2)) {
          // Set currentBackPressTime dengan waktu saat ini
          currentBackPressTime = DateTime.now();
          Fluttertoast.showToast(
            msg: "Tekan lagi untuk keluar",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
          return false;
        } else {
          // Keluar dari aplikasi
          SystemNavigator.pop();
          return true;
        }
      },
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              "public/images/umkm 1.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black12,
                Colors.black26,
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 17, right: 17, top: 30),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: Alignment.center,
                            child: Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    "public/images/logo.png", //pastikan file ada di [project]/assets/images
                                    height: 100,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: const Text(
                                      "Investasi Sekarang, Bersenang Senang Kemudian!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.56),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ElevatedButton(
                            onPressed: () {

                              Future.delayed(Duration(seconds: 0), () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(
                                        milliseconds:
                                            500), // Durasi animasi transisi
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: Offset(
                                              1.0, 0.0), // Awal posisi halaman
                                          end: Offset
                                              .zero, // Akhir posisi halaman (posisi asli)
                                        ).animate(animation),
                                        child: InvestorLoginPage(),
                                      );
                                    },
                                  ),
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: HexColor("#202441"), // Background color
                              onPrimary:
                                  Colors.white, // Text Color (Foreground color)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, bottom: 5),
                              child: const Text(
                                'M a s u k',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ElevatedButton(
                            onPressed: () {

                              Future.delayed(Duration(seconds: 0), () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(
                                        milliseconds:
                                            500), // Durasi animasi transisi
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: Offset(
                                              1.0, 0.0), // Awal posisi halaman
                                          end: Offset
                                              .zero, // Akhir posisi halaman (posisi asli)
                                        ).animate(animation),
                                        child: RolePage(),
                                      );
                                    },
                                  ),
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white.withOpacity(
                                    0.3), // Text Color (Foreground color)
                                onPrimary: Colors.black),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, bottom: 5),
                              child: const Text(
                                'D a f t a r  S e k a r a n g',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ElevatedButton(
                            onPressed: () {

                              Future.delayed(Duration(seconds: 0), () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(
                                        milliseconds:
                                            500), // Durasi animasi transisi
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: Offset(
                                              1.0, 0.0), // Awal posisi halaman
                                          end: Offset
                                              .zero, // Akhir posisi halaman (posisi asli)
                                        ).animate(animation),
                                        child: HelpPage(),
                                      );
                                    },
                                  ),
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors
                                    .transparent, // Text Color (Foreground color)
                                onPrimary: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, bottom: 5),
                              child: const Text(
                                'B u t u h  B a n t u a n ?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/umkm/umkm.root.home.dart';
import 'package:tubes_app/views/utils/loading_page.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({super.key});

  @override
  State<NotifyPage> createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return LoadingPage();
          },
        );

        Future.delayed(Duration(seconds: 2), () {
          // Navigator.popUntil(context, ModalRoute.withName('/TransmittingPage'));
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        });

        // Mengabaikan perintah "back" saat loadingPage sedang ditampilkan
        return false;
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white70,
              Colors.grey,
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
                        padding:
                            const EdgeInsets.only(left: 17, right: 17, top: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0),
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
                                    "Silahkan Isi Data Diri Anda Dengan Benar",
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
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(8, 10), // Shadow position
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Image.asset(
                                  "public/images/notify_accept_logo.png", //pastikan file ada di [project]/assets/images
                                  height: 150,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 40, left: 20, right: 20, top: 10),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text:
                                          'Berhasil Melakukan Transaksi Sebesar ',
                                      style: TextStyle(
                                        color: HexColor("#5D5D5D"),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Rp. 20.000.000',
                                          style: TextStyle(
                                              color: HexColor(
                                                  "#F3AA08") // Ganti dengan warna oranye yang diinginkan
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: HexColor("#202441"), // Background color
                        onPrimary:
                            Colors.white, // Text Color (Foreground color)
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return LoadingPage();
                          },
                        );

                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(
                                  milliseconds: 500), // Durasi animasi transisi
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: HomeRootUMKM(),
                                );
                              },
                            ),
                          );
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Container(
                          width: 120,
                          child: Text(
                            "Kembali ke Halaman Awal",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
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
    );
  }
}

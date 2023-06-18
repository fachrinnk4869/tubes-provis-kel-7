import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/admin/root.home.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  void _launchWhatsApp() async {
    // Replace <PHONE_NUMBER> with the actual phone number you want to message
    String phoneNumber = "+6285318191571";
    String url = "https://wa.me/$phoneNumber";

    // ignore: deprecated_member_use
    if (!await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // showDialog(
        //   context: context,
        //   barrierDismissible: false,
        //   builder: (BuildContext context) {
        //     return LoadingPage();
        //   },
        // );

        Future.delayed(Duration(seconds: 0), () {
          // Navigator.popUntil(context, ModalRoute.withName('/TransmittingPage'));
          Navigator.pop(context);
          // Navigator.pop(context);
          // Navigator.pop(context);
        });

        // Mengabaikan perintah "back" saat loadingPage sedang ditampilkan
        return false;
      },
      child: Container(
        width: double.infinity,
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
                  width: double.infinity,
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                "public/images/logo.png", //pastikan file ada di [project]/assets/images
                                height: 100,
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
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        // height: 20,
                        padding: const EdgeInsets.only(
                            right: 7, left: 7, top: 0, bottom: 7),
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 7,
                              ),
                            ]),
                        child: Container(
                          padding: const EdgeInsets.only(
                              right: 30, left: 30, top: 32, bottom: 15),
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  // blurRadius: 7,
                                ),
                              ]),
                          child: Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      HexColor("#FFFFFF"), // Background color
                                  onPrimary: Colors
                                      .white, // Text Color (Foreground color)
                                  side: BorderSide(
                                      color: HexColor("#868686"), width: 1),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Syarat Ketentuan Aplikasi",
                                      style: TextStyle(
                                          color: HexColor("#868686"),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      HexColor("#FFFFFF"), // Background color
                                  onPrimary: Colors
                                      .white, // Text Color (Foreground color)
                                  side: BorderSide(
                                      color: HexColor("#868686"), width: 1),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Cara Penggunaan Aplikasi",
                                      style: TextStyle(
                                          color: HexColor("#868686"),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      HexColor("#202441"), // Background color
                                  onPrimary: Colors
                                      .white, // Text Color (Foreground color)
                                ),
                                onPressed: () {
                                  _launchWhatsApp();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "public/images/logo_wa.png", //pastikan file ada di [project]/assets/images
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Hubungi Kami",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
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
        ),
      ),
    );
  }
}

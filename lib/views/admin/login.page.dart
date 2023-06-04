import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/admin/register.page.dart';
import 'package:tubes_app/views/admin/root.home.dart';
import 'package:tubes_app/views/auth/register_page.dart';
import 'package:tubes_app/views/main_home.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/widgets/button.form.dart';
import 'package:tubes_app/views/widgets/text.form.dart';

class InvestorLoginPage extends StatefulWidget {
  const InvestorLoginPage({super.key});

  @override
  State<InvestorLoginPage> createState() => _InvestorLoginPageState();
}

class _InvestorLoginPageState extends State<InvestorLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                              TextForm(
                                controller: emailController,
                                text: 'Email',
                                obscureText: false,
                                textInputType: TextInputType.emailAddress,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextForm(
                                controller: passwordController,
                                text: 'Kata Sandi',
                                obscureText: true,
                                textInputType: TextInputType.text,
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeRootInvestor()),
                                  );
                                  // Future.delayed(Duration(seconds: 2), () {
                                  // });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.23,
                                      right: MediaQuery.of(context).size.width *
                                          0.23),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Belum punya akun?"),
                                  InkWell(
                                    onTap: () {
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
                                                milliseconds:
                                                    500), // Durasi animasi transisi
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return SlideTransition(
                                                position: Tween<Offset>(
                                                  begin: Offset(1.0,
                                                      0.0), // Awal posisi halaman
                                                  end: Offset
                                                      .zero, // Akhir posisi halaman (posisi asli)
                                                ).animate(animation),
                                                child: InvestorRegistPage(),
                                              );
                                            },
                                          ),
                                        );
                                      });
                                    },
                                    child: Text(
                                      " Daftar",
                                      style: TextStyle(
                                        color: HexColor("#F3AA08"),
                                      ),
                                    ),
                                  ),
                                ],
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

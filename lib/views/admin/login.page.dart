import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tubes_app/views/admin/daftar.umkm.root.dart';
import 'package:tubes_app/views/admin/register.page.dart';
import 'package:tubes_app/views/admin/root.home.dart';
import 'package:tubes_app/views/auth/register_page.dart';
import 'package:tubes_app/views/main_home.dart';
import 'package:tubes_app/views/umkm/umkm.home.dart';
import 'package:tubes_app/views/umkm/umkm.root.home.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/widgets/button.form.dart';
import 'package:tubes_app/views/widgets/text.form.dart';
import 'package:http/http.dart' as http;

import '../../model/model.investor.dart';
import '../../model/model.userLogin.dart';
import '../../model/model.eventTampil.dart';
import '../../model/model.userUmkm.dart';
import 'main/investor_home.dart';

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
                      Consumer<UserInvestorModel>(
                          builder: (context, investorModel, _) {
                        return Consumer<EventTampilModel>(
                            builder: (context, EventTampil, _) {
                          return Consumer<UserUmkmModel>(
                              builder: (context, umkmModel, _) {
                            return Consumer<UserLoginModel>(
                                builder: (context, loginModel, _) {
                              return Container(
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
                                        textInputType:
                                            TextInputType.emailAddress,
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
                                      InkWell(
                                        onTap: () {
                                          final login = UserLogin(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );

                                          loginModel.loginUser(login).then((_) {
                                            if (loginModel.validationError ==
                                                'kosong') {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text('Warning'),
                                                    content: Text(
                                                        'Mohon isi semua data'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(); // Close the dialog
                                                        },
                                                        child: Text('Close'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            } else if (loginModel
                                                    .validationError ==
                                                'gaketemu') {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text('Warning'),
                                                    content: Text(
                                                        'Email tidak ditemukan silahkan login'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(); // Close the dialog
                                                        },
                                                        child: Text('Close'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            } else if (loginModel
                                                    .validationError ==
                                                'passwordsalah') {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text('Warning'),
                                                    content: Text(
                                                        'Password Salah bro , jangan nge hack'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(); // Close the dialog
                                                        },
                                                        child: Text('Close'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            } else if (loginModel
                                                .user.isInvestor) {
                                              investorModel
                                                  .getInvestor(
                                                      loginModel.user.id)
                                                  .then((_) {
                                                EventTampil.fetchData()
                                                    .then((_) {
                                                  Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      transitionDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  500),
                                                      pageBuilder: (context,
                                                          animation,
                                                          secondaryAnimation) {
                                                        return SlideTransition(
                                                          position:
                                                              Tween<Offset>(
                                                            begin: Offset(
                                                                1.0, 0.0),
                                                            end: Offset.zero,
                                                          ).animate(animation),
                                                          child:
                                                              HomeRootInvestor(),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                });
                                              });
                                            } else {
                                              EventTampil.fetchData().then((_) {
                                                umkmModel
                                                    .getUmkm(loginModel.user.id)
                                                    .then((_) {
                                                  Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      transitionDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  500),
                                                      pageBuilder: (context,
                                                          animation,
                                                          secondaryAnimation) {
                                                        return SlideTransition(
                                                          position:
                                                              Tween<Offset>(
                                                            begin: Offset(
                                                                1.0, 0.0),
                                                            end: Offset.zero,
                                                          ).animate(animation),
                                                          child: HomeRootUMKM(),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                });
                                              });
                                            }
                                          });
                                        },
                                        child: ButtonForm(text: "Submit"),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text("Belum punya akun?"),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder:
                                                    (BuildContext context) {
                                                  return LoadingPage();
                                                },
                                              );

                                              Future.delayed(
                                                  Duration(seconds: 2), () {
                                                Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    transitionDuration: Duration(
                                                        milliseconds:
                                                            500), // Durasi animasi transisi
                                                    pageBuilder: (context,
                                                        animation,
                                                        secondaryAnimation) {
                                                      return SlideTransition(
                                                        position: Tween<Offset>(
                                                          begin: Offset(1.0,
                                                              0.0), // Awal posisi halaman
                                                          end: Offset
                                                              .zero, // Akhir posisi halaman (posisi asli)
                                                        ).animate(animation),
                                                        child:
                                                            InvestorRegistPage(),
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
                              );
                            });
                          });
                        });
                      }),
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

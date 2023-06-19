import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/admin/register.page.dart';
import 'package:tubes_app/views/umkm/umkm.register.page.dart';
import 'package:tubes_app/views/utils/loading_page.dart';

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
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
                Colors.white,
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
                          padding: EdgeInsets.only(
                              left: 17, right: 17, top: MediaQuery.of(context).size.height * 0.17),
                          child: Container(
                            alignment: Alignment.center,
                            child: Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 17),
                                    child: const Text(
                                      "Daftar sebagai?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      // showDialog(
                                      //   context: context,
                                      //   barrierDismissible: false,
                                      //   builder: (BuildContext context) {
                                      //     return LoadingPage();
                                      //   },
                                      // );

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
                                                  begin: Offset(1.0,
                                                      0.0), // Awal posisi halaman
                                                  end: Offset
                                                      .zero, // Akhir posisi halaman (posisi asli)
                                                ).animate(animation),
                                                child: UmkmRegisterPage(),
                                              );
                                            },
                                          ),
                                        );
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: HexColor("#202441"),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      width: 200,
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  ClipOval(
                                                    child: Container(
                                                      height: 150,
                                                      width: 150,
                                                      color: Colors.white,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "public/images/logo_umkm.png",
                                                            height: 70,
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "UMKM",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
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
                                  SizedBox(height: 10),
                                  Image.asset(
                                    "public/images/logo.png",
                                    height: 80,
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      
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
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: HexColor("#202441"),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      width: 200,
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  ClipOval(
                                                    child: Container(
                                                      height: 150,
                                                      width: 150,
                                                      color: Colors.white,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "public/images/logo_investor.png",
                                                            height: 70,
                                                          ),
                                                          Text(
                                                            "Investor",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
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
                                ],
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

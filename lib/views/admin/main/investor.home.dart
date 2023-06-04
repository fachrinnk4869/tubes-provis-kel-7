import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:tubes_app/views/admin/daftar.investasiku.root.dart';
import 'package:tubes_app/views/admin/investasi.form.page.dart';
import 'package:tubes_app/views/admin/investasiku.page.dart';
import 'package:tubes_app/views/admin/main/investor.profile.dart';
import 'package:tubes_app/views/admin/investor.tarik_saldo.page.dart';
import 'package:tubes_app/views/admin/investor.topup.page.dart';
import 'package:tubes_app/views/admin/login.page.dart';
import 'package:tubes_app/views/admin/notifikasi.dart';
import 'package:tubes_app/views/admin/umkmku.page.dart';
import 'package:tubes_app/views/input_profile_umkm.dart';
import 'package:tubes_app/views/admin/bayar.metode_umkm.dart';
import 'package:tubes_app/views/utils/loading_page.dart';

class InvestorHome extends StatefulWidget {
  const InvestorHome({super.key});

  @override
  State<InvestorHome> createState() => _InvestorHomeState();
}

class _InvestorHomeState extends State<InvestorHome> {
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
          child: MaterialApp(
            title: '',
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: true,
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, bottom: 30.0, left: 9.5, right: 9.5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                          child: InvestorProfilePage(),
                                        );
                                      },
                                    ),
                                  );
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'public/images/material-symbols_person.png'),
                                      ),
                                    ),
                                    width: 35,
                                    height: 35,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 10),
                                    child: Container(
                                      child: Text(
                                        "Halo Nadhief!",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                          child: InvestorNotifyLonceng(),
                                        );
                                      },
                                    ),
                                  );
                                });
                              },
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.sp
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'public/images/logo_bell.png'),
                                      ),
                                    ),
                                    width: 35,
                                    height: 35,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: HexColor("#202441"),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 20.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Saldo',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Rp. 200.000.000',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                HexColor("#F3AA08"),
                                            foregroundColor: Colors.white,
                                            side:
                                                BorderSide(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return LoadingPage();
                                              },
                                            );

                                            Future.delayed(Duration(seconds: 2),
                                                () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  transitionDuration: Duration(
                                                      milliseconds:
                                                          500), // Durasi animasi transisi
                                                  pageBuilder: (context,
                                                      animation,
                                                      secondaryAnimation) {
                                                    return FadeTransition(
                                                      opacity: animation,
                                                      child:
                                                          InvestorTarikSaldo(),
                                                    );
                                                  },
                                                ),
                                              );
                                            });
                                          },
                                          child: Text(
                                            "Tarik Saldo",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  HexColor("#F3AA08"),
                                              foregroundColor: Colors.white,
                                              side: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {
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
                                                      return FadeTransition(
                                                        opacity: animation,
                                                        child:
                                                            InvestorTopupPage(),
                                                      );
                                                    },
                                                  ),
                                                );
                                              });
                                            },
                                            child: Text(
                                              "Isi Saldo",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
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
                        SizedBox(
                          height: 10,
                        ),
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
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: InvestasiFormPage(),
                                    );
                                  },
                                ),
                              );
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: HexColor("#F3AA08"),
                            ),
                            child: Text(
                              "Mulai Investasi",
                              style: TextStyle(
                                  color: HexColor("#000000"),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                          return FadeTransition(
                                            opacity: animation,
                                            child: InvestasikuPage(),
                                          );
                                        },
                                      ),
                                    );
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10.0,
                                            left: 14,
                                            right: 14,
                                            top: 10),
                                        child: Image.asset(
                                          "public/images/logo_investasiku.png",
                                          height: 35,
                                        ),
                                      ),
                                    ),
                                    Text("InvestasiKu"),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (() {
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
                                          return FadeTransition(
                                            opacity: animation,
                                            child: InvestasikuPage(),
                                          );
                                        },
                                      ),
                                    );
                                  });
                                }),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10.0,
                                            left: 14,
                                            right: 14,
                                            top: 10),
                                        child: Image.asset(
                                          "public/images/logo_dompetku.png",
                                          height: 35,
                                        ),
                                      ),
                                    ),
                                    Text("DompetKu"),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (() {
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
                                          return FadeTransition(
                                            opacity: animation,
                                            child: JelajahUmkmPage(),
                                          );
                                        },
                                      ),
                                    );
                                  });
                                }),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10.0,
                                            left: 14,
                                            right: 14,
                                            top: 10),
                                        child: Image.asset(
                                          "public/images/logo_jelajah.png",
                                          height: 35,
                                        ),
                                      ),
                                    ),
                                    Text("Jelajah UMKM"),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (() {
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
                                          return FadeTransition(
                                            opacity: animation,
                                            child: InvestasikuPage(),
                                          );
                                        },
                                      ),
                                    );
                                  });
                                }),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10.0,
                                            left: 14,
                                            right: 14,
                                            top: 10),
                                        child: Image.asset(
                                          "public/images/logo_informasi.png",
                                          height: 35,
                                        ),
                                      ),
                                    ),
                                    Text("Informasi"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Investasi Ku",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    letterSpacing: 0.8))),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: (() {
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
                                          return FadeTransition(
                                            opacity: animation,
                                            child: RootInvestasiku(),
                                          );
                                        },
                                      ),
                                    );
                                  });
                                }),
                                child: CardPilihanUmkm(
                                    gambar: "PikihanUMKM3.png",
                                    kategori: "UMKM MAHASISWA",
                                    judul: "Bergerak di bidang fashion",
                                    terkumpul: 1237878,
                                    durasi: 23,
                                    progressValue: 0.5),
                              ),
                              InkWell(
                                onTap: (() {
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
                                          return FadeTransition(
                                            opacity: animation,
                                            child: RootInvestasiku(),
                                          );
                                        },
                                      ),
                                    );
                                  });
                                }),
                                child: CardPilihanUmkm(
                                    gambar: "PikihanUMKM1.png",
                                    kategori: "UMKM MAHASISWA",
                                    judul: "Bergerak di bidang Textile",
                                    terkumpul: 124,
                                    durasi: 274,
                                    progressValue: 0.1),
                              ),
                              InkWell(
                                onTap: (() {
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
                                          return FadeTransition(
                                            opacity: animation,
                                            child: RootInvestasiku(),
                                          );
                                        },
                                      ),
                                    );
                                  });
                                }),
                                child: CardPilihanUmkm(
                                    gambar: "Logokemakom.png",
                                    kategori: "UMKM MAHASISWA",
                                    judul:
                                        "Bergerak di bidang fashion dan Textile",
                                    terkumpul: 7878,
                                    durasi: 345,
                                    progressValue: 0.7),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SearchBar(),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Jelajahi Investasi UMKM",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    letterSpacing: 0.8))),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: (() {
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
                                          return FadeTransition(
                                            opacity: animation,
                                            child: JelajahUmkmPage(),
                                          );
                                        },
                                      ),
                                    );
                                  });
                                }),
                                child: CardPilihanUmkm(
                                    gambar: "PikihanUMKM3.png",
                                    kategori: "UMKM MAHASISWA",
                                    judul: "Bergerak di bidang fashion",
                                    terkumpul: 1237878,
                                    durasi: 23,
                                    progressValue: 0.5),
                              ),
                              InkWell(
                                onTap: (() {
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
                                          return FadeTransition(
                                            opacity: animation,
                                            child: JelajahUmkmPage(),
                                          );
                                        },
                                      ),
                                    );
                                  });
                                }),
                                child: CardPilihanUmkm(
                                    gambar: "PikihanUMKM1.png",
                                    kategori: "UMKM MAHASISWA",
                                    judul: "Bergerak di bidang Textile",
                                    terkumpul: 124,
                                    durasi: 274,
                                    progressValue: 0.1),
                              ),
                              InkWell(
                                onTap: (() {
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
                                          return FadeTransition(
                                            opacity: animation,
                                            child: JelajahUmkmPage(),
                                          );
                                        },
                                      ),
                                    );
                                  });
                                }),
                                child: CardPilihanUmkm(
                                    gambar: "Logokemakom.png",
                                    kategori: "UMKM MAHASISWA",
                                    judul:
                                        "Bergerak di bidang fashion dan Textile",
                                    terkumpul: 7878,
                                    durasi: 345,
                                    progressValue: 0.7),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
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

class ProgressBarExample extends StatefulWidget {
  double progressValue;
  ProgressBarExample({
    required this.progressValue,
  });
  @override
  ProgressBarExampleState createState() =>
      ProgressBarExampleState(progressValue: progressValue);
}

class ProgressBarExampleState extends State<ProgressBarExample> {
  double progressValue;
  ProgressBarExampleState({
    required this.progressValue,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 275,
        height: 8,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.white,
            valueColor:
                AlwaysStoppedAnimation<Color>(Color.fromRGBO(88, 105, 255, 1)),
          ),
        ),
      ),
    );
  }
}

class CardPilihanUmkm extends StatelessWidget {
  String gambar;
  String kategori;
  String judul;
  int terkumpul;
  int durasi;
  double progressValue;
  CardPilihanUmkm({
    super.key,
    required this.gambar,
    required this.kategori,
    required this.judul,
    required this.terkumpul,
    required this.durasi,
    required this.progressValue,
  });
  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID', // Specify the desired locale
      symbol: 'Rp', // Currency symbol
    );
    return Padding(
      padding: EdgeInsets.only(top: 10, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 190,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(224, 220, 232, 1),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      'public/images/' + gambar,
                      fit: BoxFit.cover,
                      width: 300,
                      height: 120,
                    ),
                    Container(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      width: 300,
                      height: 34,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        kategori,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    judul,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                ProgressBarExample(progressValue: progressValue),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          currencyFormat.format(terkumpul),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          durasi.toString() + " hari lagi",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchText = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: 'Jelajahi Peluang Investasi UMKM di Sekitar Anda',
          labelStyle: TextStyle(fontSize: 12),
          prefixIcon: Icon(Icons.search, color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}

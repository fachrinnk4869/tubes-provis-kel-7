import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:tubes_app/views/admin/investor.tarik_saldo.page.dart';
import 'package:tubes_app/views/admin/investor.topup.page.dart';
import 'package:tubes_app/views/admin/main/investor.profile.dart';
import 'package:tubes_app/views/admin/notifikasi.dart';
import 'package:tubes_app/views/input_profile_umkm.dart';
import 'package:tubes_app/views/umkm/bayar.cicilan_page.dart';
import 'package:tubes_app/views/umkm/notify/umkm.notifikasi.dart';
import 'package:tubes_app/views/umkm/pengajuan_pendanaan.dart';
import 'package:tubes_app/views/umkm/umkm.ongoing.page.dart';
import 'package:tubes_app/views/umkm/umkm.profile.dart';
import 'package:tubes_app/views/umkm/umkm.root.home.dart';
import 'package:tubes_app/views/umkm/umkm.tarik_saldo.page.dart';
import 'package:tubes_app/views/umkm/umkm.topup.page.dart';

import '../admin/login.page.dart';
import '../utils/loading_page.dart';

class UMKMHome extends StatefulWidget {
  const UMKMHome({super.key});

  @override
  State<UMKMHome> createState() => _UMKMHomeState();
}

class _UMKMHomeState extends State<UMKMHome> {
  final currencyFormat = NumberFormat.currency(
      locale: 'id_ID', // Specify the desired locale
      symbol: 'Rp', // Currency symbol
    );
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
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'public/images/logo.png',
                      height: 40,
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 30.0, left: 9.5, right: 9.5),
                    child: Consumer<UserUmkmModel>(
                      builder: (context, umkmModel, _) {
                        return Consumer<UserLoginModel>(
                          builder: (context, loginModel, _){
                            return Column(
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
                                                  child: UMKMProfilePage(),
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
                                                "Halo " + loginModel.user.name,
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
                                                  child: UMKMNotifyLonceng(),
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
                                                  currencyFormat.format(umkmModel.user.saldo),
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

                                                    Future.delayed(Duration(seconds: 0),
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
                                                              child: UMKMTarikSaldo(),
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
                                                      Future.delayed(
                                                          Duration(seconds: 0), () {
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
                                                                child: UMKMTopUpPage(),
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
                                          pageBuilder:
                                              (context, animation, secondaryAnimation) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: UMKMPengajuanPendanaan(),
                                            );
                                          },
                                        ),
                                      );
                                    });
                                  }),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.87,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: HexColor("#F3AA08"),
                                    ),
                                    child: Text(
                                      "Ajukan Peminjaman",
                                      style: TextStyle(
                                          color: HexColor("#000000"),
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Pendanaan Berlangsung",
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
                                                    child: UMKMOngoingPage(),
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
                                                    child: UMKMOngoingPage(),
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
                                                    child: UMKMOngoingPage(),
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Jatuh Tempo",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              letterSpacing: 0.8))),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.87,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("#202441"),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0),
                                            child: Text('Tagihan Anda Bulan Ini',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    letterSpacing: 0.8)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0, left: 20),
                                            child: Text('Keterangan',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    letterSpacing: 0.8)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0, left: 20),
                                            child: Text('Setor Bulanan Pinjaman',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    letterSpacing: 0.8)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0, left: 20),
                                            child: Text('Total',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    letterSpacing: 0.8)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0, left: 63),
                                            child: Text('Rp. 100.000.000',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    letterSpacing: 0.8)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20.0, top: 15),
                                            child: Text('7 hari lagi',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    letterSpacing: 0.8)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
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
                                          pageBuilder:
                                              (context, animation, secondaryAnimation) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: CicilanPage(),
                                            );
                                          },
                                        ),
                                      );
                                    });
                                  }),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.87,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: HexColor("#F3AA08"),
                                    ),
                                    child: Text(
                                      "Bayar Cicilan",
                                      style: TextStyle(
                                          color: HexColor("#000000"),
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        );
                      }
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

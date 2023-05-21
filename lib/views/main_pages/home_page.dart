import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:tubes_app/views/input_profile_umkm.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Scaffold(
        body: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    // color: Colors.amber,
                    width: 450,
                    // alignment: Alignment.centerLeft,
                    child: Row(

                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // decoration: BoxDecoration(border: Border.all()),
                                    padding: EdgeInsets.only(top: 50),
                                    child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              // color: Colors.amber,
                                              // padding: EdgeInsets.only(right: 50),
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
                                        ])),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                                // decoration: BoxDecoration(border: Border.all()),
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(top: 40, right: 10),
                                child: Container(
                                  // alignment ke kanan
                                  decoration: BoxDecoration(
                                    // shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('public/images/logoscan.png'),
                                    ),
                                  ),
                                  width: 35,
                                  height: 35,
                                )),
                          ),
                        ]),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            // decoration: BoxDecoration(border: Border.all()),
                            padding: EdgeInsets.all(15),
                            child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    // color:Color.fromRGBO(108, 107, 243, 1),
                                    // padding: EdgeInsets.only(),
                                    width: 450,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color.fromRGBO(108, 107, 243, 1),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 10,
                                              offset: Offset(0, 3))
                                        ]),
                                    child: Row(
                                        // mainAxisAlignment:
                                        // MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              // decoration: BoxDecoration(border: Border.all()),
                                              padding: EdgeInsets.only(),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      // color: Colors.black12,
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Expanded(
                                                        child:
                                                            Column(children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 30),
                                                              child: Text(
                                                                'Saldo',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5),
                                                            child: Text(
                                                              'Rp 20.000.000.000',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              //text color white
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )
                                                        ]),
                                                      ),
                                                    ),
                                                  ])),
                                          Container(
                                              // decoration: BoxDecoration(border: Border.all()),
                                              padding: EdgeInsets.only(),
                                              child: Column(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      // color: Colors.greenAccent,
                                                      padding: EdgeInsets.only(
                                                          left: 200, top: 30),
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                          'Top up',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          // shape:
                                                          // StadiumBorder(),
                                                          backgroundColor:
                                                              Color.fromRGBO(88,
                                                                  105, 255, 1),
                                                          foregroundColor:
                                                              Colors.white,
                                                          side: BorderSide(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ])),
                                        ]),
                                  ),
                                ])),
                      ]),
                  Container(
                    // color: Colors.amber,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(224, 220, 232, 1),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3))
                        ]),
                    width: 450,
                    // alignment: Alignment.centerLeft,
                    child: Row(

                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // decoration: BoxDecoration(border: Border.all()),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              // shape: BoxShape.circle,
                                              image: DecorationImage(
                                                // fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'public/images/magnifyingglass.png'),
                                              ),
                                            ),
                                            width: 35,
                                            height: 35,
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.only(left: 20),
                                            child: Container(
                                              // color: Colors.amber,
                                              // padding: EdgeInsets.only(right: 50),
                                              child: Text(
                                                "Jelajahi Peluang Investasi UMKM di Sekitar Anda",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.5),
                                                    // fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Poppins'),
                                              ),
                                            ),
                                          ),
                                        ])),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                CircleSelect(nama: "buka investasi"),
                CircleSelect(nama: "reksadana"),
                CircleSelect(nama: "buka investasi"),
                CircleSelect(nama: "buka investasi"),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                    // decoration: BoxDecoration(border: Border.all()),
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              // decoration: BoxDecoration(border: Border.all()),
                              padding: EdgeInsets.only(left: 30, top: 40),
                              child: Text(
                                'Pilihan UMKM',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w900),
                              )),
                        ])),
              ]),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardPilihanUmkm(
                        gambar: "PikihanUMKM3.png",
                        kategori: "UMKM MAHASISWA",
                        judul: "Bergerak di bidang fashion",
                        terkumpul: 123,
                        durasi: 23,
                        progressValue: 0.5),
                    CardPilihanUmkm(
                        gambar: "PikihanUMKM1.png",
                        kategori: "UMKM MAHASISWA",
                        judul: "Bergerak di bidang Textile",
                        terkumpul: 124,
                        durasi: 274,
                        progressValue: 0.1),
                    CardPilihanUmkm(
                        gambar: "Logokemakom.png",
                        kategori: "UMKM MAHASISWA",
                        judul: "Bergerak di bidang fashion dan Textile",
                        terkumpul: 7878,
                        durasi: 345,
                        progressValue: 0.7),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleSelect extends StatelessWidget {
  String nama;
  CircleSelect({
    super.key,
    required this.nama,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(border: Border.all()),
        padding: EdgeInsets.only(top: 30, left: 15),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // decoration: BoxDecoration(border: Border.all()),
                padding: EdgeInsets.only(),
                child: Image.asset(
                  'public/images/awan.png',
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                ),
              ),
              Container(
                  // decoration: BoxDecoration(border: Border.all()),
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    nama,
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                  )),
            ]));
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
      padding: EdgeInsets.only(top: 10, left: 40),
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
                          'Rp. ' + currencyFormat.format(terkumpul),
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

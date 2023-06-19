import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 30)),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 35),
                      child: const Text(
                        "History",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: const Text(
                        "Top Up",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor("#0F17D0").withAlpha(220),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // color: Colors.grey,
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        "public/images/send_logo.png",
                                        height: 35,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Send Money",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: HexColor("#FFFFFF"),
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "08 Mar 2023 - 18.30",
                                        style: TextStyle(
                                          color: HexColor("#FFFFFF")
                                              .withOpacity(0.5),
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                "-Rp. 50.000",
                                style: TextStyle(
                                  color: HexColor("#FFFFFF"),
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
              const SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor("#E01205").withAlpha(220),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // color: Colors.grey,
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        "public/images/receive_logo.png",
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          "Receive Money",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: HexColor("#FFFFFF"),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          "08 Mar 2023 - 18.30",
                                          style: TextStyle(
                                            color: HexColor("#FFFFFF")
                                                .withOpacity(0.5),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                "+Rp. 25.000",
                                style: TextStyle(
                                  color: HexColor("#FFFFFF"),
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
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: const Text(
                    "Investasi",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor("#DADBF2").withAlpha(220),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // color: Colors.grey,
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              15), // Ubah nilai sesuai keinginan
                                          child: Image.asset(
                                            "public/images/before_pict.png",
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: SizedBox(
                                            width: 128,
                                            child: Flexible(
                                              child: Text(
                                                "Komunitas Cilor Pedagang Kaki Lima",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: HexColor("#000000"),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            "10 menit lalu sebesar Rp1.000",
                                            style: TextStyle(
                                              color: HexColor("#000000")
                                                  .withOpacity(0.5),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Aksi yang dijalankan saat tombol ditekan
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: HexColor("#5869FF"),
                                    backgroundColor: HexColor("#FFFFFF"),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(
                                        color: HexColor("#3E44CD"),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Berhasil",
                                    style: TextStyle(
                                      color: HexColor("#5869FF"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor("#DADBF2").withAlpha(220),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // color: Colors.grey,
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              15), // Ubah nilai sesuai keinginan
                                          child: Image.asset(
                                            "public/images/before_pict.png",
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: SizedBox(
                                            width: 128,
                                            child: Flexible(
                                              child: Text(
                                                "Komunitas Cilor Pedagang Kaki Lima",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: HexColor("#000000"),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            "10 menit lalu sebesar Rp1.000",
                                            style: TextStyle(
                                              color: HexColor("#000000")
                                                  .withOpacity(0.5),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Aksi yang dijalankan saat tombol ditekan
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: HexColor("#5869FF"),
                                    backgroundColor: HexColor("#FFFFFF"),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(
                                        color: HexColor("#3E44CD"),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Berhasil",
                                    style: TextStyle(
                                      color: HexColor("#5869FF"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

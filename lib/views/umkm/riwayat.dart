import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    for (int i = 0; i < 10; i++)
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                HexColor('#2E3182').withOpacity(0.3),
                              ], // Define your gradient colors here
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: ListTile(
                            onTap: () {},
                            trailing: Text(
                              'Selesai',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            title: const Text(
                              'Nominal Peminjaman',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 3),
                                      child: Text(
                                        'DESKRIPSI SINGKAT PEMINJAMAN',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 9,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 3),
                                      child: Text(
                                        'Rp. 1.000.000.000.000',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ),
                                  ],
                                ),
                                // progressValue: 0.5,
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3.0),
                                  child: ProgressBarExample(progressValue: 1.0),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Rp. 90.000.000',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 9,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Poppins'),
                                    ),
                                    Text(
                                      '7 bulan lagi',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 9,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        width: double.infinity,
        height: 5,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 163, 52, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.white,
            valueColor:
                AlwaysStoppedAnimation<Color>(Color.fromRGBO(255, 163, 52, 1)),
          ),
        ),
      ),
    );
  }
}

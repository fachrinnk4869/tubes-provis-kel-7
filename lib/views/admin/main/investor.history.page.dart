import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tubes_app/model/model.riwayatSaldo.dart';
import 'package:tubes_app/model/model.riwayatTampil.dart';
import 'package:tubes_app/views/admin/root.home.dart';
import 'package:tubes_app/views/utils/loading_page.dart';

import '../daftar.umkm.root.dart';

class InvestorHistoryPage extends StatefulWidget {
  const InvestorHistoryPage({super.key});

  @override
  State<InvestorHistoryPage> createState() => _InvestorHistoryPageState();
}

class _InvestorHistoryPageState extends State<InvestorHistoryPage> {
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
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('History'),
              backgroundColor: HexColor("#202441"),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07,
                        top: MediaQuery.of(context).size.height * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Riwayat Transaksi",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Consumer<RiwayatTampilModel>(
                            builder: (context, riwayat, _) {
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: riwayat.events.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    HexColor("#202441").withOpacity(0.2),
                                    HexColor("#FFFFFF").withOpacity(0.3),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        riwayat.events[index].deskripsi ==
                                                "topup"
                                            ? ColorFiltered(
                                                colorFilter: ColorFilter.mode(
                                                    HexColor("#202441"),
                                                    BlendMode.srcIn),
                                                child: Image.asset(
                                                  "public/images/logo_receive.png",
                                                  height: 40,
                                                ),
                                              )
                                            : ColorFiltered(
                                                colorFilter: ColorFilter.mode(
                                                    HexColor("#202441"),
                                                    BlendMode.srcIn),
                                                child: Image.asset(
                                                  "public/images/logo_send.png",
                                                  height: 40,
                                                ),
                                              ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              riwayat.events[index].deskripsi,
                                              style: TextStyle(
                                                color: HexColor("#202441"),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              // riwayat.events[index].date_created
                                              //     .toString(),
                                              "08 Mar 2023 - 18.30",
                                              style: TextStyle(
                                                color: HexColor("#202441"),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    riwayat.events[index].deskripsi == "topup"
                                        ? Text(
                                            "+Rp. " +
                                                riwayat.events[index].nominal
                                                    .toString(),
                                            style: TextStyle(
                                              color: HexColor("#202441"),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          )
                                        : Text(
                                            "-Rp. " +
                                                riwayat.events[index].nominal
                                                    .toString(),
                                            style: TextStyle(
                                              color: HexColor("#202441"),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
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
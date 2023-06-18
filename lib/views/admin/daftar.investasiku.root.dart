import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/admin/investasiku.page.dart';
import 'package:tubes_app/views/admin/investor.ongoing.page.dart';
import 'package:tubes_app/views/admin/investor.umkm.about.page.dart';
import 'package:tubes_app/views/utils/loading_page.dart';

class RootInvestasiku extends StatefulWidget {
  const RootInvestasiku({super.key});

  @override
  State<RootInvestasiku> createState() => _RootInvestasikuState();
}

class _RootInvestasikuState extends State<RootInvestasiku> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Future.delayed(Duration(seconds: 0), () {
          // Navigator.popUntil(context, ModalRoute.withName('/TransmittingPage'));
          Navigator.pop(context);
        });

        // Mengabaikan perintah "back" saat loadingPage sedang ditampilkan
        return false;
      },
      child: DefaultTabController(
        length: 2, // Jumlah tab yang ingin ditampilkan
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                color: HexColor('#202441'),
                child: Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: TabBar(
                    indicatorColor: HexColor('#F3AA08'),
                    // backgroundColor: Colors.blue,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(
                        text: "Tentang UMKM",
                      ),
                      Tab(text: "Riwayat"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: InvestorUMKMPage()),
                    Center(child: OngoingPage()),
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

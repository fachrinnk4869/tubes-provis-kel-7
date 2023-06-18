import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/admin/main/investor.history.page.dart';
import 'package:tubes_app/views/admin/main/investor.profile.dart';
import 'package:tubes_app/views/admin/main/investor_home.dart';
import 'package:tubes_app/views/main_pages/history_page.dart';
import 'package:tubes_app/views/main_pages/news_page.dart';

class HomeRootInvestor extends StatefulWidget {
  const HomeRootInvestor({super.key});

  @override
  State<HomeRootInvestor> createState() => _HomeRootInvestorState();
}

class _HomeRootInvestorState extends State<HomeRootInvestor> {
  DateTime? currentBackPressTime; // Menambahkan "late" untuk menginisialisasi variabel nanti

  int idx = 0; //index yang aktif

  // isi body akan sesuai index
  List<Center> halaman = [
    Center(
      child: HomeInvestor(),
    ),
    Center(child: InvestorHistoryPage()),
    Center(child: InvestorProfilePage()),
  ];

  //event saat button di-tap
  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Jika currentBackPressTime belum diatur atau telah berbeda lebih dari 2 detik
        if (currentBackPressTime == null || DateTime.now().difference(currentBackPressTime!) > Duration(seconds: 2)) {
          // Set currentBackPressTime dengan waktu saat ini
          currentBackPressTime = DateTime.now();
          Fluttertoast.showToast(
            msg: "Tekan lagi untuk keluar",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
          return false;
        } else {
          // Keluar dari aplikasi
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: halaman[idx],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          elevation: 0,
          onTap: onItemTap, // event saat button di tap
          backgroundColor: Colors.white.withOpacity(0.5),
          selectedItemColor: HexColor("#F3AA08"),
          unselectedItemColor: HexColor("#F3AA08").withOpacity(0.3),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

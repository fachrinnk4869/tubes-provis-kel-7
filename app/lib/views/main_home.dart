import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/main_pages/history_page.dart';
import 'package:tubes_app/views/main_pages/news_page.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int idx = 1; //index yang aktif

  // isi body akan sesuai index
  List<Center> halaman = [
    Center(child: HistoryPage()),
    Center(child: Text("Home")),
    Center(child: Text("Profile")),
  ];

  //event saat button di-tap
  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: halaman[idx],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          onTap: onItemTap, //event saat button di tap
          // backgroundColor: Colors.blueAccent,
          backgroundColor: HexColor("#202441"),
          selectedItemColor: HexColor("#F3AA08"),
          unselectedItemColor: HexColor("#F3AA08").withOpacity(0.3),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined,), label: "History",),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 45), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.verified_user_outlined), label: 'Profile'),
          ]
        )
    );
  }
}

import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/umkm/riwayat.root.dart';
import 'package:tubes_app/views/umkm/umkm.home.dart';
import 'package:tubes_app/views/umkm/umkm.lengkapiProfile_page.dart';
import 'package:tubes_app/views/umkm/umkm.profile.dart';
import 'package:http/http.dart' as http;

import '../admin/login.page.dart';

// class UserUmkm {
//   int? id;
//   String name;
//   String rekening;
//   String deskripsi;
//   String jenis;
//   String alamat;
//   int saldo;
//   String tahun_berdiri;

//   UserUmkm(
//       {this.id,
//       this.name = '',
//       this.rekening = '',
//       this.deskripsi = '',
//       this.jenis = '',
//       this.alamat = '',
//       this.saldo = 0,
//       this.tahun_berdiri = '',
//       });

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'rekening': rekening,
//       'deskripsi': deskripsi,
//       'jenis': jenis,
//       'alamat': alamat,
//       'saldo': saldo,
//       'tahun_berdiri': tahun_berdiri,
//     };
//   }

//   factory UserUmkm.fromJson(Map<String, dynamic> json) {
//     return UserUmkm(
//       id: json['id'],
//       name: json['name'],
//       rekening: json['rekening'],
//       deskripsi: json['deskripsi'],
//       jenis: json['jenis'],
//       alamat: json['alamat'],
//       saldo: json['saldo'],
//       tahun_berdiri: json['tahun_berdiri'],
//     );
//   }
// }

// class UserUmkmModel extends ChangeNotifier {
//   bool isLoading = false;
//   String message = '';
//   dynamic _user;
//   dynamic get user => _user;
//   dynamic _saldo;
//   dynamic get saldo => _saldo;
//   String _validationError = '';
//   String get validationError => _validationError;

//   Future<void> setUser(UserUmkm umkm) async {
//     _user = umkm;
//     notifyListeners();
//   }
//   Future<void> setSaldo(int saldo) async {
//     _saldo = saldo;
//     notifyListeners();
//   }
//   Future<void> createUmkm(UserUmkm umkm, dynamic user_id) async {
//     // isLoading = true;
//     // notifyListeners();
//     final url = 'http://127.0.0.1:8000/users/$user_id/umkm';
//     final headers = {'Content-Type': 'application/json'};
//     final body = jsonEncode(umkm.toJson());
//     // notifyListeners();

//     try {
//       final response =
//           await http.post(Uri.parse(url), headers: headers, body: body);

//       if (response.statusCode == 200) {
//         // Umkm successful, handle the response
//         message = 'User Umkm successfully';
//         print(response.body);
//         _user = UserUmkm.fromJson(jsonDecode(response.body));
//         // Navigate to the next screen or perform other actions
//       } else {
//         // Umkm failed, handle the error
//         message = 'Failed to register user';
//         print(response.body);
//         // Display an error message or perform other actions
//       }
//     } catch (error) {
//       message = 'An error occurred during umkm';
//       print(error.toString());
//     }
//     // callback();
//     // isLoading = false;
//     notifyListeners();
//   }
//   Future<void> getUmkm(dynamic user_id) async {
//     // isLoading = true;
//     // notifyListeners();
//     final url = 'http://127.0.0.1:8000/users/$user_id/umkm';
//     // final headers = {'Content-Type': 'application/json'};
//     // final body = jsonEncode(umkm.toJson());

//     try {
//       final response =
//           await http.get(Uri.parse(url));
//           // notifyListeners();

//       if (response.statusCode == 200) {
//         // Umkm successful, handle the response
//         message = 'User Umkm successfully';
//         print(response.body);
//         _user = UserUmkm.fromJson(jsonDecode(response.body));
//         // Navigate to the next screen or perform other actions
//       } else {
//         // Umkm failed, handle the error
//         message = 'Failed to register user';
//         print(response.body);
//         // Display an error message or perform other actions
//       }
//     } catch (error) {
//       message = 'An error occurred during umkm';
//       print(error.toString());
//     }
//     // callback();
//     // isLoading = false;
//     notifyListeners();
//   }
//   Future<void> updateUmkm(UserUmkm umkm, dynamic umkm_id) async {
//     // isLoading = true;
//     // notifyListeners();

//     final url = 'http://127.0.0.1:8000/umkms/$umkm_id';
//     final headers = {'Content-Type': 'application/json'};
//     final body = jsonEncode(umkm.toJson());

//     try {
//       final response =
//           await http.put(Uri.parse(url), headers: headers, body: body);
//     // notifyListeners();

//       if (response.statusCode == 200) {
//         // Umkm successful, handle the response
//         message = 'User Umkm successfully';
//         print(response.body);
//         _user = UserUmkm.fromJson(jsonDecode(response.body));
//         // Navigate to the next screen or perform other actions
//       } else {
//         // Umkm failed, handle the error
//         message = 'Failed to register user';
//         print(response.body);
//         // Display an error message or perform other actions
//       }
//     } catch (error) {
//       message = 'An error occurred during umkm';
//       print(error.toString());
//     }
//     // callback();
//     // isLoading = false;
//     notifyListeners();
//   }
//   Future<void> updateSaldoUmkm(UserUmkm umkm, dynamic umkm_id) async {
//     // isLoading = true;
//     // notifyListeners();

//     final url = 'http://127.0.0.1:8000/umkms/$umkm_id/saldo';
//     final headers = {'Content-Type': 'application/json'};
//     final body = jsonEncode(umkm.toJson());

//     try {
//       final response =
//           await http.put(Uri.parse(url), headers: headers, body: body);
//     // notifyListeners();

//       if (response.statusCode == 200) {
//         // Umkm successful, handle the response
//         message = 'User Umkm successfully';
//         print(response.body);
//         _user = UserUmkm.fromJson(jsonDecode(response.body));
//         // Navigate to the next screen or perform other actions
//       } else {
//         // Umkm failed, handle the error
//         message = 'Failed to register user';
//         print(response.body);
//         // Display an error message or perform other actions
//       }
//     } catch (error) {
//       message = 'An error occurred during umkm';
//       print(error.toString());
//     }
//     // callback();
//     // isLoading = false;
//     notifyListeners();
//   }
// }

class HomeRootUMKM extends StatefulWidget {
  const HomeRootUMKM({super.key});

  @override
  State<HomeRootUMKM> createState() => _HomeRootUMKMState();
}

class _HomeRootUMKMState extends State<HomeRootUMKM> {
  DateTime?
      currentBackPressTime; // Menambahkan "late" untuk menginisialisasi variabel nanti

  int idx = 0; //index yang aktif

  // isi body akan sesuai index
  List<Center> halaman = [
    Center(
      child: UMKMHome(),
    ),
    Center(child: RootRiwayat()),
    Center(child: UMKMProfilePage()),
  ];

  //event saat button di-tap
  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double desiredWidth = 50;
    final double scale = desiredWidth / screenWidth;
    final double value = screenWidth * scale;

    return WillPopScope(
      onWillPop: () async {
        // Jika currentBackPressTime belum diatur atau telah berbeda lebih dari 2 detik
        if (currentBackPressTime == null ||
            DateTime.now().difference(currentBackPressTime!) >
                Duration(seconds: 2)) {
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
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.grey,
          items: <Widget>[
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.home_outlined,
                      color: idx == 0
                          ? Colors.transparent.withOpacity(0.5)
                          : HexColor("#F3AA08").withOpacity(0.6)),
                  Text(
                    "Home",
                    style: TextStyle(
                        color: idx == 0
                            ? Colors.transparent.withOpacity(0.5)
                            : Colors.white.withOpacity(0.5)),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.history_outlined,
                      color: idx == 1
                          ? Colors.transparent.withOpacity(0.5)
                          : HexColor("#F3AA08").withOpacity(0.6)),
                  Text("History",
                      style: TextStyle(
                          color: idx == 1
                              ? Colors.transparent.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5)))
                ],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.person_outline,
                      color: idx == 2
                          ? Colors.transparent.withOpacity(0.5)
                          : HexColor("#F3AA08").withOpacity(0.6)),
                  Text("Profile",
                      style: TextStyle(
                          color: idx == 2
                              ? Colors.transparent.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5)))
                ],
              ),
            ),
          ],
          index: idx, // Menentukan indeks item yang terpilih secara default
          color: Colors.transparent
              .withOpacity(0.5), // Warna latar belakang item yang terpilih
          buttonBackgroundColor:
              Colors.white, // Warna latar belakang item saat terpilih
          height: value, // Tinggi bottom navigation bar
          animationCurve: Curves.easeInOut, // Kurva animasi saat memilih item
          animationDuration:
              Duration(milliseconds: 300), // Durasi animasi saat memilih item
          onTap: onItemTap, // event saat button di tap
        ),
      ),
    );
  }
}

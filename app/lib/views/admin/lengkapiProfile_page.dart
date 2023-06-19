import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tubes_app/views/admin/login.page.dart';
import 'package:tubes_app/views/admin/root.home.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/auth/login_page.dart';
import 'package:tubes_app/views/widgets/button.form.dart';
import 'package:tubes_app/views/widgets/text.form.dart';

import '../../model/model.userLogin.dart';
import '../../model/model.userUmkm.dart';
import '../umkm/umkm.register.page.dart';
import '../umkm/umkm.root.home.dart';

class LengkapiProfilePage extends StatefulWidget {
  const LengkapiProfilePage({super.key});

  @override
  State<LengkapiProfilePage> createState() => _LengkapiProfilePage();
}

class _LengkapiProfilePage extends State<LengkapiProfilePage> {
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController namaBisnisController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController tahunberdiriController = TextEditingController();

  String? selectedProvince;
  List<String> provinces = [
    'Jawa Barat',
    'Jawa Tengah',
    'Jawa Timur',
    'DKI Jakarta',
    'Banten'
  ];

  String? selectedCity;
  List<String> city = [
    'Kota Bandung',
    'Kota Cimahi',
    'Kota Bogor',
    'Kota Garut',
  ];

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
          // Navigator.popUntil(context, ModalRoute.withName('/TransmittingPage'));
          Navigator.pop(context);
          // Navigator.pop(context);
          // Navigator.pop(context);
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
                Colors.white,
                Color.fromARGB(255, 96, 94, 94),
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // color: Colors.grey,
                      width: 300,
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<UserLoginModel>(
                              builder: (context, loginModel, _) {
                            return Container(
                              alignment: Alignment.center,
                              child: Center(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: HexColor("#202441"),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      width: 200,
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  ClipOval(
                                                    child: Container(
                                                      height: 150,
                                                      width: 150,
                                                      color: Colors.white,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "public/images/logo_umkm.png",
                                                            height: 70,
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "UMKM",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: ElevatedButton.icon(
                                        onPressed: () async {
                                          FilePickerResult? result =
                                              await FilePicker.platform
                                                  .pickFiles();
                                          if (result != null) {
                                            PlatformFile file =
                                                result.files.first;
                                            // Gunakan file yang dipilih
                                            print('Path file:${file.path}');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(140, 40),
                                          padding: EdgeInsets.zero,
                                          backgroundColor: HexColor('#202441'),
                                          onPrimary: HexColor('#202441'),
                                          side: BorderSide(
                                            color: HexColor('#202441'),
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.attach_file,
                                          color: Colors.white,
                                        ),
                                        label: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Text(
                                            'Pilih Foto',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      loginModel.user.name,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins'),
                                    ),
                                    Text(
                                      loginModel.user.email,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Text Pendaftaran
                    Consumer<UserUmkmModel>(builder: (context, umkmModel, _) {
                      alamatController.text = umkmModel.user.alamat;
                      namaBisnisController.text = umkmModel.user.name;
                      deskripsiController.text = umkmModel.user.deskripsi;
                      tahunberdiriController.text =
                          umkmModel.user.tahun_berdiri;
                      return Container(
                        // height: 20,
                        padding: const EdgeInsets.only(
                            right: 25, left: 25, top: 0, bottom: 7),
                        child: Column(
                          children: [
                            // 2. Nama Lengkap
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Nama Bisnis"),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                            TextForm(
                              controller: namaBisnisController,
                              text: 'Nama Bisnis',
                              obscureText: false,
                              textInputType: TextInputType.name,
                            ),
                            const SizedBox(
                              height: 25,
                            ),

                            // 3. Contact
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Deskripsi Bisnis"),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                            TextForm(
                              controller: deskripsiController,
                              text: 'Lorem Ipsum is simply dummy text of the',
                              obscureText: false,
                              textInputType: TextInputType.name,
                            ),
                            const SizedBox(
                              height: 25,
                            ),

                            // 1. Email
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Alamat"),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                            DropdownButtonFormField<String>(
                              value: selectedProvince,
                              items: provinces.map((String province) {
                                return DropdownMenuItem<String>(
                                  value: province,
                                  child: Text(province),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  selectedProvince = value!;
                                });
                              },
                            ),
                            DropdownButtonFormField<String>(
                              value: selectedCity,
                              items: city.map((String province) {
                                return DropdownMenuItem<String>(
                                  value: province,
                                  child: Text(province),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  selectedCity = value!;
                                });
                              },
                            ),
                            TextForm(
                              controller: alamatController,
                              text: 'alamat lengkap',
                              obscureText: false,
                              textInputType: TextInputType.name,
                            ),
                            const SizedBox(
                              height: 25,
                            ),

                            // 4. Password
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Tahun Berdiri Bisnis"),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                            TextForm(
                              controller: tahunberdiriController,
                              text: '1919',
                              obscureText: false,
                              textInputType: TextInputType.number,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 50, right: 50),
                              child: InkWell(
                                onTap: () {
                                  final umkm = UserUmkm(
                                    alamat: alamatController.text,
                                    tahun_berdiri: tahunberdiriController.text,
                                    name: namaBisnisController.text,
                                    deskripsi: deskripsiController.text,
                                  );

                                  umkmModel
                                      .updateUmkm(umkm, umkmModel.user.id)
                                      .then((_) {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration:
                                            Duration(milliseconds: 500),
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return SlideTransition(
                                            position: Tween<Offset>(
                                              begin: Offset(1.0, 0.0),
                                              end: Offset.zero,
                                            ).animate(animation),
                                            child: HomeRootUMKM(),
                                          );
                                        },
                                      ),
                                    );
                                    // Navigator.push(
                                    //     context,
                                    //     PageRouteBuilder(
                                    //       transitionDuration:
                                    //           Duration(milliseconds: 500),
                                    //       pageBuilder: (context, animation,
                                    //           secondaryAnimation) {
                                    //         return SlideTransition(
                                    //           position: Tween<Offset>(
                                    //             begin: Offset(1.0, 0.0),
                                    //             end: Offset.zero,
                                    //           ).animate(animation),
                                    //           child:HomeRootInvestor(),
                                    //         );
                                    //       },
                                    //     ),
                                    //   );
                                  });
                                },
                                child: ButtonForm(text: "Simpan"),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
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
    );
  }
}

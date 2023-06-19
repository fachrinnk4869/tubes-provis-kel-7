import 'dart:async';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tubes_app/model/model.pengajuanPeminjaman.dart';
import 'package:tubes_app/model/model.userUmkm.dart';
import 'package:tubes_app/views/umkm/notify.pengajuan.peminjaman.dart';
import 'package:tubes_app/views/umkm/umkm.root.home.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/widgets/text.form.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/button.form.dart';

class UMKMPengajuanPendanaan extends StatefulWidget {
  const UMKMPengajuanPendanaan({super.key});

  @override
  State<UMKMPengajuanPendanaan> createState() => _UMKMPengajuanPendanaan();
}

class _UMKMPengajuanPendanaan extends State<UMKMPengajuanPendanaan> {
  bool isChecked = false; // Status input checkbox
  bool isButtonEnabled = false; // Status tombol submit

  // Controller untuk kolom nama dan deskripsi
  final TextEditingController namaController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController jmlhpengajuanController = TextEditingController();
  final TextEditingController jangkawaktuController = TextEditingController();
  final TextEditingController keuntunganController = TextEditingController();

  void toggleCheckbox() {
    Future.delayed(Duration(seconds: 0), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration:
              Duration(milliseconds: 500), // Durasi animasi transisi
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: NotifyPengajuanPage(),
            );
          },
        ),
      );
    });
  }

  void handleSubmit() {
    // Tindakan yang dilakukan saat tombol submit ditekan
    if (isButtonEnabled) {
      isButtonEnabled = false;
    } else {
      isButtonEnabled = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return HexColor("#202441");
    }

    return WillPopScope(
      onWillPop: () async {
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
                          Container(
                            alignment: Alignment.center,
                            child: Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    "public/images/logo.png",
                                    height: 100,
                                  ),
                                  Text(
                                    "Silahkan Isi Dengan Benar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                      return Consumer<PengajuanPeminjamanModel>(
                          builder: (context, registrationModel, _) {
                        return Container(
                          // height: 20,
                          padding: const EdgeInsets.only(
                              right: 25, left: 25, top: 0, bottom: 7),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Judul Peminjaman"),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15)),
                              TextForm(
                                controller: namaController,
                                text:
                                    '', // Masukkan teks default atau kosong sesuai kebutuhan
                                obscureText: false,
                                textInputType: TextInputType.text,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Deskripsi Singkat Peminjaman"),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15)),
                              TextForm(
                                controller: deskripsiController,
                                text:
                                    '', // Masukkan teks default atau kosong sesuai kebutuhan
                                obscureText: false,
                                textInputType: TextInputType.text,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Jumlah Pengajuan Pinjaman"),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15)),
                              TextForm(
                                controller: jmlhpengajuanController,
                                text: 'Rp. 200.000.000',
                                obscureText: false,
                                textInputType: TextInputType.number,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Jangka Waktu"),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15)),
                              TextForm(
                                controller: jangkawaktuController,
                                text: '7 bulan',
                                obscureText: false,
                                textInputType: TextInputType.datetime,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Keuntungan PerBulan"),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15)),
                              TextForm(
                                controller: keuntunganController,
                                text: 'Rp. 0',
                                obscureText: false,
                                textInputType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 65, right: 65),
                                child: InkWell(
                                  onTap: () {
                                    final registration = PengajuanPeminjaman(
                                      name: namaController.text,
                                      desc: deskripsiController.text,
                                      target: int.parse(
                                          jmlhpengajuanController.text),
                                      tenor:
                                          int.parse(jangkawaktuController.text),
                                      keuntungan:
                                          int.parse(keuntunganController.text),
                                    );

                                    registrationModel
                                        .registerPeminjaman(
                                            registration, umkmModel.user.id)
                                        .then((_) {
                                      if (registrationModel.validationError ==
                                          'kosong') {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Warning'),
                                              content:
                                                  Text('Mohon isi semua data'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Close the dialog
                                                  },
                                                  child: Text('Close'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
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
                                                child: NotifyPengajuanPage(),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    });
                                  },
                                  child: ButtonForm(text: "Simpan"),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                    }),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     // Checkbox(
                    //     //   checkColor: Colors.white,
                    //     //   value: isChecked,
                    //     //   fillColor:
                    //     //       MaterialStateProperty.resolveWith(getColor),
                    //     //   onChanged: (bool? value) {
                    //     //     setState(() {
                    //     //       isChecked = value!;
                    //     //       handleSubmit();
                    //     //     });
                    //     //   },
                    //     // ),
                    //     // Padding(
                    //     //   padding: const EdgeInsets.only(top: 15.0),
                    //     //   child: Container(
                    //     //     width: MediaQuery.of(context).size.width * 0.825,
                    //     //     child: Text(
                    //     //         "Saya setuju dengan syarat dan ketentuan yang berlaku dan telah ditentukan"),
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    // Center(
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       primary: HexColor("#202441"), // Background color
                    //       onPrimary:
                    //           Colors.white, // Text Color (Foreground color)
                    //     ),
                    //     onPressed: isButtonEnabled ? toggleCheckbox : null,
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 55, right: 55),
                    //       child: Text("Selesai"),
                    //     ),
                    //   ),
                    // ),
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

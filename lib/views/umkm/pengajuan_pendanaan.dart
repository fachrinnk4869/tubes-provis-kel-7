import 'dart:async';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tubes_app/views/umkm/notify.pengajuan.peminjaman.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/widgets/text.form.dart';
import 'package:hexcolor/hexcolor.dart';

class UMKMPengajuanPendanaan extends StatefulWidget {
  const UMKMPengajuanPendanaan({super.key});

  @override
  State<UMKMPengajuanPendanaan> createState() => _UMKMPengajuanPendanaan();
}

class _UMKMPengajuanPendanaan extends State<UMKMPengajuanPendanaan> {
  bool isChecked = false; // Status input checkbox
  bool isButtonEnabled = false; // Status tombol submit

  void toggleCheckbox() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingPage();
      },
    );

    Future.delayed(Duration(seconds: 2), () {
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

  // PengajuanPendanaan({Key? key}) : super(key: key);
  final TextEditingController jmlhpengajuanController = TextEditingController();
  final TextEditingController jangkawaktuController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerifyController =
      TextEditingController();

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
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return LoadingPage();
          },
        );

        Future.delayed(Duration(seconds: 2), () {
          // Navigator.popUntil(context, ModalRoute.withName('/TransmittingPage'));
          Navigator.pop(context);
          Navigator.pop(context);
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
                    Container(
                      // height: 20,
                      padding: const EdgeInsets.only(
                          right: 25, left: 25, top: 0, bottom: 7),
                      child: Column(
                        children: [
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
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Rincian Anggaran Biaya"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 55,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 2,
                                  ),
                                ]),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles();
                                      if (result != null) {
                                        PlatformFile file = result.files.first;
                                        // Gunakan file yang dipilih
                                        print('Path file:${file.path}');
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
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
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        'Choose File',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Rincian Anggaran Biaya.xlsx",
                                  ),
                                )
                              ],
                            ),
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
                            child: Text("Potensi Pertumbuhan Bisnis"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 55,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 2,
                                  ),
                                ]),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles();
                                      if (result != null) {
                                        PlatformFile file = result.files.first;
                                        // Gunakan file yang dipilih
                                        print('Path file:${file.path}');
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
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
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        'Choose File',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Rincian Anggaran Biaya.pdf",
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                              handleSubmit();
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.825,
                            child: Text(
                                "Saya setuju dengan syarat dan ketentuan yang berlaku dan telah ditentukan"),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: HexColor("#202441"), // Background color
                          onPrimary:
                              Colors.white, // Text Color (Foreground color)
                        ),
                        onPressed: isButtonEnabled ? toggleCheckbox : null,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 55, right: 55),
                          child: Text("Selesai"),
                        ),
                      ),
                    ),
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

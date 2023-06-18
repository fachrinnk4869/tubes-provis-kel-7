import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/auth/login_page.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/widgets/button.form.dart';
import 'package:tubes_app/views/widgets/text.form.dart';

import 'notify/investor.notify.dart';

class InvestasiFormPage extends StatefulWidget {
  const InvestasiFormPage({super.key});

  @override
  State<InvestasiFormPage> createState() => _InvestasiFormPageState();
}

class _InvestasiFormPageState extends State<InvestasiFormPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController NIKController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController rekeningController = TextEditingController();
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

        Future.delayed(Duration(seconds: 2), () {
          // Navigator.popUntil(context, ModalRoute.withName('/TransmittingPage'));
          // Navigator.pop(context);
          // Navigator.pop(context);
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
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
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
                                    height: 90,
                                  ),
                                  Text(
                                    "Silahkan Isi Data Diri Anda Dengan Benar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
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
                    // Text Pendaftaran
                    Container(
                      // height: 20,
                      padding: const EdgeInsets.only(
                          right: 30, left: 30, top: 0, bottom: 7),
                      child: Column(
                        children: [
                          // 2. Nama Lengkap
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Nama Lengkap"),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 15)),
                          TextForm(
                            controller: nameController,
                            text: 'Nadhief Athallah Isya',
                            obscureText: false,
                            textInputType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 25,
                          ),

                          // 1. Email
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Alamat Email"),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 15)),
                          TextForm(
                            controller: emailController,
                            text: 'nadhief@gmail.com',
                            obscureText: false,
                            textInputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 25,
                          ),

                          // 3. Contact
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Nomor Telepon Aktif"),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextForm(
                            controller: contactController,
                            text: '08123456789',
                            obscureText: false,
                            textInputType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 25,
                          ),

                          // 3. NIK
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("NIK"),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextForm(
                            controller: NIKController,
                            text: '327429182381290',
                            obscureText: false,
                            textInputType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 25,
                          ),

                          // 4. Password
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Rekening Bank"),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 15)),
                          TextForm(
                            controller: rekeningController,
                            text: ' ',
                            obscureText: true,
                            textInputType: TextInputType.text,
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:
                                    HexColor("#202441"), // Background color
                                onPrimary: Colors.white,
                              ),
                              onPressed: () {
                                // showDialog(
                                //   context: context,
                                //   barrierDismissible: false,
                                //   builder: (BuildContext context) {
                                //     return LoadingPage();
                                //   },
                                // );

                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration: Duration(
                                          milliseconds:
                                              500), // Durasi animasi transisi
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: InvestorNotifyDataDiri(),
                                        );
                                      },
                                    ),
                                  );
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.15,
                                    right: MediaQuery.of(context).size.width *
                                        0.15),
                                child: Text(
                                  "Simpan",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 15,
                          ),
                        ],
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

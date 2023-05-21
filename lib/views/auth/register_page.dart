import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/auth/login_page.dart';
import 'package:tubes_app/views/widgets/button.form.dart';
import 'package:tubes_app/views/widgets/text.form.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerifyController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#f5f5f5"),
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
                              "Silahkan Isi Data Diri Anda Dengan Benar",
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
                // decoration: BoxDecoration(
                //     // color: Colors.white,
                //     borderRadius: BorderRadius.circular(6),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.black.withOpacity(0.3),
                //         blurRadius: 7,
                //       ),
                //     ]),
                child: Column(
                  children: [
                    // 1. Email
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Email"),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    TextForm(
                      controller: emailController,
                      text: 'Email',
                      obscureText: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    // 2. Nama Lengkap
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Nama Lengkap"),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    TextForm(
                      controller: nameController,
                      text: 'Nama Lengkap',
                      obscureText: false,
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    // 3. Contact
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Nomor Telepon Aktif"),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    TextForm(
                      controller: contactController,
                      text: 'Nomor Telepon Aktif',
                      obscureText: false,
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    // 4. Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password"),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    TextForm(
                      controller: passwordController,
                      text: 'Password',
                      obscureText: true,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    // 5. Verify Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Verifikasi Password"),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    TextForm(
                      controller: passwordVerifyController,
                      text: 'Verifikasi Password',
                      obscureText: true,
                      textInputType: TextInputType.text,
                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => LoadingPage());
                          Timer(const Duration(seconds: 5), () {
                            Get.to(() => LoginPage());
                          });
                          // Get.to(() => LoginPage());
                        },
                        child: ButtonForm(text: "Daftar"),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Sudah punya akun?"),
                        InkWell(
                          onTap: () {
                            // Get.to(() => LoginPage());
                            Get.to(() => LoadingPage());
                            Timer(const Duration(seconds: 5), () {
                              Get.to(() => LoginPage());
                            });
                          },
                          child: Text(
                            " Masuk",
                            style: TextStyle(
                              color: HexColor("#F3AA08"),
                            ),
                          ),
                        ),
                      ],
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
    );
  }
}

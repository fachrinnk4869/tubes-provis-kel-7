import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/auth/register_page.dart';
import 'package:tubes_app/views/widgets/button.form.dart';
import 'package:tubes_app/views/widgets/text.form.dart';
import 'package:tubes_app/views/main_pages/home_page.dart';
import 'package:tubes_app/views/main_home.dart';

import '../utils/loading_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          "public/images/logo.png", //pastikan file ada di [project]/assets/images
                          height: 150,
                        ),
                        const Text(
                          "Investasi Sekarang, Bersenang Senang Kemudian!",
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
                const SizedBox(
                  height: 25,
                ),
                Container(
                  // height: 20,
                  padding: const EdgeInsets.only(
                      right: 7, left: 7, top: 0, bottom: 7),
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 7,
                        ),
                      ]),
                  child: Container(
                    padding: const EdgeInsets.only(
                        right: 22, left: 22, top: 32, bottom: 15),
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            // blurRadius: 7,
                          ),
                        ]),
                    child: Column(
                      children: [
                        TextForm(
                          controller: emailController,
                          text: 'Email',
                          obscureText: false,
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextForm(
                          controller: passwordController,
                          text: 'Kata Sandi',
                          obscureText: true,
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            // Get.to(() => RegisterPage());
                            Get.to(() => LoadingPage());
                            Timer(const Duration(seconds: 5), () {
                              // Get.to(() => HomePage());
                              Get.to(() => MainHome());
                            });
                          },
                          child: ButtonForm(text: "Masuk"),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Belum punya akun?"),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => RegisterPage()),
                                // );
                                Get.to(() => LoadingPage());
                                Timer(const Duration(seconds: 5), () {
                                  Get.to(() => RegisterPage());
                                });
                                // Get.to(() => RegisterPage());
                              },
                              child: Text(
                                " Daftar",
                                style: TextStyle(
                                  color: HexColor("#F3AA08"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

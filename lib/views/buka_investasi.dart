import 'dart:async';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tubes_app/views/pengajuan_pendanaan.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/widgets/text.form.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/auth/register_page.dart';
import 'package:tubes_app/views/widgets/button.form.dart';
import 'package:tubes_app/views/widgets/text.form.dart';
import 'package:tubes_app/views/main_pages/home_page.dart';
import 'package:tubes_app/views/main_home.dart';

class BukaInvestasi extends StatelessWidget {
  BukaInvestasi({Key? key}) : super(key: key);

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController detailAlamatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Buka Investasi'),
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Image.network(
                    'https://picsum.photos/300/100',
                    width: 300,
                    height: 100,
                  ),
                ),
                textFormLabel(
                    controller: namaController,
                    text: "Nama Lengkap",
                    textInputType: TextInputType.text,
                    obscureText: true),
                textFormLabel(
                    controller: emailController,
                    text: "Alamat Email",
                    textInputType: TextInputType.emailAddress,
                    obscureText: true),
                textFormLabel(
                    controller: noTelpController,
                    text: "Nomor Telepon Lengkap",
                    textInputType: TextInputType.text,
                    obscureText: true),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 6.24),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Alamat UMKM',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Color(0xff343434),
                    ),
                  ),
                ),
                dropdownMenu(),
                dropdownMenu(),
                TextForm(
                    controller: detailAlamatController,
                    text: "Detail Alamat",
                    textInputType: TextInputType.emailAddress,
                    obscureText: true),
                textFormLabel(
                    controller: detailAlamatController,
                    text: "Nama Bisnis",
                    textInputType: TextInputType.emailAddress,
                    obscureText: false),
                textFormLabel(
                    controller: detailAlamatController,
                    text: "Deskripsi Bisnis",
                    textInputType: TextInputType.emailAddress,
                    obscureText: false),
                textFormLabel(
                    controller: detailAlamatController,
                    text: "Jenis Produk atau Jasa Yang Ditawarkan",
                    textInputType: TextInputType.emailAddress,
                    obscureText: false),
                textFormLabel(
                    controller: detailAlamatController,
                    text: "Tahun Berdiri Bisnis",
                    textInputType: TextInputType.emailAddress,
                    obscureText: false),
                textFormLabel(
                    controller: detailAlamatController,
                    text: "Jumlah Karyawan",
                    textInputType: TextInputType.emailAddress,
                    obscureText: false),
                textFormLabel(
                    controller: detailAlamatController,
                    text: "Keuntungan per Tahun",
                    textInputType: TextInputType.emailAddress,
                    obscureText: false),
                textFormLabel(
                    controller: detailAlamatController,
                    text: "Rekening Bank Untuk Transaksi",
                    textInputType: TextInputType.emailAddress,
                    obscureText: false),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    // Get.to(() => RegisterPage());
                    // Get.to(() => PengajuanPendanaan());
                    Get.to(() => LoadingPage());
                    Timer(const Duration(seconds: 2), () {
                      // Get.to(() => HomePage());
                      Get.to(() => PengajuanPendanaan());
                    });
                  },
                  child: ButtonForm(text: "Lanjutkan"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class textFormLabel extends StatelessWidget {
  textFormLabel(
      {super.key,
      required this.controller,
      required this.text,
      required this.textInputType,
      required this.obscureText});
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 6.24),
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: Color(0xff343434),
            ),
          ),
        ),
        TextForm(
            controller: controller,
            text: text,
            textInputType: textInputType,
            obscureText: obscureText),
      ],
    );
  }
}

class dropdownMenu extends StatelessWidget {
  const dropdownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 6.24),
      height: 40,
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Color(0xff343434)),
        // color: Color(0xff202441),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
              isDense: true,
            ),
            items: [
              DropdownMenuItem(
                value: 'option1',
                child: const Text('Option 1'),
              ),
              DropdownMenuItem(
                value: 'option2',
                child: const Text('Option 2'),
              ),
              DropdownMenuItem(
                value: 'option3',
                child: const Text('Option 3'),
              ),
            ],
            onChanged: (value) {
              // Action when dropdown value is changed
            },
            hint: const Text('Pilih opsi'),
          ),
        ],
      ),
    );
  }
}

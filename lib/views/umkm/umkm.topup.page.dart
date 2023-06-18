import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tubes_app/views/admin/bayar.metode_umkm.dart';
import 'package:tubes_app/views/admin/login.page.dart';
import 'package:tubes_app/views/umkm/umkm.bayar.metode_umkm.dart';
import 'package:tubes_app/views/umkm/umkm.root.home.dart';

import '../utils/loading_page.dart';

class UMKMTopUpPage extends StatefulWidget {
  const UMKMTopUpPage({super.key});

  @override
  State<UMKMTopUpPage> createState() => _UMKMTopUpPageState();
}

class _UMKMTopUpPageState extends State<UMKMTopUpPage> {
  bool isChecked = false; // Status input checkbox
  bool isButtonEnabled = false; // Status tombol submit
  final TextEditingController nominalController = TextEditingController();

  void toggleCheckbox() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return UMKMMetodePayment();
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
              child: UMKMMetodePayment(),
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

    // nominalController.text = "halo";
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
                Colors.white70,
                Colors.grey,
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.35),
                  alignment: Alignment.center,
                  child: Column(children: [
                    Text(
                      "Isi Saldo untuk transaksi",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "dengan instant",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Consumer<UserLoginModel>(builder: (context, loginModel, _) {
                      return Consumer<UserUmkmModel>(
                          builder: (context, umkmModel, _) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(4, 8), // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // prefixIcon: Icon(Icons.people), //prefix iocn
                                Text(
                                  "Masukan Nominal Top Up",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  height: 50,
                                  padding: const EdgeInsets.only(left: 0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2,
                                        ),
                                      ]),
                                  child: TextFormField(
                                    controller: nominalController,
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, left: 12),
                                        child: Text(
                                          "Rp",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blueAccent),
                                        ),
                                      ),
                                      labelText: "1.000.000.000", //babel text
                                      hintText:
                                          "Masukan Nominal Top Up", //hint text
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.all(5),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: isChecked,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
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
                                        width: 190,
                                        child: Text(
                                            "Saya setuju dengan syarat dan ketentuan yang berlaku dan telah ditentukan"),
                                      ),
                                    ),
                                  ],
                                ),

                                Center(
                                  child: ElevatedButton(
                                    style: isButtonEnabled
                                        ? ElevatedButton.styleFrom(
                                            primary: HexColor(
                                                "#202441"), // Background color
                                            onPrimary: Colors
                                                .white, // Text Color (Foreground color)
                                          )
                                        : ElevatedButton.styleFrom(
                                            primary: Colors
                                                .grey, // Background color when disabled
                                            onPrimary: Colors
                                                .white, // Text Color when disabled
                                          ),
                                    // aku pengen disabled button jika isButtonEnabled false

                                    // barrierDismissible: (isButtonEnabled ? false : true),
                                    // isButtonEnabled ? (barrierDismissible: false) : null,
                                    onPressed: isButtonEnabled
                                        ? () {
                                            
                                            umkmModel.setSaldo(int.parse(
                                                  nominalController.text));
                                            toggleCheckbox();
                                          }
                                        : null,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 55, right: 55),
                                      child: Text("Submit"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    }),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

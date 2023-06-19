import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tubes_app/model/model.eventTampil.dart';
import 'package:tubes_app/model/model.investment.dart';
import 'package:tubes_app/model/model.investor.dart';
import 'package:tubes_app/model/model.userUmkm.dart';
import 'package:tubes_app/views/admin/notify/investor.notify.umkm.dart';
import 'package:tubes_app/views/auth/login_page.dart';
import 'package:tubes_app/views/utils/loading_page.dart';

class InvestorDonationPage extends StatefulWidget {
  const InvestorDonationPage({super.key});

  @override
  State<InvestorDonationPage> createState() => _InvestorDonationPageState();
}

class _InvestorDonationPageState extends State<InvestorDonationPage> {
  bool isChecked = false; // Status input checkbox
  bool isButtonEnabled = false; // Status tombol submit
  final TextEditingController nominalController = TextEditingController();
  void toggleCheckbox() {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext context) {
    //     return LoadingPage();
    //   },
    // );

    Future.delayed(Duration(seconds: 0), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration:
              Duration(milliseconds: 500), // Durasi animasi transisi
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: InvestorNotifyUMKM(),
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
      child: Consumer<InvestmentModel>(builder: (context, investmentModel, _) {
        return Container(
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
                  child: Consumer<EventTampilModel>(
                      builder: (context, eventModel, _) {
                    return Consumer<UserInvestorModel>(
                        builder: (context, investorModel, _) {
                      return Consumer<UserUmkmModel>(
                          builder: (context, umkmModel, _) {
                        return Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.35),
                          alignment: Alignment.center,
                          child: Column(children: [
                            Text(
                              "Bayar TagihanMu Dengan",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Tepat Waktu!",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.4,
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
                                      "Masukkan Jumlah Investasi",
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
                                          borderRadius:
                                              BorderRadius.circular(6),
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
                                          labelText:
                                              "Minimum 50.000", //babel text
                                          hintText:
                                              "Masukkan Jumlah Investasi", //hint text
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.all(5),
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
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
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
                                        onPressed: isButtonEnabled
                                            ? () {
                                                if (investorModel.user.saldo -
                                                        int.parse(
                                                            nominalController
                                                                .text) <
                                                    0) {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text('Warning'),
                                                        content: Text(
                                                            'saldo tidak mencukupi'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // Close the dialog
                                                            },
                                                            child:
                                                                Text('Close'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  final investor = UserInvestor(
                                                    id: investorModel.user.id,
                                                    saldo: -int.parse(
                                                        nominalController.text),
                                                  );
                                                  final investment = Investment(
                                                    jumlah_investasi: int.parse(
                                                        nominalController.text),
                                                  );
                                                  final event = EventTampil(
                                                    id: eventModel.event.id,
                                                    tenor:
                                                        eventModel.event.tenor,
                                                    name: eventModel.event.name,
                                                    desc: eventModel.event.desc,
                                                    target:
                                                        eventModel.event.target,
                                                    terkumpul: eventModel
                                                        .event.terkumpul + int.parse(
                                                        nominalController.text),
                                                    keuntungan: eventModel
                                                        .event.keuntungan,
                                                    id_umkm: eventModel
                                                        .event.id_umkm,
                                                        status: eventModel
                                                        .event.status,
                                                  );
                                                  eventModel.updateTerkumpul(
                                          event, investorModel.user.id)
                                                      .then((_) {
                                                    investmentModel
                                                        .createInvestment(
                                                            investment,
                                                            eventModel.event.id,
                                                            investorModel
                                                                .user.id)
                                                        .then((_) {
                                                      investorModel
                                                          .updateSaldoInvestor(
                                                              investor,
                                                              investorModel
                                                                  .user.id)
                                                          .then((_) {
                                                        Future.delayed(
                                                            Duration(
                                                                seconds: 0),
                                                            () {
                                                          toggleCheckbox();
                                                        });
                                                      });
                                                    });
                                                  });
                                                }
                                              }
                                            : null,
                                        // isButtonEnabled ? toggleCheckbox : null,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 55, right: 55),
                                          child: Text("Simpan"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        );
                      });
                    });
                  }),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

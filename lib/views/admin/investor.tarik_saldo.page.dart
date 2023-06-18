import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/admin/notify/investor.notify.tarik_saldo.dart';
import 'package:tubes_app/views/utils/loading_page.dart';


class InvestorTarikSaldo extends StatefulWidget {
  const InvestorTarikSaldo({super.key});

  @override
  State<InvestorTarikSaldo> createState() => _InvestorTarikSaldoState();
}

class _InvestorTarikSaldoState extends State<InvestorTarikSaldo> {
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
                  padding: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: Column(children: [
                    Image.asset(
                      "public/images/logo.png", //pastikan file ada di [project]/assets/images
                      height: 100,
                    ),
                    Text(
                      "Silahkan Lakukan Transaksi",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
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
                              "Masukan Nominal",
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
                                      "Masukan Nominal", //hint text
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            // FORM 2
                            Text(
                              "Masukan No rek yang dituju",
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
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      HexColor("#202441"), // Background color
                                  onPrimary: Colors
                                      .white, // Text Color (Foreground color)
                                ),
                                onPressed: () {
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
                                        transitionDuration: Duration(
                                            milliseconds:
                                                500), // Durasi animasi transisi
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: InvestorTarikSaldoNotify(),
                                          );
                                        },
                                      ),
                                    );
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 55, right: 55),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

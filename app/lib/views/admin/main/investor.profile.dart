import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tubes_app/model/model.investor.dart';
import 'package:tubes_app/views/admin/lengkapiProfile_page.dart';
import 'package:tubes_app/views/admin/login.page.dart';
import 'package:tubes_app/views/admin/root.home.dart';
import 'package:tubes_app/views/utils/loading_page.dart';

import '../../../model/model.userLogin.dart';

class InvestorProfilePage extends StatefulWidget {
  const InvestorProfilePage({super.key});

  @override
  State<InvestorProfilePage> createState() => _InvestorProfilePageState();
}

class _InvestorProfilePageState extends State<InvestorProfilePage> {
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
                child:
                    Consumer<UserLoginModel>(builder: (context, loginModel, _) {
                  return Consumer<UserInvestorModel>(
                      builder: (context, investorModel, _) {
                    return Container(
                      // alignment: Alignment.center,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "public/images/logo.png",
                            height: 90,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text("Profile",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // for (var i = 0; i < 10; i++)
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 50,
                              decoration: BoxDecoration(
                                color: HexColor("#E0DCE8"),
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "public/images/MaleIcon.png",
                                          width: 30, // Lebar gambar 200 piksel
                                          height: 30,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              loginModel.user.name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "public/images/TelephoneIcon.png",
                                                  width:
                                                      15, // Lebar gambar 200 piksel
                                                  height: 15,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    loginModel.user.contact,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: (() {
                                        //   showDialog(
                                        //   context: context,
                                        //   barrierDismissible: false,
                                        //   builder: (BuildContext context) {
                                        //     return LoadingPage();
                                        //   },
                                        // );

                                        Future.delayed(Duration(seconds: 0),
                                            () {
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
                                                  child: LengkapiProfilePage(),
                                                );
                                              },
                                            ),
                                          );
                                        });
                                      }),
                                      child: Image.asset(
                                        "public/images/EditProfile.png",
                                        width: 30, // Lebar gambar 200 piksel
                                        height: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          
                        ],
                      ),
                    );
                  });
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

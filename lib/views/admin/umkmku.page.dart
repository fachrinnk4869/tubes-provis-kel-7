import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tubes_app/views/admin/daftar.investasiku.root.dart';
import 'package:tubes_app/views/admin/daftar.umkm.root.dart';
import 'package:tubes_app/views/utils/loading_page.dart';

class JelajahUmkmPage extends StatefulWidget {
  const JelajahUmkmPage({super.key});

  @override
  State<JelajahUmkmPage> createState() => _JelajahUmkmPageState();
}

class _JelajahUmkmPageState extends State<JelajahUmkmPage> {
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
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'public/images/logo.png',
                      height: 40,
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 17),
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jelajah UMKM",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Kenali UMKM lebih dekat",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (() {
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
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: RootUMKMKU(),
                                    );
                                  },
                                ),
                              );
                            });
                          }),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 110,
                            decoration: BoxDecoration(
                              color: HexColor("#202441"),
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
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama UMKM",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Keuntungan",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Target",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Image.asset(
                                    "public/images/pict_cilok 2.png",
                                    height: 80,
                                  ),
                                  // Text("Indomart"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: (() {
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
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: RootUMKMKU(),
                                    );
                                  },
                                ),
                              );
                            });
                          }),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 110,
                            decoration: BoxDecoration(
                              color: HexColor("#F3AA08"),
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
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama UMKM",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Keuntungan",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Target",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Image.asset(
                                    "public/images/pict_cilok 2.png",
                                    height: 80,
                                  ),
                                  // Text("Indomart"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: (() {
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
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: RootUMKMKU(),
                                    );
                                  },
                                ),
                              );
                            });
                          }),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 110,
                            decoration: BoxDecoration(
                              color: HexColor("#202441"),
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
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama UMKM",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Keuntungan",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Target",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Image.asset(
                                    "public/images/pict_cilok 2.png",
                                    height: 80,
                                  ),
                                  // Text("Indomart"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: (() {
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
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: RootUMKMKU(),
                                    );
                                  },
                                ),
                              );
                            });
                          }),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 110,
                            decoration: BoxDecoration(
                              color: HexColor("#F3AA08"),
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
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama UMKM",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Keuntungan",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Target",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Image.asset(
                                    "public/images/pict_cilok 2.png",
                                    height: 80,
                                  ),
                                  // Text("Indomart"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({Key? key}) : super(key: key);

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  DateTime?
      currentBackPressTime; // Menambahkan "late" untuk menginisialisasi variabel nanti

  // @override
  // void initState() {
  //   super.initState();
  //   // Menghilangkan tombol navigasi sistem di halaman Home
  //   SystemChrome.setEnabledSystemUIOverlays([]);
  // }

  // @override
  // void dispose() {
  //   // Mengaktifkan kembali tombol navigasi sistem saat halaman Home dihancurkan
  //   SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Jika currentBackPressTime belum diatur atau telah berbeda lebih dari 2 detik
        if (currentBackPressTime == null ||
            DateTime.now().difference(currentBackPressTime!) >
                Duration(seconds: 2)) {
          // Set currentBackPressTime dengan waktu saat ini
          currentBackPressTime = DateTime.now();
          Fluttertoast.showToast(
            msg: "Tekan lagi untuk keluar",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
          return false;
        } else {
          // Keluar dari aplikasi
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Home'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Go to Next Page'),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return LoadingPage();
                },
              );

              Future.delayed(Duration(seconds: 2), () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration:
                        Duration(milliseconds: 500), // Durasi animasi transisi
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(1.0, 0.0), // Awal posisi halaman
                          end:
                              Offset.zero, // Akhir posisi halaman (posisi asli)
                        ).animate(animation),
                        child: NextPage(),
                      );
                    },
                  ),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return LoadingPage();
          },
        );

        await Future.delayed(Duration(seconds: 2));

        Navigator.pop(context);// Kembali ke halaman pertama (TestingPage)
        Navigator.pop(context);// Kembali ke halaman pertama (TestingPage)

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Next Page'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('Go Back'),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return LoadingPage();
                    },
                  );

                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Go Next Third'),
                onPressed: () {
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
                        transitionDuration: Duration(
                            milliseconds: 500), // Durasi animasi transisi
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return FadeTransition(
                            opacity: animation,
                            child: ThirdPage(),
                          );
                        },
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return LoadingPage();
          },
        );

        await Future.delayed(Duration(seconds: 2));

        Navigator.pop(context);// Kembali ke halaman pertama (TestingPage)
        Navigator.pop(context);// Kembali ke halaman pertama (TestingPage)

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Third Page'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Go Back'),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return LoadingPage();
                },
              );

              Future.delayed(Duration(seconds: 2), () {
                Navigator.pop(context);// Kembali ke halaman pertama (TestingPage)
                Navigator.pop(context);
              });
            },
          ),
        ),
      ),
    );
  }
}

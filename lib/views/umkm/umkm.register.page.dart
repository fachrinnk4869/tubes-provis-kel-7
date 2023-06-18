import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tubes_app/views/admin/login.page.dart';
import 'package:tubes_app/views/auth/login_page.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/widgets/button.form.dart';
import 'package:tubes_app/views/widgets/text.form.dart';

import '../umkm/umkm.root.home.dart';

class User2Registration {
  final int? id;
  final String name;
  final String contact;
  final String email;
  final String? password;

  User2Registration(
      {this.id,
      required this.email,
      this.password,
      required this.name,
      required this.contact});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'contact': contact,
      'password': password,
    };
  }

  factory User2Registration.fromJson(Map<String, dynamic> json) {
    return User2Registration(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        contact: json["contact"]);
  }
}

class User2RegistrationModel extends ChangeNotifier {
  bool isLoading = false;
  String message = '';
  String _validationError = '';
  String get validationError => _validationError;
  dynamic _user;
  dynamic get user => _user;
  bool validateForm(User2Registration regis) {
    if (regis.email.isEmpty || regis.password!.isEmpty) {
      _validationError = 'kosong';
    } else {
      _validationError = '';
    }
    // notifyListeners();
    return _validationError.isEmpty;
  }

  Future<void> registerUser(User2Registration registration) async {
    // isLoading = true;
    // notifyListeners();
    if (validateForm(registration)) {
      final url = 'http://127.0.0.1:8000/users/0';
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode(registration.toJson());

      try {
        final response =
            await http.post(Uri.parse(url), headers: headers, body: body);

        if (response.statusCode == 200) {
          // Registration successful, handle the response
          message = 'User registered successfully';
          print(response.body);
          _user = User2Registration.fromJson(jsonDecode(response.body));
          // Navigate to the next screen or perform other actions
        } else {
          // Registration failed, handle the error
          message = 'Failed to register user';
          print(response.body);
          if (response.statusCode == 400) {
            _validationError = 'dipake';
          } else {
            _validationError = '';
          }
          // Display an error message or perform other actions
        }
      } catch (error) {
        message = 'An error occurred during registration';
        print(error.toString());
      }
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }
}

class UmkmRegisterPage extends StatefulWidget {
  const UmkmRegisterPage({super.key});

  @override
  State<UmkmRegisterPage> createState() => _UmkmRegisterPageState();
}

class _UmkmRegisterPageState extends State<UmkmRegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerifyController =
      TextEditingController();
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
                    Consumer<UserUmkmModel>(builder: (context, umkmModel, _) {
                      return Consumer<User2RegistrationModel>(
                          builder: (context, registrationModel, _) {
                        return Container(
                          // height: 20,
                          padding: const EdgeInsets.only(
                              right: 30, left: 30, top: 0, bottom: 7),
                          child: Column(
                            children: [
                              // 2. Nama Lengkap
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Nama Pemilik UMKM"),
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

                              // 3. Contact
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Nomor Telepon Aktif"),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15)),
                              TextForm(
                                controller: contactController,
                                text: '08123456789',
                                obscureText: false,
                                textInputType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 25,
                              ),

                              // 1. Email
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Email"),
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

                              // 4. Password
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Password"),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15)),
                              TextForm(
                                controller: passwordController,
                                text: '****************',
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
                                text: '****************',
                                obscureText: true,
                                textInputType: TextInputType.text,
                              ),

                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 65, right: 65),
                                child: InkWell(
                                  onTap: () {
                                    if (passwordController.text ==
                                        passwordVerifyController.text) {
                                      final registration = User2Registration(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                        contact: contactController.text,
                                      );

                                      registrationModel
                                          .registerUser(registration)
                                          .then((_) {
                                        if (registrationModel.validationError ==
                                            'kosong') {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Warning'),
                                                content: Text(
                                                    'Mohon isi semua data'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // Close the dialog
                                                    },
                                                    child: Text('Close'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else if (registrationModel
                                                .validationError ==
                                            'dipake') {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Warning'),
                                                content: Text(
                                                    'Email sudah digunakan'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // Close the dialog
                                                    },
                                                    child: Text('Close'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          final umkm = UserUmkm();
                                          umkmModel
                                              .createUmkm(umkm,
                                                  registrationModel.user.id)
                                              .then((_) {
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                transitionDuration:
                                                    Duration(milliseconds: 500),
                                                pageBuilder: (context,
                                                    animation,
                                                    secondaryAnimation) {
                                                  return SlideTransition(
                                                    position: Tween<Offset>(
                                                      begin: Offset(1.0, 0.0),
                                                      end: Offset.zero,
                                                    ).animate(animation),
                                                    child: InvestorLoginPage(),
                                                  );
                                                },
                                              ),
                                            );
                                          });
                                        }
                                      });
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Warning'),
                                            content: Text(
                                                'periksa kembali verify passwordnya'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                },
                                                child: Text('Close'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: ButtonForm(text: "Daftar"),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Sudah punya akun?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return LoadingPage();
                                        },
                                      );

                                      Future.delayed(Duration(seconds: 0), () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            transitionDuration: Duration(
                                                milliseconds:
                                                    500), // Durasi animasi transisi
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return SlideTransition(
                                                position: Tween<Offset>(
                                                  begin: Offset(1.0,
                                                      0.0), // Awal posisi halaman
                                                  end: Offset
                                                      .zero, // Akhir posisi halaman (posisi asli)
                                                ).animate(animation),
                                                child: InvestorLoginPage(),
                                              );
                                            },
                                          ),
                                        );
                                      });
                                    },
                                    child: Text(
                                      " Masuk",
                                      style: TextStyle(
                                          color: HexColor("#F7941D"),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        );
                      });
                    }),
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

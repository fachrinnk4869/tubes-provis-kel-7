import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tubes_app/model/model.cicilan.dart';
import 'package:tubes_app/model/model.eventBerlangsung.dart';
import 'package:tubes_app/model/model.investment.dart';
import 'package:tubes_app/model/model.investor.dart';
import 'package:tubes_app/model/model.pengajuanPeminjaman.dart';
import 'package:tubes_app/model/model.riwayatSaldo.dart';
import 'package:tubes_app/model/model.riwayatTampil.dart';
import 'package:tubes_app/views/admin/daftar.investasiku.root.dart';
import 'package:tubes_app/views/admin/investasi.form.page.dart';
import 'package:tubes_app/views/admin/investasiku.page.dart';
import 'package:tubes_app/views/admin/investor.donation.page.dart';
import 'package:tubes_app/views/admin/main/investor.history.page.dart';
import 'package:tubes_app/views/admin/investor.topup.page.dart';
import 'package:tubes_app/views/admin/login.page.dart';
import 'package:tubes_app/views/admin/main/investor_home.dart';
import 'package:tubes_app/views/admin/notifikasi.dart';
import 'package:tubes_app/views/admin/main/investor.profile.dart';
import 'package:tubes_app/views/admin/register.page.dart';
import 'package:tubes_app/views/admin/root.home.dart';
import 'package:tubes_app/views/admin/searchBarJelajah.page.dart';
import 'package:tubes_app/views/main_pages/news_page.dart';
import 'package:tubes_app/views/temp.dart';
import 'package:tubes_app/views/admin/bayar.metode_umkm.dart';
import 'package:tubes_app/views/testing2.dart';
import 'package:tubes_app/views/try.dart';
import 'package:tubes_app/views/umkm/notify.dart';
import 'package:tubes_app/views/umkm/notify.pengajuan.peminjaman.dart';
import 'package:tubes_app/views/umkm/pengajuan_pendanaan.dart';
import 'package:tubes_app/views/umkm/umkm.register.page.dart';
import 'package:tubes_app/views/umkm/umkm.tarik_saldo.page.dart';
import 'package:tubes_app/views/umkm/umkm.root.home.dart';
import 'package:tubes_app/views/utils/landing_page.dart';
import 'package:tubes_app/views/utils/welcome_page.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tubes_app/views/umkm/bayar.cicilan_page.dart';
import 'package:tubes_app/views/admin/register.page.dart';
import 'package:tubes_app/views/admin/investor.donation.page.dart';
import 'package:tubes_app/views/utils/role_page.dart';
import 'package:tubes_app/views/main_home.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/model.user2Registration.dart';
import 'model/model.userLogin.dart';
import 'model/model.eventTampil.dart';
import 'model/model.userRegistration.dart';
import 'model/model.userUmkm.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserRegistrationModel()),
        ChangeNotifierProvider(create: (context) => User2RegistrationModel()),
        ChangeNotifierProvider(create: (context) => UserLoginModel()),
        ChangeNotifierProvider(create: (context) => UserUmkmModel()),
        ChangeNotifierProvider(create: (context) => EventTampilModel()),
        ChangeNotifierProvider(create: (context) => UserInvestorModel()),
        ChangeNotifierProvider(create: (context) => PengajuanPeminjamanModel()),
        ChangeNotifierProvider(create: (context) => InvestmentModel()),
        ChangeNotifierProvider(create: (context) => RiwayatTampilModel()),
        ChangeNotifierProvider(create: (context) => EventBerlangsungModel()),
        ChangeNotifierProvider(create: (context) => RiwayatUmkmModel()),
        ChangeNotifierProvider(create: (context) => CicilanModel()),
        // ChangeNotifierProvider(
        // create: (context) => PeminjamanRegistrationModel()),
        // ChangeNotifierProvider(create: (context) => xxxModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      // primaryColor: HexColor('#F5F5F5'),
      debugShowCheckedModeBanner: false,
      home:
          // MetodePayment(),
          // LandingPage(),
          // RiwayatPage(),
          // InvestorHistoryPage(),
          // InvestorProfilePage(),
          WelcomePage(),
      // RolePage(),
      // CicilanPage(),
      // MetodePayment(),
      // NotifyPage(),
      // NotifyPengajuanPage(),
      // TarikSaldoPage(),
      // RegisterPageInvestor(),
      // InvestorRegistPage(),
      // InvestorLoginPage(),
      // InvestasiFormPage(),
      // InvestorTarikSaldoNotify(),
      // InvestorNotify(),
      // InvestorNotifyUMKM(),
      // InvestorNotifyLonceng(),
      // InvestorDonationPage(),
      // InvestorHome(),
      // InvestorTopupPage(),
      // HomeRootInvestor(),

      // HomeRootUMKM(),
      // UMKMPengajuanPendanaan(),
      // UMKMProfilePage(),
      // InvestasikuPage(),
      // RootInvestasiku(),
      // TestingPage(),
      // MainHome(),
      // NewsPage(),
    );
  }
}

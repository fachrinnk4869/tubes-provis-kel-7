import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:tubes_app/views/admin/root.home.dart';
import 'package:tubes_app/views/utils/loading_page.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({super.key});

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

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
          color: Colors.grey,
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                toolbarHeight: 80, // Atur tinggi AppBar sesuai kebutuhan
                bottom: TabBar(
                  labelColor:
                      HexColor('#202441'), // Ubah warna teks tab menjadi merah
                  indicatorColor: HexColor('#202441'),
                  tabs: [
                    Tab(
                      text: 'T e r k a i t',
                    ),
                    Tab(text: 'P o p u l e r'),
                    Tab(text: 'T e r b a r u'),
                    Tab(text: 'Segera Berakhir'),
                  ],
                  // add it here
                  indicator: MaterialIndicator(
                    color: Colors.black,
                    topRightRadius: 5,
                    topLeftRadius: 5,
                    horizontalPadding: 35,
                    tabPosition: TabPosition.bottom,
                    paintingStyle: PaintingStyle.fill,
                  ),
                ),
                leading: IconButton(
                  icon: ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(HexColor('#202441'), BlendMode.srcIn),
                    child: Image.asset(
                      "public/images/logo_back.png",
                      height: 20,
                    ),
                  ),
                  onPressed: () {
                    Future.delayed(Duration(seconds: 0), () {
                      Navigator.pop(context);
                      // Navigator.pop(context);
                      // Navigator.pop(context);
                    });
                  },
                ),
                title: SearchBar(),
                backgroundColor: Colors.grey,
              ),
              body: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        int radius = 30;
                        return ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                          child: Container(
                              height: constraints
                                  .maxHeight, // Set tinggi container sesuai tinggi perangkat
                              color: Colors.white, // Warna background container
                              child: Center(
                                child: GridView(
                                    padding: const EdgeInsets.all(20),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: HexColor('#202441'),
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(radius
                                                      as double), // Atur nilai radius sesuai keinginan Anda
                                            ),
                                            child: CardPilihanUmkm(
                                                gambar: "Logokemakom.png",
                                                judul:
                                                    "Bergerak di bidang fashion dan Textile",
                                                radius: radius,
                                                terkumpul: 7878,
                                                durasi: 345,
                                                progressValue: 0.7),
                                          ),
                                        ),
                                    ]),
                              )),
                        );
                      },
                    ),
                  ),
                  // Widget untuk Tab 2
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        int radius = 30;
                        return ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                          child: Container(
                              height: constraints
                                  .maxHeight, // Set tinggi container sesuai tinggi perangkat
                              color: Colors.white, // Warna background container
                              child: Center(
                                child: GridView(
                                    padding: const EdgeInsets.all(20),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: HexColor('#202441'),
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(radius
                                                      as double), // Atur nilai radius sesuai keinginan Anda
                                            ),
                                            child: CardPilihanUmkm(
                                                gambar: "Logokemakom.png",
                                                judul:
                                                    "Bergerak di bidang fashion dan Textile",
                                                radius: radius,
                                                terkumpul: 7878,
                                                durasi: 345,
                                                progressValue: 0.7),
                                          ),
                                        ),
                                    ]),
                              )),
                        );
                      },
                    ),
                  ),

                  // Widget untuk Tab 3
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        int radius = 30;
                        return ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                          child: Container(
                              height: constraints
                                  .maxHeight, // Set tinggi container sesuai tinggi perangkat
                              color: Colors.white, // Warna background container
                              child: Center(
                                child: GridView(
                                    padding: const EdgeInsets.all(20),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: HexColor('#202441'),
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(radius
                                                      as double), // Atur nilai radius sesuai keinginan Anda
                                            ),
                                            child: CardPilihanUmkm(
                                                gambar: "Logokemakom.png",
                                                judul:
                                                    "Bergerak di bidang fashion dan Textile",
                                                radius: radius,
                                                terkumpul: 7878,
                                                durasi: 345,
                                                progressValue: 0.7),
                                          ),
                                        ),
                                    ]),
                              )),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        int radius = 30;
                        return ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                          child: Container(
                              height: constraints
                                  .maxHeight, // Set tinggi container sesuai tinggi perangkat
                              color: Colors.white, // Warna background container
                              child: Center(
                                child: GridView(
                                    padding: const EdgeInsets.all(20),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: HexColor('#202441'),
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(radius
                                                      as double), // Atur nilai radius sesuai keinginan Anda
                                            ),
                                            child: CardPilihanUmkm(
                                                gambar: "Logokemakom.png",
                                                judul:
                                                    "Bergerak di bidang fashion dan Textile",
                                                radius: radius,
                                                terkumpul: 7878,
                                                durasi: 345,
                                                progressValue: 0.7),
                                          ),
                                        ),
                                    ]),
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressBarExample extends StatefulWidget {
  double progressValue;
  ProgressBarExample({
    required this.progressValue,
  });
  @override
  ProgressBarExampleState createState() =>
      ProgressBarExampleState(progressValue: progressValue);
}

class ProgressBarExampleState extends State<ProgressBarExample> {
  double progressValue;
  ProgressBarExampleState({
    required this.progressValue,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: LinearProgressIndicator(
          value: progressValue,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(HexColor('#F3AA08')),
        ),
      ),
    );
  }
}

class CardPilihanUmkm extends StatelessWidget {
  String gambar;
  String judul;
  int radius;
  int terkumpul;
  int durasi;
  double progressValue;
  CardPilihanUmkm({
    super.key,
    required this.gambar,
    required this.judul,
    required this.radius,
    required this.terkumpul,
    required this.durasi,
    required this.progressValue,
  });
  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID', // Specify the desired locale
      symbol: 'Rp', // Currency symbol
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: 300,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey, // Tambahkan warna background di sini
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      radius as double), // Atur radius sudut atas kiri
                  topRight: Radius.circular(
                      radius as double), // Atur radius sudut atas kanan
                ),
              ),
              child: Image.asset(
                'public/images/' + gambar,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        SizedBox(height: 25.0),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            judul,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 11,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.019,
              right: MediaQuery.of(context).size.width * 0.019),
          child: ProgressBarExample(progressValue: progressValue),
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  currencyFormat.format(terkumpul),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  durasi.toString() + " hari lagi",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchText = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: 'Cari Investasi UMKM Sesuai Minat Anda ...',
          labelStyle: TextStyle(fontSize: 12),
          prefixIcon: Icon(Icons.search, color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}

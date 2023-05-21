

// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

// class NewsPage extends StatelessWidget {
//   const NewsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: HexColor("#f5f5f5"),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Padding(padding: EdgeInsets.only(top: 10)),
//                     // Text("History"),
//                     Container(
//                       padding: const EdgeInsets.only(top: 50, left: 30),
//                       child: Column(
//                         // mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             children: [
//                               const Text(
//                                 "History",
//                                 style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Poppins'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 35,
//                     ),

//                     Container(
//                       padding: const EdgeInsets.only(left: 40),
//                       child: Column(
//                         // mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             children: [
//                               const Text(
//                                 "Top Up",
//                                 style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     fontFamily: 'Poppins'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 10,
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.only(left: 30.0, right: 30.0),
//                       child: Container(
//                         padding: const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                           color: HexColor("#0F17D0").withAlpha(220),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   alignment: Alignment.center,
//                                   child: Center(
//                                     child: Row(
//                                       children: [
//                                         Image.asset(
//                                           "public/images/send_logo.png",
//                                           height: 35,
//                                         ),
//                                         const Padding(
//                                             padding:
//                                                 EdgeInsets.only(left: 5.0)),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   "Send Money",
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                     color: HexColor("#FFFFFF"),
//                                                     fontSize: 14,
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   "08 Mar 2023 - 18.30",
//                                                   style: TextStyle(
//                                                     color: HexColor("#FFFFFF")
//                                                         .withOpacity(0.5),
//                                                     fontSize: 10,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.19,
//                                             ),
//                                             Text(
//                                               "-Rp. 50.000",
//                                               style: TextStyle(
//                                                 color: HexColor("#FFFFFF"),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 20,
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.only(left: 30.0, right: 30.0),
//                       child: Container(
//                         padding: const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                           color: HexColor("#E01205").withAlpha(220),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   alignment: Alignment.center,
//                                   child: Center(
//                                     child: Row(
//                                       children: [
//                                         Image.asset(
//                                           "public/images/receive_logo.png",
//                                           height: 30,
//                                         ),
//                                         const Padding(
//                                             padding:
//                                                 EdgeInsets.only(left: 10.0)),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   "Receive Money",
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                     color: HexColor("#FFFFFF"),
//                                                     fontSize: 14,
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   "08 Mar 2023 - 18.30",
//                                                   style: TextStyle(
//                                                     color: HexColor("#FFFFFF")
//                                                         .withOpacity(0.5),
//                                                     fontSize: 10,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.17,
//                                             ),
//                                             Text(
//                                               "+Rp. 25.000",
//                                               style: TextStyle(
//                                                 color: HexColor("#FFFFFF"),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 20,
//                     ),

//                     Container(
//                       padding: const EdgeInsets.only(left: 40),
//                       child: Column(
//                         // mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             children: [
//                               const Text(
//                                 "Investasi",
//                                 style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     fontFamily: 'Poppins'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 10,
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.only(left: 30.0, right: 30.0),
//                       child: Container(
//                         padding: const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                           color: HexColor("#DADBF2").withAlpha(220),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   alignment: Alignment.center,
//                                   child: Center(
//                                     child: Row(
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius: BorderRadius.circular(
//                                               15), // Ubah nilai sesuai keinginan
//                                           child: Image.asset(
//                                             "public/images/before_pict.png",
//                                             height: 30,
//                                           ),
//                                         ),
//                                         const Padding(
//                                             padding:
//                                                const EdgeInsets.only(left: 10.0)),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 SizedBox(
//                                                   width: 150,
//                                                   child: Flexible(
//                                                     child: Text(
//                                                       "Komunitas Cilor Pedagang Kaki Lima",
//                                                       textAlign:
//                                                           TextAlign.start,
//                                                       style: TextStyle(
//                                                         color:
//                                                             HexColor("#000000"),
//                                                         fontSize: 14,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   "10 menit lalu sebesar Rp1.000",
//                                                   style: TextStyle(
//                                                     color: HexColor("#000000")
//                                                         .withOpacity(0.5),
//                                                     fontSize: 10,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.01,
//                                             ),
//                                             ElevatedButton(
//                                               onPressed: () {
//                                                 // Aksi yang dijalankan saat tombol ditekan
//                                               },
//                                               style: ElevatedButton.styleFrom(
//                                                 primary: HexColor("#FFFFFF"),
//                                                 onPrimary: HexColor("#5869FF"),
//                                                 shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(30),
//                                                   side: BorderSide(
//                                                     color: HexColor("#3E44CD"),
//                                                   ),
//                                                 ),
//                                               ),
//                                               child: Text(
//                                                 "Berhasil",
//                                                 style: TextStyle(
//                                                   color: HexColor("#5869FF"),
//                                                 ),
//                                               ),
//                                             ),
//                                             // ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 20,
//                     ),

//                     Padding(
//                       padding: EdgeInsets.only(left: 30.0, right: 30.0),
//                       child: Container(
//                         padding: const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                           color: HexColor("#DADBF2").withAlpha(220),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.center,
//                                     child: Center(
//                                       child: Row(
//                                         children: [
//                                           ClipRRect(
//                                             borderRadius: BorderRadius.circular(
//                                                 15), // Ubah nilai sesuai keinginan
//                                             child: Image.asset(
//                                               "public/images/before_pict.png",
//                                               height: 30,
//                                             ),
//                                           ),
//                                           Padding(
//                                               padding:
//                                                   EdgeInsets.only(left: 10.0)),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceAround,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Container(
//                                                     width: 150,
//                                                     child: Flexible(
//                                                       child: Text(
//                                                         "Komunitas Cilor Pedagang Kaki Lima",
//                                                         textAlign:
//                                                             TextAlign.start,
//                                                         style: TextStyle(
//                                                           color:
//                                                               HexColor("#000000"),
//                                                           fontSize: 14,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     "10 menit lalu sebesar Rp1.000",
//                                                     style: TextStyle(
//                                                       color: HexColor("#000000")
//                                                           .withOpacity(0.5),
//                                                       fontSize: 10,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.01,
//                                               ),
//                                               ElevatedButton(
//                                                 onPressed: () {
//                                                   // Aksi yang dijalankan saat tombol ditekan
//                                                 },
//                                                 style: ElevatedButton.styleFrom(
//                                                   primary: HexColor("#FFFFFF"),
//                                                   onPrimary: HexColor("#5869FF"),
//                                                   shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(30),
//                                                     side: BorderSide(
//                                                       color: HexColor("#3E44CD"),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 child: Text(
//                                                   "Berhasil",
//                                                   style: TextStyle(
//                                                     color: HexColor("#5869FF"),
//                                                   ),
//                                                 ),
//                                               ),
//                                               // Text(
//                                               //   "+Rp. 25.000",
//                                               //   style: TextStyle(
//                                               //     color: HexColor("#FFFFFF"),
//                                               //   ),
//                                               // ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 20,
//                     ),

//                     Padding(
//                       padding: EdgeInsets.only(left: 30.0, right: 30.0),
//                       child: Container(
//                         padding: const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                           color: HexColor("#DADBF2").withAlpha(220),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.center,
//                                     child: Center(
//                                       child: Row(
//                                         children: [
//                                           ClipRRect(
//                                             borderRadius: BorderRadius.circular(
//                                                 15), // Ubah nilai sesuai keinginan
//                                             child: Image.asset(
//                                               "public/images/before_pict.png",
//                                               height: 30,
//                                             ),
//                                           ),
//                                           Padding(
//                                               padding:
//                                                   EdgeInsets.only(left: 10.0)),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceAround,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Container(
//                                                     width: 150,
//                                                     child: Flexible(
//                                                       child: Text(
//                                                         "Komunitas Cilor Pedagang Kaki Lima",
//                                                         textAlign:
//                                                             TextAlign.start,
//                                                         style: TextStyle(
//                                                           color:
//                                                               HexColor("#000000"),
//                                                           fontSize: 14,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     "10 menit lalu sebesar Rp1.000",
//                                                     style: TextStyle(
//                                                       color: HexColor("#000000")
//                                                           .withOpacity(0.5),
//                                                       fontSize: 10,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.01,
//                                               ),
//                                               ElevatedButton(
//                                                 onPressed: () {
//                                                   // Aksi yang dijalankan saat tombol ditekan
//                                                 },
//                                                 style: ElevatedButton.styleFrom(
//                                                   primary: HexColor("#FFFFFF"),
//                                                   onPrimary: HexColor("#5869FF"),
//                                                   shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(30),
//                                                     side: BorderSide(
//                                                       color: HexColor("#3E44CD"),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 child: Text(
//                                                   "Berhasil",
//                                                   style: TextStyle(
//                                                     color: HexColor("#5869FF"),
//                                                   ),
//                                                 ),
//                                               ),
//                                               // Text(
//                                               //   "+Rp. 25.000",
//                                               //   style: TextStyle(
//                                               //     color: HexColor("#FFFFFF"),
//                                               //   ),
//                                               // ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 20,
//                     ),

//                     const SizedBox(
//                       height: 50,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
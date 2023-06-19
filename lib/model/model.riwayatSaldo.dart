import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:tubes_app/model/model.riwayatTampil.dart';

class RiwayatUmkm {
  final int? id;
  final int nominal;
  final String deskripsi;
  final String status;
  final int? id_user;

  RiwayatUmkm({
    this.id,
    required this.nominal,
    required this.deskripsi,
    required this.status,
    this.id_user,
  });
  factory RiwayatUmkm.fromJson(Map<String, dynamic> json) {
    return RiwayatUmkm(
      id: json["id"],
      nominal: json["nominal"],
      deskripsi: json["deskripsi"],
      status: json["status"],
      id_user: json["id_user"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'nominal': nominal,
      'deskripsi': deskripsi,
      'status': status,
    };
  }
}

class RiwayatUmkmModel extends ChangeNotifier {
  dynamic _event;
  dynamic get event => _event;

  Future<void> createRiwayatUMKM(RiwayatUmkm registration, int id_user) async {
    // isLoading = true;
    // notifyListeners();
    // print("")
    final url = 'http://127.0.0.1:8000/users/$id_user/riwayatsaldos';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(registration.toJson());

    // try {
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print("========");
    print(response);
    print("========");
    if (response.statusCode == 200) {
      print(response.body);
      _event = RiwayatUmkm.fromJson(jsonDecode(response.body));
      RiwayatTampilModel _tempData = RiwayatTampilModel();
      _tempData.fetchData();
      print("========");
      print(_event);
      print("========");
      // Navigate to the next screen or perform other actions
    } else {
      print(response.body);
    }

    notifyListeners();
  }
}

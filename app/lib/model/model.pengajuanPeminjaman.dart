import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class PengajuanPeminjaman {
  final int? id;
  final String name;
  final String desc;
  final int target;
  final int terkumpul;
  final int keuntungan;
  final int tenor;
  final String status;
  final int id_umkm;

  PengajuanPeminjaman({
    this.id,
    this.name = '',
    this.desc = '',
    this.target = 0,
    this.terkumpul = 0,
    this.keuntungan = 0,
    this.tenor = 0,
    this.status = '',
    this.id_umkm = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'desc': desc,
      'target': target,
      'keuntungan': keuntungan,
      'tenor': tenor,
    };
  }

  factory PengajuanPeminjaman.fromJson(Map<String, dynamic> json) {
    return PengajuanPeminjaman(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        target: json["target"],
        terkumpul: json["terkumpul"],
        keuntungan: json["keuntungan"],
        tenor: json["tenor"],
        status: json["status"],
        id_umkm: json["id_umkm"]);
  }
}

class PengajuanPeminjamanModel extends ChangeNotifier {
  bool isLoading = false;
  String message = '';
  String _validationError = '';
  String get validationError => _validationError;
  dynamic _event;
  dynamic get event => _event;
  bool validateForm(PengajuanPeminjaman regis) {
    if (regis.name.isEmpty ||
        regis.desc.isEmpty ||
        regis.keuntungan == null ||
        regis.tenor == null ||
        regis.target == null) {
      _validationError = 'kosong';
    } else {
      _validationError = '';
    }
    // notifyListeners();
    return _validationError.isEmpty;
  }

  Future<void> registerPeminjaman(
      PengajuanPeminjaman registration, int id_umkm) async {
    // isLoading = true;
    // notifyListeners();
    if (validateForm(registration)) {
      final url = 'http://127.0.0.1:8000/events/$id_umkm';
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode(registration.toJson());

      try {
        final response =
            await http.post(Uri.parse(url), headers: headers, body: body);

        if (response.statusCode == 200) {
          // Registration successful, handle the response
          message = 'event registered successfully';
          print(response.body);
          _event = PengajuanPeminjaman.fromJson(jsonDecode(response.body));
          // Navigate to the next screen or perform other actions
        } else {
          // Registration failed, handle the error
          message = 'Failed to register event';
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

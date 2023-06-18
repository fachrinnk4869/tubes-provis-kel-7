import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class UserUmkm {
  int? id;
  String name;
  String rekening;
  String deskripsi;
  String jenis;
  String alamat;
  int saldo;
  String tahun_berdiri;

  UserUmkm({
    this.id,
    this.name = '',
    this.rekening = '',
    this.deskripsi = '',
    this.jenis = '',
    this.alamat = '',
    this.saldo = 0,
    this.tahun_berdiri = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rekening': rekening,
      'deskripsi': deskripsi,
      'jenis': jenis,
      'alamat': alamat,
      'saldo': saldo,
      'tahun_berdiri': tahun_berdiri,
    };
  }

  factory UserUmkm.fromJson(Map<String, dynamic> json) {
    return UserUmkm(
      id: json['id'],
      name: json['name'],
      rekening: json['rekening'],
      deskripsi: json['deskripsi'],
      jenis: json['jenis'],
      alamat: json['alamat'],
      saldo: json['saldo'],
      tahun_berdiri: json['tahun_berdiri'],
    );
  }
}

class UserUmkmModel extends ChangeNotifier {
  bool isLoading = false;
  String message = '';
  dynamic _user;
  dynamic get user => _user;
  dynamic _saldo;
  dynamic get saldo => _saldo;
  String _validationError = '';
  String get validationError => _validationError;

  Future<void> setUser(UserUmkm umkm) async {
    _user = umkm;
    notifyListeners();
  }

  Future<void> setSaldo(int saldo) async {
    _saldo = saldo;
    notifyListeners();
  }

  Future<void> createUmkm(UserUmkm umkm, dynamic user_id) async {
    // isLoading = true;
    // notifyListeners();
    final url = 'http://127.0.0.1:8000/users/$user_id/umkm';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(umkm.toJson());
    // notifyListeners();

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        // Umkm successful, handle the response
        message = 'User Umkm successfully';
        print(response.body);
        _user = UserUmkm.fromJson(jsonDecode(response.body));
        // Navigate to the next screen or perform other actions
      } else {
        // Umkm failed, handle the error
        message = 'Failed to register user';
        print(response.body);
        // Display an error message or perform other actions
      }
    } catch (error) {
      message = 'An error occurred during umkm';
      print(error.toString());
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }

  Future<void> getUmkmbyIdUser(dynamic user_id) async {
    // isLoading = true;
    // notifyListeners();
    final url = 'http://127.0.0.1:8000/users/$user_id/umkm';
    // final headers = {'Content-Type': 'application/json'};
    // final body = jsonEncode(umkm.toJson());

    try {
      final response = await http.get(Uri.parse(url));
      // notifyListeners();

      if (response.statusCode == 200) {
        // Umkm successful, handle the response
        message = 'User Umkm successfully';
        print(response.body);
        _user = UserUmkm.fromJson(jsonDecode(response.body));
        // Navigate to the next screen or perform other actions
      } else {
        // Umkm failed, handle the error
        message = 'Failed to register user';
        print(response.body);
        // Display an error message or perform other actions
      }
    } catch (error) {
      message = 'An error occurred during umkm';
      print(error.toString());
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }

  Future<void> getUmkm(dynamic umkm_id) async {
    // isLoading = true;
    // notifyListeners();
    final url = 'http://127.0.0.1:8000/umkms/$umkm_id';
    // final headers = {'Content-Type': 'application/json'};
    // final body = jsonEncode(umkm.toJson());

    try {
      final response = await http.get(Uri.parse(url));
      // notifyListeners();

      if (response.statusCode == 200) {
        // Umkm successful, handle the response
        message = 'User Umkm successfully';
        print(response.body);
        _user = UserUmkm.fromJson(jsonDecode(response.body));
        // Navigate to the next screen or perform other actions
      } else {
        // Umkm failed, handle the error
        message = 'Failed to register user';
        print(response.body);
        // Display an error message or perform other actions
      }
    } catch (error) {
      message = 'An error occurred during umkm';
      print(error.toString());
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }

  Future<void> updateUmkm(UserUmkm umkm, dynamic umkm_id) async {
    // isLoading = true;
    // notifyListeners();

    final url = 'http://127.0.0.1:8000/umkms/$umkm_id';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(umkm.toJson());

    try {
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);
      // notifyListeners();

      if (response.statusCode == 200) {
        // Umkm successful, handle the response
        message = 'User Umkm successfully';
        print(response.body);
        _user = UserUmkm.fromJson(jsonDecode(response.body));
        // Navigate to the next screen or perform other actions
      } else {
        // Umkm failed, handle the error
        message = 'Failed to register user';
        print(response.body);
        // Display an error message or perform other actions
      }
    } catch (error) {
      message = 'An error occurred during umkm';
      print(error.toString());
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }

  Future<void> updateSaldoUmkm(UserUmkm umkm, dynamic umkm_id) async {
    // isLoading = true;
    // notifyListeners();

    final url = 'http://127.0.0.1:8000/umkms/$umkm_id/saldo';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(umkm.toJson());

    try {
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);
      // notifyListeners();

      if (response.statusCode == 200) {
        // Umkm successful, handle the response
        message = 'User Umkm successfully';
        print(response.body);
        _user = UserUmkm.fromJson(jsonDecode(response.body));
        // Navigate to the next screen or perform other actions
      } else {
        // Umkm failed, handle the error
        message = 'Failed to register user';
        print(response.body);
        // Display an error message or perform other actions
      }
    } catch (error) {
      message = 'An error occurred during umkm';
      print(error.toString());
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class UserInvestor {
  int? id;
  String ktp;
  String alamat;
  int saldo;

  UserInvestor({
    this.id,
    this.ktp = '',
    this.alamat = '',
    this.saldo = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'ktp': ktp,
      'alamat': alamat,
      'saldo': saldo,
    };
  }

  factory UserInvestor.fromJson(Map<String, dynamic> json) {
    return UserInvestor(
      id: json['id'],
      ktp: json['ktp'],
      alamat: json['alamat'],
      saldo: json['saldo'],
    );
  }
}

class UserInvestorModel extends ChangeNotifier {
  bool isLoading = false;
  String message = '';
  dynamic _user;
  dynamic get user => _user;
  dynamic _saldo;
  dynamic get saldo => _saldo;
  String _validationError = '';
  String get validationError => _validationError;

  Future<void> setUser(UserInvestor investor) async {
    _user = investor;
    notifyListeners();
  }

  Future<void> setSaldo(int saldo) async {
    _saldo = saldo;
    notifyListeners();
  }

  Future<void> createInvestor(UserInvestor investor, dynamic user_id) async {
    // isLoading = true;
    // notifyListeners();
    final url = 'http://127.0.0.1:8000/users/$user_id/investor';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(investor.toJson());
    // notifyListeners();

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        // Investor successful, handle the response
        message = 'User Investor successfully';
        print(response.body);
        _user = UserInvestor.fromJson(jsonDecode(response.body));
        // Navigate to the next screen or perform other actions
      } else {
        // Investor failed, handle the error
        message = 'Failed to register user';
        print(response.body);
        // Display an error message or perform other actions
      }
    } catch (error) {
      message = 'An error occurred during investor';
      print(error.toString());
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }

  Future<void> getInvestor(dynamic user_id) async {
    // isLoading = true;
    // notifyListeners();
    final url = 'http://127.0.0.1:8000/users/$user_id/investor';
    // final headers = {'Content-Type': 'application/json'};
    // final body = jsonEncode(investor.toJson());

    try {
      final response = await http.get(Uri.parse(url));
      // notifyListeners();

      if (response.statusCode == 200) {
        // Investor successful, handle the response
        message = 'User Investor successfully';
        print(response.body);
        _user = UserInvestor.fromJson(jsonDecode(response.body));
        // Navigate to the next screen or perform other actions
      } else {
        // Investor failed, handle the error
        message = 'Failed to register user';
        print(response.body);
        // Display an error message or perform other actions
      }
    } catch (error) {
      message = 'An error occurred during investor';
      print(error.toString());
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }

  Future<void> updateInvestor(
      UserInvestor investor, dynamic investor_id) async {
    // isLoading = true;
    // notifyListeners();

    final url = 'http://127.0.0.1:8000/investors/$investor_id';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(investor.toJson());

    try {
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);
      // notifyListeners();

      if (response.statusCode == 200) {
        // Investor successful, handle the response
        message = 'User Investor successfully';
        print(response.body);
        _user = UserInvestor.fromJson(jsonDecode(response.body));
        // Navigate to the next screen or perform other actions
      } else {
        // Investor failed, handle the error
        message = 'Failed to register user';
        print(response.body);
        // Display an error message or perform other actions
      }
    } catch (error) {
      message = 'An error occurred during investor';
      print(error.toString());
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }

  Future<void> updateSaldoInvestor(
      UserInvestor investor, dynamic investor_id) async {
    // isLoading = true;
    // notifyListeners();

    final url = 'http://127.0.0.1:8000/investors/$investor_id/saldo';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(investor.toJson());

    try {
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);
      // notifyListeners();

      if (response.statusCode == 200) {
        // Investor successful, handle the response
        message = 'User Investor successfully';
        print(response.body);
        _user = UserInvestor.fromJson(jsonDecode(response.body));
        // Navigate to the next screen or perform other actions
      } else {
        // Investor failed, handle the error
        message = 'Failed to register user';
        print(response.body);
        // Display an error message or perform other actions
      }
    } catch (error) {
      message = 'An error occurred during investor';
      print(error.toString());
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class UserLogin {
  final int? id;
  final String email;
  final String? password;
  final String? name;
  final String? contact;
  final bool? isInvestor;

  UserLogin(
      {this.id,
      required this.email,
      this.password,
      this.isInvestor,
      this.name,
      this.contact});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        contact: json["contact"],
        isInvestor: json["isInvestor"]);
  }
}

class UserLoginModel extends ChangeNotifier {
  bool isLoading = false;
  String message = '';
  dynamic _user;
  dynamic get user => _user;
  String _validationError = '';
  String get validationError => _validationError;

  bool validateForm(UserLogin regis) {
    if (regis.email.isEmpty || regis.password!.isEmpty) {
      _validationError = 'kosong';
    } else {
      _validationError = '';
    }
    // notifyListeners();
    return _validationError.isEmpty;
  }

  Future<void> loginUser(UserLogin login) async {
    // isLoading = true;
    // notifyListeners();
    if (validateForm(login)) {
      final url = 'http://127.0.0.1:8000/login-user';
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode(login.toJson());

      try {
        final response =
            await http.post(Uri.parse(url), headers: headers, body: body);

        if (response.statusCode == 200) {
          // Login successful, handle the response
          message = 'User Login successfully';
          // print(response.body);
          _user = UserLogin.fromJson(jsonDecode(response.body));
          // Navigate to the next screen or perform other actions
        } else {
          // Login failed, handle the error
          message = 'Failed to register user';
          // print(response.body);
          if (response.statusCode == 404) {
            _validationError = 'gaketemu';
          } else if (response.statusCode == 400) {
            _validationError = 'passwordsalah';
          } else {
            _validationError = '';
          }
          // Display an error message or perform other actions
        }
      } catch (error) {
        message = 'An error occurred during login';
        print(error.toString());
      }
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }
}

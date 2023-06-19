import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class UserRegistration {
  final int? id;
  final String name;
  final String contact;
  final String email;
  final String? password;

  UserRegistration(
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

  factory UserRegistration.fromJson(Map<String, dynamic> json) {
    return UserRegistration(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        contact: json["contact"]);
  }
}

class UserRegistrationModel extends ChangeNotifier {
  bool isLoading = false;
  String message = '';
  String _validationError = '';
  String get validationError => _validationError;
  dynamic _user;
  dynamic get user => _user;
  bool validateForm(UserRegistration regis) {
    if (regis.email.isEmpty || regis.password!.isEmpty) {
      _validationError = 'kosong';
    } else {
      _validationError = '';
    }
    // notifyListeners();
    return _validationError.isEmpty;
  }

  Future<void> registerUser(UserRegistration registration) async {
    // isLoading = true;
    // notifyListeners();
    if (validateForm(registration)) {
      final url = 'http://127.0.0.1:8000/users/1';
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode(registration.toJson());

      try {
        final response =
            await http.post(Uri.parse(url), headers: headers, body: body);

        if (response.statusCode == 200) {
          // Registration successful, handle the response
          message = 'User registered successfully';
          print(response.body);
          _user = UserRegistration.fromJson(jsonDecode(response.body));
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

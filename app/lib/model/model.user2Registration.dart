import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

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

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Cicilan {
  final int? id;
  final double total;

  Cicilan({
    this.id,
    this.total = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total': total,
    };
  }

  factory Cicilan.fromJson(Map<String, dynamic> json) {
    return Cicilan(
        total: json["total"],);
  }
}

class CicilanModel extends ChangeNotifier {
  dynamic _event;
  dynamic get event => _event;

  Future<void> getCicilan(dynamic id_umkm) async {
    // isLoading = true;
    // notifyListeners();
    final url = 'http://127.0.0.1:8000/umkms/$id_umkm/total-monthly-installment';
    // final headers = {'Content-Type': 'application/json'};
    // final body = jsonEncode(event.toJson());

    try {
      final response = await http.get(Uri.parse(url));
      // notifyListeners();

      if (response.statusCode == 200) {
        // Event successful, handle the response
        print(response.body);
        _event = Cicilan.fromJson(jsonDecode(response.body));
        // Navigate to the next screen or perform other actions
      } else {
        // Event failed, handle the error
        // message = 'Failed to register user';
        print(response.body);
        // Display an error message or perform other actions
      }
    } catch (error) {
      // message = 'An error occurred during event';
      print(error.toString());
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }
  Future<void> createInvestor(dynamic id_umkm) async {
    // isLoading = true;
    // notifyListeners();
    final url = 'http://127.0.0.1:8000/umkms/$id_umkm/distribute-profits';
    final headers = {'Content-Type': 'application/json'};
    // final body = jsonEncode(investor.toJson());
    // notifyListeners();

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        // Investor successful, handle the response
        // message = 'User Investor successfully';
        print(response.body);
        _event = Cicilan.fromJson(jsonDecode(response.body));
        // Navigate to the next screen or perform other actions
      } else {
        // Investor failed, handle the error
        // message = 'Failed to register user';
        print(response.body);
        // Display an error message or perform other actions
      }
    } catch (error) {
      // message = 'An error occurred during investor';
      print(error.toString());
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }
}

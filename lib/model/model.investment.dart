import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Investment {
  final int id;
  final String jumlah_investasi;
  final String tanggal_investasi;

  Investment({
    required this.id,
    required this.jumlah_investasi,
    required this.tanggal_investasi,
  });
  factory Investment.fromJson(Map<String, dynamic> json) {
    return Investment(
      id: json["id"],
      jumlah_investasi: json["jumlah_investasi"],
      tanggal_investasi: json["tanggal_investasi"],
    );
  }
}

class InvestmentModel with ChangeNotifier {
  List<Investment> _investments = [];

  List<Investment> get investments => _investments;
  dynamic _investment;

  Investment get investment => _investment;
  Future<List<Investment>> fetchData() async {
    var response = await http.get(Uri.parse('http://127.0.0.1:8000/investments'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      _investments = List<Investment>.from(
          jsonResponse.map((json) => Investment.fromJson(json))).toList();
      notifyListeners();
    }
    // print(_investments[0].name);
    return _investments;
  }
  Future<void> getInvestment(dynamic investment_id) async {
    // isLoading = true;
    // notifyListeners();
    final url = 'http://127.0.0.1:8000/investments/$investment_id/investment';
    // final headers = {'Content-Type': 'application/json'};
    // final body = jsonEncode(investment.toJson());

    try {
      final response = await http.get(Uri.parse(url));
      // notifyListeners();

      if (response.statusCode == 200) {
        // Investment successful, handle the response
        _investment = Investment.fromJson(jsonDecode(response.body));
        // Navigate to the next screen or perform other actions
      } else {
        // Investment failed, handle the error
        // message = 'Failed to register user';
        print(response.body);
        // Display an error message or perform other actions
      }
    } catch (error) {
      // message = 'An error occurred during investment';
      print(error.toString());
    }
    // callback();
    // isLoading = false;
    notifyListeners();
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class RiwayatTampil {
  final int id;
  final int nominal;
  final String deskripsi;
  final String status;
  final int id_user;

  RiwayatTampil({
    required this.id,
    required this.nominal,
    required this.deskripsi,
    required this.status,
    required this.id_user,
  });
  factory RiwayatTampil.fromJson(Map<String, dynamic> json) {
    return RiwayatTampil(
      id: json["id"],
      nominal: json["nominal"],
      deskripsi: json["deskripsi"],
      status: json["status"],
      id_user: json["id_user"],
    );
  }
}

class RiwayatTampilModel with ChangeNotifier {
  List<RiwayatTampil> _events = [];

  List<RiwayatTampil> get events => _events;
  dynamic _event;

  RiwayatTampil get event => _event;
  Future<List<RiwayatTampil>> fetchData() async {
    var response =
        await http.get(Uri.parse('http://127.0.0.1:8000/riwayatsaldos'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      _events = List<RiwayatTampil>.from(
          jsonResponse.map((json) => RiwayatTampil.fromJson(json))).toList();
      notifyListeners();
    }
    // print(_events[0].name);
    return _events;
  }

  Future<void> getRiwayat(dynamic users_id) async {
    // isLoading = true;
    // notifyListeners();
    print('mauskkkkk');
    final url = 'http://127.0.0.1:8000/users/$users_id/riwayatsaldos';
    // final headers = {'Content-Type': 'application/json'};
    // final body = jsonEncode(event.toJson());

    try {
      final response = await http.get(Uri.parse(url));
      // notifyListeners();

      if (response.statusCode == 200) {
        // Event successful, handle the response
        List jsonResponse = jsonDecode(response.body);
        _events = List<RiwayatTampil>.from(
            jsonResponse.map((json) => RiwayatTampil.fromJson(json))).toList();

        notifyListeners();
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
}

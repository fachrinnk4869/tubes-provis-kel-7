import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class EventTampil {
  final int id;
  final String name;
  final String desc;
  final int target;
  final int terkumpul;
  final int tenor;
  final int id_umkm;
  final int keuntungan;

  EventTampil({
    required this.id,
    required this.name,
    required this.desc,
    required this.target,
    required this.terkumpul,
    required this.tenor,
    required this.id_umkm,
    required this.keuntungan,
  });
  factory EventTampil.fromJson(Map<String, dynamic> json) {
    return EventTampil(
      id: json["id"],
      name: json["name"],
      desc: json["desc"],
      target: json["target"],
      terkumpul: json["terkumpul"],
      tenor: json["tenor"],
      id_umkm: json["id_umkm"],
      keuntungan: json["keuntungan"],
    );
  }
}

class EventTampilModel with ChangeNotifier {
  List<EventTampil> _events = [];

  List<EventTampil> get events => _events;
  dynamic _event;

  EventTampil get event => _event;
  Future<List<EventTampil>> fetchData() async {
    var response = await http.get(Uri.parse('http://127.0.0.1:8000/events'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      _events = List<EventTampil>.from(
          jsonResponse.map((json) => EventTampil.fromJson(json))).toList();
      notifyListeners();
    }
    // print(_events[0].name);
    return _events;
  }
  Future<void> getEvent(dynamic event_id) async {
    // isLoading = true;
    // notifyListeners();
    final url = 'http://127.0.0.1:8000/events/$event_id/event';
    // final headers = {'Content-Type': 'application/json'};
    // final body = jsonEncode(event.toJson());

    try {
      final response = await http.get(Uri.parse(url));
      // notifyListeners();

      if (response.statusCode == 200) {
        // Event successful, handle the response
        _event = EventTampil.fromJson(jsonDecode(response.body));
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

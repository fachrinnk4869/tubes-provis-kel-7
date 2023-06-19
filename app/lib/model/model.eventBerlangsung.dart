import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class EventBerlangsung {
  final int id;
  final String name;
  final String desc;
  final int target;
  final int terkumpul;
  final int tenor;
  final int id_umkm;
  final int keuntungan;
  final String status;

  EventBerlangsung({
    required this.id,
    required this.name,
    required this.desc,
    required this.target,
    required this.terkumpul,
    required this.tenor,
    required this.id_umkm,
    required this.keuntungan,
    required this.status,
  });
  factory EventBerlangsung.fromJson(Map<String, dynamic> json) {
    return EventBerlangsung(
      id: json["id"],
      name: json["name"],
      desc: json["desc"],
      target: json["target"],
      terkumpul: json["terkumpul"],
      tenor: json["tenor"],
      id_umkm: json["id_umkm"],
      keuntungan: json["keuntungan"],
      status: json["status"],
    );
  }
}

class EventBerlangsungModel with ChangeNotifier {
  List<EventBerlangsung> _events = [];
  List<EventBerlangsung> _eventsOnGoing = [];

  List<EventBerlangsung> get events => _events;
  List<EventBerlangsung> get eventsOnGoing => _eventsOnGoing;
  dynamic _event;

  EventBerlangsung get event => _event;
  Future<List<EventBerlangsung>> fetchData() async {
    var response = await http.get(Uri.parse('http://127.0.0.1:8000/events'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      _events = List<EventBerlangsung>.from(
          jsonResponse.map((json) => EventBerlangsung.fromJson(json))).toList();
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
        _event = EventBerlangsung.fromJson(jsonDecode(response.body));
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

  Future<void> getEventBerlangsung(dynamic id_umkm, dynamic status) async {
    // isLoading = true;
    // notifyListeners();
    // print("Masuk bang");
    final url = 'http://127.0.0.1:8000/events/$id_umkm/$status';
    // print(url);
    // final headers = {'Content-Type': 'application/json'};
    // final body = jsonEncode(event.toJson());

    try {
      final response = await http.get(Uri.parse(url));
      // print(response);
      // print("=======");
      // notifyListeners();

      if (response.statusCode == 200) {
        // Event successful, handle the response
        List jsonResponse = jsonDecode(response.body);
        _eventsOnGoing = List<EventBerlangsung>.from(
                jsonResponse.map((json) => EventBerlangsung.fromJson(json)))
            .toList();
        notifyListeners();
        // _event = EventBerlangsung.fromJson(jsonDecode(response.body));
        // print(_eventsOnGoing);
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

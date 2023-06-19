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
  
  final String status;

  EventTampil({
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
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'target': target,
      'terkumpul': terkumpul,
      'tenor': tenor,
      'id_umkm': id_umkm,
      'keuntungan': keuntungan,
      'status': status,
      
    };
  }
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
      
      status: json["status"],
    );
  }
}

class EventTampilModel with ChangeNotifier {
  List<EventTampil> _events = [];

  List<EventTampil> get events => _events;
   List<EventTampil> _eventsOnGoing = [];
   List<EventTampil> get eventsOnGoing => _eventsOnGoing;
  dynamic _event;

  dynamic get event => _event;
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
  Future<void> updateTerkumpul(
      EventTampil event, dynamic event_id) async {
    // isLoading = true;
    // notifyListeners();

    final url = 'http://127.0.0.1:8000/events/$event_id/terkumpul';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(event.toJson());

    try {
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);
      // notifyListeners();

      if (response.statusCode == 200) {
        // Investor successful, handle the response
        // message = 'User Investor successfully';
        print(response.body);
        _event = EventTampil.fromJson(jsonDecode(response.body));
        fetchData();
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
Future<void> getEventBerlangsung(dynamic id_umkm, dynamic status) async {
  // isLoading = true;
  // notifyListeners();
  print("Masuk bang");
  final url = 'http://127.0.0.1:8000/events/$id_umkm/$status';
  // print(url);
  // final headers = {'Content-Type': 'application/json'};
  // final body = jsonEncode(event.toJson());

  try {
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print("=======");
    // notifyListeners();

    if (response.statusCode == 200) {
      // Event successful, handle the response
      List<dynamic> jsonResponse = jsonDecode(response.body);
      _eventsOnGoing = jsonResponse
          .map((json) => EventTampil.fromJson(json))
          .toList();
      print(_eventsOnGoing.length);
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

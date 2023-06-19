import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:tubes_app/views/auth/register_page.dart';

// void main() {
//   runApp(Testing());
// }

class User {
  final String username;
  final String password;

  User({required this.username, required this.password});

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}

// class RegisterModel extends ChangeNotifier {
//   final url = Uri.parse('http://192.168.1.7:8000/register/');

//   void fetchData() async {
//     final response = await http.post(
//       Uri.parse('http://192.168.1.7:8000/register/'),
//       body: {
//         'username': 'nama_pengguna',
//         'password': 'kata_sandi',
//       },
//     );

//     if (response.statusCode == 200) {
//       // Lakukan sesuatu jika permintaan berhasil
//     } else {
//       throw Exception('Gagal mendaftar');
//     }
//   }
// }

Future<String> registerUser(BuildContext context, User user) async {
  final url = Uri.parse('http://192.168.1.7:8000/register/');
  // 192.168.1.7
  final headers = {'Content-Type': 'application/json'};
  final jsonBody = json.encode(user.toJson());

  final response = await http.post(url, headers: headers, body: jsonBody);

  if (response.statusCode == 201) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TestingHomePage()),
    );
    return 'Registration successful';
  } else {
    throw Exception('Failed to register user');
  }
}

Future<String> loginUser(User user) async {
  final response = await http.post(
    Uri.parse('http://localhost:8000/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(user.toJson()),
  );

  if (response.statusCode == 200) {
    return 'Login successful';
  } else if (response.statusCode == 401) {
    throw Exception('Invalid username or password');
  } else {
    throw Exception('Failed to login');
  }
}

class ModelProcess extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModelProcess(),
      child: MaterialApp(
        title: 'Login and Register',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<ModelProcess>(
          builder: (context, authProvider, _) {
            return LoginPage();
            // if (authProvider.isLoggedIn) {
            //   return TestingHomePage();
            // } else {
            // }
          },
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late ModelProcess _authProvider;
  bool isRegistered = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = ''; // Tambahkan variabel errorMessage

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authProvider = Provider.of<ModelProcess>(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModelProcess(),
      child: MaterialApp(
        title: 'Login and Register',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<ModelProcess>(
          builder: (context, authProvider, _) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Login and Register'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(labelText: 'Username'),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      errorMessage, // Tampilkan errorMessage di sini
                      style: TextStyle(
                        color: Colors
                            .red, // Ganti warna teks peringatan sesuai keinginan
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              User user = User(
                                username: _usernameController.text,
                                password: _passwordController.text,
                              );
                              await registerUser(context, user);
                              // print(result);
                              // setState(() {
                              //   _authProvider.isLoggedIn = true;
                              // });
                              // Provider.of<AuthProvider>(context, listen: false)
                              //     .isLoggedIn = true;
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => TestingHomePage()),
                              // );
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                          child: Text('Register'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              User user = User(
                                username: _usernameController.text,
                                password: _passwordController.text,
                              );
                              String result = await loginUser(user);
                              print(result);
                              Provider.of<ModelProcess>(context, listen: false)
                                  .isLoggedIn = true;
                            } catch (e) {
                              setState(() {
                                if (e.toString() ==
                                    'Invalid username or password') {
                                  errorMessage = 'Username atau password salah';
                                } else {
                                  errorMessage = 'Gagal login';
                                }
                              });
                            }
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Logged In: ${authProvider.isLoggedIn}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TestingHomePage extends StatefulWidget {
  @override
  _TestingHomePageState createState() => _TestingHomePageState();
}

class _TestingHomePageState extends State<TestingHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}

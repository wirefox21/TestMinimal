import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange, brightness: Brightness.dark),
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameConroller = TextEditingController();

  @override
  void dispose() {
    _usernameConroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Username"),
              const SizedBox(height: 10),
              TextField(
                controller: _usernameConroller,
                decoration: const InputDecoration(
                  labelText: "Input your username",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              CupertinoButton.filled(
                child: const Text("Login"),
                onPressed: () {
                  String username = _usernameConroller.text;
                  print("Username : $username");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

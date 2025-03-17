import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); //

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key}); //

  @override
  State<HomePage> createState() => HomePageState(); //
}

class HomePageState extends State<HomePage> {
  String message = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchMessage();
  }

  Future<void> fetchMessage() async {
    setState(() {
      message = "Attempting to connect...";
    });

    try {
      print("Connecting to server...");
      final url =
          Uri.parse("http://10.0.2.2:5000/api/message"); // Updated port to 5000
      final response = await http.get(url).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          throw TimeoutException('Connection timed out');
        },
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        print("Decoded data: $decodedData");
        setState(() {
          message = decodedData['message'] ?? 'No message found in response';
        });
      } else {
        setState(() {
          message = "Server error: ${response.statusCode}\n${response.body}";
        });
      }
    } catch (e) {
      print("Error details: $e");
      setState(() {
        message = "Connection error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter & Node.js")),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

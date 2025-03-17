import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = 'http://localhost:3000'; // Add your backend URL here

Future<void> fetchItems() async {
  try {
    final response = await http.get(Uri.parse("$baseUrl/api/items"));

    if (response.statusCode == 200) {
      print("Data loaded: ${response.body}");
    } else {
      print("Error ${response.statusCode}: ${response.body}");
    }
  } catch (e) {
    print("Exception: $e");
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotService {
  static const String baseUrl =
      "https://a671-34-124-205-132.ngrok-free.app/ask";

  static Future<String> sendMessage(String message) async {
    final Uri url = Uri.parse(baseUrl);

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({"question": message}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["answer"]; // Ensure this matches the API response key
    } else {
      throw Exception("Failed to get response from chatbot");
    }
  }
}

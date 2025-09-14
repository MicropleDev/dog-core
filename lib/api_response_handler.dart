import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiResponseHandler {

  static T handleResponse<T>(
    http.Response response,
    T Function(dynamic) fromJson,
  ) {
    final int statusCode = response.statusCode;
    final String body = response.body;

    if (statusCode >= 200 && statusCode < 300) {
      final jsonData = jsonDecode(body);
      return fromJson(jsonData);
    } else {
      final jsonData = _safeJsonDecode(body);
      throw Exception(jsonData['message'] ?? 'Unknown error occurred');
    }
  }

  static Map<String, dynamic> _safeJsonDecode(String source) {
    try {
      return jsonDecode(source);
    } catch (_) {
      return {
        "message": "Malformed server response",
      };
    }
  }
}

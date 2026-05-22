// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {

  static const String baseUrl =
      'http://10.10.12.15:8085/api/v1';

  

  static Future<Map<String, dynamic>> signUp({
  required String fullName,
  required String email,
  required String password,
  required String userType,
}) async {
    try {

      final response = await http.post(
        Uri.parse('$baseUrl/auth/signup'),

        headers: {
          'Content-Type': 'application/json',
        },

        body: jsonEncode({
          'full_name': fullName,
          'user_type': userType,
          'email': email,
          'password': password,
        }),
      );

      print(
  'SIGNUP STATUS => ${response.statusCode}',
);

print(
  'SIGNUP RESPONSE => ${response.body}',
);

final Map<String, dynamic> data =
    jsonDecode(response.body);

return {
  'statusCode': response.statusCode,
  ...data,
};

    } catch (e) {

      throw Exception(
        'Signup failed: $e',
      );
    }
  }

  

  static Future<Map<String, dynamic>> verifyOtp({
  required String email,
  required String otp,
}) async {
  try {

    final response = await http.post(
      Uri.parse('$baseUrl/auth/otp-verify'),

      headers: {
        'Content-Type': 'application/json',
      },

      body: jsonEncode({
        'email': email,
        'otp': otp,
      }),
    );

    print(
      'OTP STATUS => ${response.statusCode}',
    );

    print(
      'OTP RESPONSE => ${response.body}',
    );

    final Map<String, dynamic> data =
        jsonDecode(response.body);

    return {
      'statusCode': response.statusCode,
      ...data,
    };

  } catch (e) {

    throw Exception(
      'OTP verification failed: $e',
    );
  }
}



  static Future<Map<String, dynamic>> resendOtp({
  required String email,
}) async {
  try {

    final response = await http.post(
      Uri.parse('$baseUrl/auth/resend-otp'),

      headers: {
        'Content-Type': 'application/json',
      },

      body: jsonEncode({
        'email': email,
      }),
    );

    print(
      'RESEND OTP STATUS => ${response.statusCode}',
    );

    print(
      'RESEND OTP RESPONSE => ${response.body}',
    );

    final Map<String, dynamic> data =
        jsonDecode(response.body);

    return {
      'statusCode': response.statusCode,
      ...data,
    };

  } catch (e) {

    throw Exception(
      'Resend OTP failed: $e',
    );
  }
}

  static Future<Map<String, dynamic>> login({
  required String email,
  required String password,
}) async {
  try {

    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),

      headers: {
        'Content-Type': 'application/json',
      },

      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    print(
      'LOGIN STATUS => ${response.statusCode}',
    );

    print(
      'LOGIN RESPONSE => ${response.body}',
    );

    final Map<String, dynamic> data =
        jsonDecode(response.body);

    return {
      'statusCode': response.statusCode,
      ...data,
    };

  } catch (e) {

    throw Exception(
      'Login failed: $e',
    );
  }
}
}
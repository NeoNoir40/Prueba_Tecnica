import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _endpoint = 'https://binteapi.com:4011/api';

  static Future<List<dynamic>> fetchSongsData(int examId, {int page = 1, int limit = 2}) async {
    final url = Uri.parse('$_endpoint/songs/examen/$examId?page=$page&limit=$limit');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return result['data'] as List<dynamic>;
      } else {
        throw Exception('Error en la petición : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al obtener las canciones: $e');
    }
  }

  static Future<Map<String, dynamic>> fetchSongsDataDetail(String songId) async {
    final url = Uri.parse('$_endpoint/songs/examen/detail/$songId');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return result['data'] as Map<String, dynamic>;
      } else {
        throw Exception('Error en la petición : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al obtener las canciones: $e');
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

class Conexion {
  final url = Uri.https(
    'dddd9ba6-bfba-46fd-9a2a-0b9ed5a70dfa.mock.pstmn.io',
    '/prestamos',
  );
  var jsonResponse = [];
  Future getDataPrestamos() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonResponse = jsonDecode(response.body);
      } else {
        throw Exception();
      }
    } catch (ex) {
      rethrow;
    }
  }
}

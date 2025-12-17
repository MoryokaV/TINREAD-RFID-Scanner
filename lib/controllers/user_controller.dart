import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tinread_rfid_scanner/utils/api_exceptions.dart';

class UserController {
  Future<void> login(String username, String password, String serverURL) async {
    try {
      final response = await http.post(
        Uri.parse("$serverURL/itemService.svc?auth&username=$username&password=$password"),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data['info'] == "authenticated") {
          return;
        } else {
          throw UnauthorizedException();
        }
      } else {
        throw ServerException(response.statusCode);
      }
    } on Exception catch (_) {
      // SockerExceptions & ApiExceptions
      rethrow;
    }
  }
}

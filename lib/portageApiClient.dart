import 'dart:convert';

import 'package:premier_test/Models/utilisateurs.dart';
import 'package:http/http.dart' as http;

class PortageApiException implements Exception {
  PortageApiException(this.message);
  final String message;
}

class PortageApiClient {
  static const baseUrl = 'https://public.portage.ca';

  Future<Utilisateur?> fetcUtilisateur(String pseudo) async {
    final utilisateurUrl =
        Uri.parse('$baseUrl/WebApiSM/api/Tb_Users?pseudo=$pseudo');
    final portageResponse = await http.get(utilisateurUrl);

    if (portageResponse.statusCode != 200) {
      throw PortageApiException('Cette utilisateur n\'existe pas');
    }

    final portageJson = jsonDecode(portageResponse.body) as List;
    if (portageJson.isEmpty) {
      PortageApiException('Cette utilisateur n\'existe pas');
      return null;
    }

    return Utilisateur.fromJson(portageJson);
  }
}

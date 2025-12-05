import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vava_giovanna/classes/JsonAgente.dart';

class Api {
  String urlInicial = "https://valorant-api.com/v1";

  Future<List<Agente>> getAllAgents() async {
    final response = await http.get(
      Uri.parse("$urlInicial/agents?isPlayableCharacter=true&language=pt-BR"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data["data"] as List)
          .map((json) => Agente.fromJson(json))
          .toList();
    } else {
      return List.empty();
    }
  }

  Future<Agente> getAgentbyId(String id) async{
    final response = await http.get(Uri.parse("$urlInicial/agents/$id?language=pt-BR"));
    final data = json.decode(response.body);
    return Agente.fromJson(data["data"]);
  }
}

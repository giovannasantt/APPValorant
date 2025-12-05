import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vava_giovanna/classes/api.dart';
import 'package:vava_giovanna/classes/JsonAgente.dart';
import 'package:vava_giovanna/telas/telaAgente.dart';
import 'package:vava_giovanna/telas/telaInicio.dart';

class Personagenspage extends StatefulWidget {
  const Personagenspage({super.key});

  @override
  State<Personagenspage> createState() => _PersonagenspageState();
}

class _PersonagenspageState extends State<Personagenspage> {
  final Api api = Api();
  List<Agente> agentes = [];

  void carregarAgents() async {
    agentes = await api.getAllAgents();
    setState(() {});
  }

  @override
  void initState() {
    carregarAgents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 18, 24, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Homepage()),
              ),
              child: Text(
                "Inicio",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              itemCount: agentes.length,
              itemBuilder: (context, index) {
                final agente = agentes[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Agentepage(id: "${agente.uuid}"),
                    ),
                  ),
                  child: Card(
                    color: Color.fromRGBO(0, 0, 0, 0),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: agente.displayIconSmall ?? "",
                          width: 200,
                          height: 150,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 200,
                            height: 150,
                            color: Colors.grey[900],
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error, color: Colors.red),
                        ),
                        Text(
                          "${agente.displayName}",
                          style: TextStyle(
                            color: Color.fromARGB(255, 134, 134, 134),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

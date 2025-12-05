import 'package:flutter/material.dart';
import 'package:vava_giovanna/classes/api.dart';
import 'package:vava_giovanna/classes/JsonAgente.dart';
import 'package:vava_giovanna/telas/telaPerson.dart';

class Agentepage extends StatefulWidget {
  final String id;

  const Agentepage({super.key, required this.id});

  @override
  State<Agentepage> createState() => _AgentspageState();
}

class _AgentspageState extends State<Agentepage> {
  final Api api = Api();
  Agente personagem = Agente();
  void carregarPersonagem() async {
    personagem = await api.getAgentbyId(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarPersonagem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 18, 24, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Personagenspage()),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 150, 27, 18),
                    ),
                    child: Text(
                      "Voltar",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Agentes",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                Image.network(
                  "${personagem.background}",
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Image.network(
                  "${personagem.fullPortrait}",
                  height: 325,
                  width: 350,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${personagem.displayName}",
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                      SizedBox(width: 25),
                      Image.network(
                        personagem.role?.displayIcon ?? "",
                        width: 25,
                        height: 25,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${personagem.developerName}",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${personagem.role?.displayName}:",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "${personagem.role?.description}:",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  ListView.builder(
                    itemCount: personagem.abilities?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final abilities = personagem.abilities?[index];
                      return Card(
                        color: Color.fromARGB(40, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                abilities?.displayIcon ?? "",
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.hide_image_outlined, color: Colors.white,);
                                },
                              ),
                              SizedBox(width: 12),
                              // TEXTOS → ocupam o espaço restante
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      abilities?.displayName ?? "",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),

                                    SizedBox(height: 6),

                                    Text(
                                      abilities?.description ?? "",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

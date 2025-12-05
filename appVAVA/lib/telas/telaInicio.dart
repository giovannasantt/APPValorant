import 'package:flutter/material.dart';
import 'package:vava_giovanna/telas/telaPerson.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 18, 24, 1),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Home",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            SizedBox(height: 40),
            Card(
              color: Color.fromRGBO(255, 255, 255, 0),
              child: Padding(
                padding: const EdgeInsets.only(top: 45, bottom: 45),
                child: Column(
                  children: [
                    Image.asset("assets/valorantLogo.jpg", width: 500, height: 250, fit: BoxFit.fill,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Seja bem vindo a VAVA API!",
                            style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 134, 134, 134)),
                          ),
                          Text(
                            "Aqui você poderá ver informações sobre diversos agentes e suas habilidades dentro do jogo",
                            style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 134, 134, 134)),
                          ),
                          Text(
                            "Creditos: valorant-API",
                            style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 134, 134, 134)),
                          ),
                          SizedBox(height: 40),
                          Text(
                            "Clique no botão para ser direcionado a proxima tela.",
                            style: TextStyle(fontSize: 14, color:Color.fromARGB(255, 134, 134, 134)),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(242, 184, 181, 1),
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Personagenspage()),
                            ),
                            child: Text("Próximo", style: TextStyle(color: Colors.black, fontSize: 16),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

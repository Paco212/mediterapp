import 'package:flutter/material.dart';
import 'package:mediterappli/services/auth_service.dart';
import '../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String> _getUserName() async {
    User user = await AuthService().getCurrentUser();
    return user.toJson()['username'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C5C67),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C5C67),
        elevation: 0, // Supprime l'ombre de l'AppBar pour un look plus plat
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Assure un alignement à gauche
            children: [
              FutureBuilder<String>(
                future: _getUserName(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Text(
                    'Bonjour ${snapshot.data},',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight
                          .w800, // Utilise FontWeight.w800 pour extra-bold
                    ),
                  );
                },
              ),
              const SizedBox(
                  height: 8), // Ajoute un espacement entre les textes
              const Text(
                'Comment vous sentez-vous aujourd\'hui ?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight
                      .w800, // Utilise FontWeight.w800 pour extra-bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

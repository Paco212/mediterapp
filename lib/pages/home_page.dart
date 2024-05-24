import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C5C67),
      appBar: AppBar(
        backgroundColor: Color(0xFF2C5C67),
        elevation: 0, // Supprime l'ombre de l'AppBar pour un look plus plat
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Assure un alignement à gauche
            children: [
              Text(
                'Hi User,',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800, // Utilise FontWeight.w800 pour extra-bold
                ),
              ),
              SizedBox(height: 8), // Ajoute un espacement entre les textes
              Text(
                'Welcome!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800, // Utilise FontWeight.w800 pour extra-bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

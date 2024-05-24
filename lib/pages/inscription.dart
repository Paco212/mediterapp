import 'package:flutter/material.dart';
import 'package:mediterappli/pages/app.dart'; // Import the main app page
import 'package:mediterappli/pages/connexion.dart';
import 'package:mediterappli/services/auth_service.dart'; // Import the connexion page

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _usernameController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight =
        screenHeight * 0.25; // Set image height to 25% of screen height

    return Scaffold(
      backgroundColor: const Color(0xFF2C5C67), // Set the background color
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Container(
              height: imageHeight,
              width: double.infinity,
              child: Image.asset(
                "assets/images/img12.jpg",
                fit: BoxFit.cover, // Ensures the image covers the container
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextFormField(
                        controller: _usernameController,
                        style: const TextStyle(
                          fontSize: 18, // Set the font size
                          color: Colors.black, // Set the text color
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // Set the background color
                          labelText: 'Nom d\'utilisateur',
                          labelStyle: const TextStyle(
                            color: Color(0xFFA09D98), // Set the label color
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre nom d\'utilisateur';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextFormField(
                        controller: _emailController,
                        style: const TextStyle(
                          fontSize: 18, // Set the font size
                          color: Colors.black, // Set the text color
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // Set the background color
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            color: Color(0xFFA09D98), // Set the label color
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(
                          fontSize: 18, // Set the font size
                          color: Colors.black, // Set the text color
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // Set the background color
                          labelText: 'Mot de passe',
                          labelStyle: const TextStyle(
                            color: Color(0xFFA09D98), // Set the label color
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre mot de passe';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextFormField(
                        controller: _confirmpasswordController,
                        style: const TextStyle(
                          fontSize: 18, // Set the font size
                          color: Colors.black, // Set the text color
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white, // Set the background color
                          labelText: 'Confirmer votre mot de passe',
                          labelStyle: const TextStyle(
                            color: Color(0xFFA09D98), // Set the label color
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le mot de passe';
                          } else if (value != _passwordController.text) {
                            return 'Les mots de passe ne sont pas identiques';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30), // Add some spacing
                    SizedBox(
                      width: 600, // Set the width of the button
                      height: 55, // Set the height of the button
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            bool result = await AuthService().register(
                                _emailController.text,
                                _usernameController.text,
                                _passwordController.text);

                            if (result) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Connexion()),
                              );
                            }
                          }
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                horizontal: 16.0), // Add padding to the button
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(
                                0xFF4E797E), // Set the background color of the button
                          ),
                        ),
                        child: const Text(
                          "S'inscrire",
                          style: TextStyle(
                            fontSize:
                                22, // Set the font size of the button text
                            color: Colors
                                .white, // Set the text color of the button text
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Add some spacing
                    TextButton(
                      onPressed: () {
                        // Navigate to the connexion page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Connexion()),
                        );
                      },
                      child: const Text(
                        "Déjà un compte ? Connectez-vous",
                        style: TextStyle(
                          color: Colors.white, // Couleur du texte
                          fontSize: 16, // Taille du texte
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

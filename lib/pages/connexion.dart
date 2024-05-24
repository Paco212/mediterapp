import 'package:flutter/material.dart';
import 'package:mediterappli/pages/app.dart'; // Import the main app page
import 'package:mediterappli/pages/inscription.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';


class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight =
        screenHeight * 0.25; // Set image height to 25% of screen height

    return Scaffold(
      backgroundColor: const Color(0xFF2C5C67), // Set the background color
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0), // Add padding around the image
            child: ClipRRect(
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
                            return 'Please enter your email';
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
                          labelText: 'Password',
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
                            return 'Please enter your password';
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
                            _formKey.currentState!.save();
                            setState(() {
                              _isLoading = true;
                            });

                            User? user = await AuthService().login(
                              _emailController.text,
                              _passwordController.text,
                            );

                            if (user != null) {
                              AuthService().setCurrentUser(user);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const App()),
                              );
                            } else {
                              // Afficher un message d'erreur ou gérer le cas où la connexion échoue
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Erreur inconnue'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                            setState(() {
                              _isLoading = false;
                            });
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
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.grey,
                              )
                            : const Text(
                                "Se connecter",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 20), // Add some spacing
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Inscription()),
                        );
                      },
                      child: const Text(
                        "Pas de compte ? Inscrivez-vous",
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

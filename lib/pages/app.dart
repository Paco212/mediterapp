import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediterappli/pages/connexion.dart';
import 'package:mediterappli/pages/meditation_page.dart';
import 'package:mediterappli/pages/search_page.dart';
import 'package:mediterappli/pages/settings_page.dart';
import 'package:mediterappli/pages/inscription.dart';

import 'home_page.dart';
import 'music_page.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const MeditationPage(),
    const MusicPage(),
    const SettingsPage(),
    const Connexion(),
    const Inscription()
  ]; // Replace with your page list
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IndexedStack(
        index: _currentIndex,
        children: _pages,
      )),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF2C5C67),
        selectedIndex: _currentIndex,
        onDestinationSelected: _onItemTapped,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          const NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          const NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Likes',
          ),
          const NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: 'Compte',
          ),
        ],
      ),
    );
  }
}

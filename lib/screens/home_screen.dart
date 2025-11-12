import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Scaffold est l'échafaudage de base de tout écran Material Design.
    return Scaffold(
      // 1. La barre de titre (la "porte d'entrée").
      appBar: AppBar(
        title: const Text('Accueil - DakarConnect'),
        backgroundColor: Colors.blueAccent, // Ajoutons un peu de couleur
      ),

      // 2. Le corps de la page.
      body: const Center(
        child: Text(
          'Bienvenue sur DakarConnect !',
          style: TextStyle(fontSize: 22),
        ),
      ),

      // 3. La barre de navigation inférieure (les "fenêtres").
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Carte',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );

  }

}


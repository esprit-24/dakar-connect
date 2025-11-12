// Importation du package principal de Flutter pour les widgets Material Design.
import 'package:dakarconnect/screens/home_screen.dart';
import 'package:dakarconnect/screens/login_screen.dart';
import 'package:dakarconnect/screens/report_screen.dart';
import 'package:flutter/material.dart';

// La fonction main() est le point d'entrée de toute application Dart/Flutter.
void main() {
  // runApp() prend un widget et en fait la racine de l'arbre des widgets.
  runApp(const MyApp());
}
// MyApp est le widget racine de notre application.
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // La méthode build() décrit comment afficher le widget.
  @override
  Widget build(BuildContext context) {

    // MaterialApp est un widget de base qui configure notre application
    // avec les fonctionnalités de Material Design.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dakar Connect',
      // 'home' définit le premier écran qui sera affiché.
      home: HomeScreen(),
    );

  }

}

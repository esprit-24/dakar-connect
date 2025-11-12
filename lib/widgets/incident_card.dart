// Créez le fichier : lib/widgets/incident_card.dart 
import 'package:flutter/material.dart';
// On importe notre modèle pour que ce widget sache ce qu'est un "Incident".
import '../models/incident_model.dart';
/// Un widget réutilisable qui affiche les informations d'un seul incident
/// sous forme de carte élégante.
class IncidentCard extends StatelessWidget {
  // Ce widget a besoin d'un objet 'Incident' pour fonctionner.
  final Incident incident;
  // Le constructeur exige qu'on lui passe un 'incident'.
  const IncidentCard({super.key, required this.incident});
  @override
  Widget build(BuildContext context) {
    // Le widget Card fournit une surface avec une ombre et des coins arrondis.
    return Card(
      // margin ajoute de l'espace autour de la carte.
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // elevation contrôle la taille de l'ombre.
      elevation: 4,
      // clipBehavior évite que les enfants (comme l'image) dépassent des coins arrondis.
      clipBehavior: Clip.antiAlias,
      // Column pour empiler l'image et le texte verticalement.
      child: Column(
        // Aligne les enfants au début (à gauche).
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // L'image du signalement.
          Image.network(
            incident.imageUrl, // L'URL vient de notre objet incident.
            height: 200,      // Hauteur fixe.
            width: double.infinity, // Prend toute la largeur de la carte.
            fit: BoxFit.cover,    // Redimensionne l'image pour couvrir l'espace.
          ),


// Un Padding pour ajouter de l'espace autour du texte.
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Le titre du signalement.
                Text(
                  incident.titre,
                  // style permet de personnaliser l'apparence du texte.
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8), // Espace vertical
                // Le lieu du signalement, avec une icône.
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4), // Espace horizontal
                    Text(
                      incident.lieu,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


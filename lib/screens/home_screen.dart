// Mettez à jour le fichier : lib/screens/home_screen.dart
import 'package:flutter/material.dart';
// 1. On importe le modèle pour savoir à quoi ressemble un 'Incident'.
import '../models/incident_model.dart';
// 2. On importe notre widget personnalisé pour afficher une carte d'incident.
import '../widgets/incident_card.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // 3. On crée une liste de données factices ("en dur").
    // Plus tard, ces données viendront d'une base de données.
    final List<Incident> dummyIncidents = [
      Incident(
        titre: 'Nid de poule dangereux',
        description: 'Un grand trou sur la VDN en face de la station Shell.',
        // On utilise un service d'images placeholder comme picsum.photos
        imageUrl: 'https://picsum.photos/seed/picsum/400/200',
        date: DateTime.now().subtract(const Duration(days: 2)),
        lieu: 'VDN, Dakar',
      ),
      Incident(
        titre: 'Lampadaire en panne',
        description: "L'éclairage public ne fonctionne plus dans toute la rue.",
        imageUrl: 'https://picsum.photos/seed/picsum2/400/200',
        date: DateTime.now().subtract(const Duration(hours: 12)),
        lieu: 'Rue 10, Médina',
      ),
      Incident(
        titre: 'Amassement d\'ordures',
        description: 'Les poubelles débordent depuis plusieurs jours.',
        imageUrl: 'https://picsum.photos/seed/picsum3/400/200',
        date: DateTime.now().subtract(const Duration(days: 5)),
        lieu: 'Parcelles Assainies, Unité 15',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signalements Récents'),
      ),
      // 4. On utilise ListView.builder pour construire la liste.
      // C'est la méthode la plus performante : elle ne construit que les
      // éléments qui sont visibles à l'écran.
      body: ListView.builder(
        // Le nombre total d'éléments dans notre liste.
        itemCount: dummyIncidents.length,
        // La fonction qui sera appelée pour construire CHAQUE élément de la liste.
        // 'context' est l'état actuel de l'app, 'index' est la position de l'élément (0, 1, 2...).
        itemBuilder: (context, index) {
          // On récupère l'incident correspondant à cet index.
          final incident = dummyIncidents[index];
          // 5. Pour chaque incident dans la liste, on retourne notre widget personnalisé.
          // On lui passe l'objet 'incident' pour qu'il sache quoi afficher.
          return IncidentCard(incident: incident);
        },
      ),
    );
  }
}


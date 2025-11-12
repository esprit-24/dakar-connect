import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/incident_model.dart';
import '../widgets/incident_card.dart';

/// Page d’accueil affichant la liste des signalements.
/// Ajout d’un bouton “+” pour créer un nouveau signalement (route /report).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Incident> dummyIncidents = [
      Incident(
        titre: 'Nid de poule dangereux',
        description: 'Un grand trou sur la VDN en face de la station Shell.',
        imageUrl: 'https://picsum.photos/seed/picsum/400/200',
        date: DateTime.now().subtract(const Duration(days: 2)),
        lieu: 'VDN, Dakar',
      ),
      Incident(
        titre: 'Lampadaire en panne',
        description: "L’éclairage public ne fonctionne plus dans toute la rue.",
        imageUrl: 'https://picsum.photos/seed/picsum2/400/200',
        date: DateTime.now().subtract(const Duration(hours: 12)),
        lieu: 'Rue 10, Médina',
      ),
      Incident(
        titre: 'Amassement d’ordures',
        description: 'Les poubelles débordent depuis plusieurs jours.',
        imageUrl: 'https://picsum.photos/seed/picsum3/400/200',
        date: DateTime.now().subtract(const Duration(days: 5)),
        lieu: 'Parcelles Assainies, Unité 15',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Signalements récents'),
      ),

      // Liste des signalements
      body: ListView.builder(
        itemCount: dummyIncidents.length,
        itemBuilder: (context, index) {
          final incident = dummyIncidents[index];
          return IncidentCard(incident: incident);
        },
      ),

      // Bouton flottant “+” pour aller à la page de création de signalement
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigation vers la page de création via GoRouter
          context.go('/report');
        },
        tooltip: 'Créer un signalement',
        child: const Icon(Icons.add),
      ),
    );
  }
}

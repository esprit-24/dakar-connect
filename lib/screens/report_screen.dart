// Fichier : lib/screens/report_screen.dart
import 'package:flutter/material.dart';
// 1) Importez GoRouter pour utiliser context.go()
import 'package:go_router/go_router.dart';

/// Écran de création de signalement (formulaire).
class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});
  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  // Clé du formulaire
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faire un nouveau signalement"),
        // 2) Ajoutez un bouton retour vers l’accueil avec GoRouter
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
          tooltip: 'Retour à l’accueil',
        ),
      ),

      // 3) Conservez SingleChildScrollView pour éviter les overflow avec le clavier
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          // 4) Le formulaire regroupe et valide les champs
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- CHAMP TITRE ---
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Titre du signalement',
                    hintText: 'Ex: Nid de poule dangereux',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un titre.';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // --- CHAMP DESCRIPTION ---
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description détaillée',
                    hintText: 'Donnez plus de détails sur le problème...',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer une description.';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // --- BOUTON AJOUTER UNE PHOTO ---
                OutlinedButton.icon(
                  onPressed: () {
                    // La logique caméra/galerie sera ajoutée plus tard.
                    // 5) Rien à changer ici pour GoRouter.
                    debugPrint('Ajouter une photo cliqué');
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Ajouter une photo"),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),

                const SizedBox(height: 30),

                // --- BOUTON DE SOUMISSION ---
                ElevatedButton(
                  onPressed: () {
                    // 6) Validez le formulaire puis redirigez vers /home
                    if (_formKey.currentState!.validate()) {
                      // Option A : feedback puis navigation immédiate
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Signalement envoyé !')),
                      );
                      context.go('/home');

                      // Option B : attendre un court délai avant la navigation
                      // Future.delayed(const Duration(milliseconds: 400), () {
                      //   context.go('/home');
                      // });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Envoyer le Signalement'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

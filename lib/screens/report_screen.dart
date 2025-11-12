// Créez le fichier : lib/screens/report_screen.dart
import 'package:flutter/material.dart';
/// Un StatefulWidget pour l'écran de création de signalement.
/// On utilise un StatefulWidget car un formulaire est par nature interactif :
/// il doit se souvenir de ce que l'utilisateur tape dans les champs.
class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});
  @override
  State<ReportScreen> createState() => _ReportScreenState();
}
class _ReportScreenState extends State<ReportScreen> {
  // Une GlobalKey est une "poignée" unique qui nous permet d'identifier
  // et d'interagir avec un widget spécifique, ici notre Form.
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faire un nouveau signalement"),
      ),
      // SingleChildScrollView est un widget crucial pour les formulaires.
      // Il permet à l'utilisateur de faire défiler l'écran si le clavier
      // cache les champs de saisie, évitant ainsi les erreurs de "pixel overflow".
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          // Le widget Form est un conteneur qui nous aide à gérer et
          // valider plusieurs champs de saisie en même temps.
          child: Form(
            key: _formKey, // On attache notre "poignée" au formulaire.
            child: Column(
              // crossAxisAlignment Aligne les enfants au début (à gauche).
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- CHAMP TITRE ---
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Titre du signalement',
                    hintText: 'Ex: Nid de poule dangereux', // Texte d'aide
                    border: OutlineInputBorder(),
                  ),
                  // Le validateur est une fonction qui vérifie la saisie.
                  // Elle retourne un message d'erreur si la saisie est invalide,
                  // ou 'null' si tout est correct.
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
                  // maxLines permet de créer un champ de texte plus grand.
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
                // OutlinedButton est un bouton avec une simple bordure,
                // idéal pour les actions secondaires.
                OutlinedButton.icon(
                  onPressed: () {
                    // La logique pour ouvrir la caméra sera ajoutée plus tard.
                    print('Ajouter une photo cliqué !');
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Ajouter une photo"),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    // Aligne le contenu du bouton à gauche.
                    alignment: Alignment.centerLeft,
                    // Ajoute un padding à l'intérieur du bouton.
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                const SizedBox(height: 30),
                // --- BOUTON DE SOUMISSION ---
                ElevatedButton(
                  onPressed: () {
                    // On utilise notre _formKey pour vérifier l'état du formulaire.
                    // _formKey.currentState!.validate() exécute la fonction 'validator'
                    // de TOUS les TextFormField du formulaire.
                    if (_formKey.currentState!.validate()) {
                      // Si tous les champs sont valides, on affiche un message.
                      // Plus tard, on enverra les données à la base de données ici.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Signalement envoyé ! (Simulation)')),
                      );
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// 1. Importez votre nouvelle configuration de routeur.
import 'config/router.dart';
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
// 2. On transforme MyApp en ConsumerWidget pour qu'il puisse "lire" les providers.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  // 'ref' est l'objet magique qui nous permet de communiquer avec nos providers.
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. On lit notre routerProvider pour obtenir l'instance de GoRouter.
    final router = ref.watch(routerProvider);
    // 4. On utilise MaterialApp.router au lieu de MaterialApp classique.
    return MaterialApp.router(
      // On lui passe notre configuration de routes.
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo), // Un petit thème sympa
    );
  }
}


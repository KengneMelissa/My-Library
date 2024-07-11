import 'package:exercice1/acceuil.dart';

import 'package:exercice1/empruntform.dart';
import 'package:exercice1/list_livre.dart';
import 'package:exercice1/listcountries.dart';
import 'package:exercice1/liste_personne.dart';
import 'package:exercice1/listemprunt.dart';
import 'package:exercice1/livreform.dart';
import 'package:exercice1/personneform.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Container(
              padding: const EdgeInsets.all(10),
              child: const Text("MA BIBLIOTHEQUE")),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: const Acceuil(),
      ),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/personne':
        return MaterialPageRoute(builder: (context) => const ListPersonne());
      case '/livre':
        return MaterialPageRoute(builder: (context) => const ListLivre());
      case '/emprunt':
        return MaterialPageRoute(builder: (context) => const ListEmprunt());
      case '/info':
        return MaterialPageRoute(
            builder: (context) =>
                const Text("le livre a ete emprunter avec succes"));
      case '/newpersonne':
        return MaterialPageRoute(builder: (context) => const PersonneForm());
      case '/newlivre':
        return MaterialPageRoute(builder: (context) => const LivreForm());
      case '/newemprunt':
        return MaterialPageRoute(builder: (context) => const EmpruntForm());
      case '/countries':
        return MaterialPageRoute(builder: (context) => ListCountries());

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar:
                      AppBar(title: const Text("REPONSE"), centerTitle: true),
                  body: const Center(
                    child: Text("LE LIVRES A ETE EMPRUNTER AVEC SUCCES"),
                  ),
                ));
    }
  }
}

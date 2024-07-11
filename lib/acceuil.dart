import 'package:exercice1/list_livre.dart';
import 'package:exercice1/liste_personne.dart';
import 'package:exercice1/listemprunt.dart';
import 'package:flutter/material.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.book),
              ),
              Tab(
                icon: Icon(Icons.attachment_rounded),
              )
            ]),
            title: Container(
                padding: const EdgeInsets.all(1),
                child: const Text("Affichage")),
            centerTitle: true,
            backgroundColor: Color.fromARGB(155, 20, 133, 196),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/countries');
                },
                icon: const Icon(Icons.public),
              ),
            ],
          ),
          body: const TabBarView(
            children: [
              ListPersonne(),
              ListLivre(),
              ListEmprunt(),
            ],
          ),
        ));
  }
}

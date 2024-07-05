import 'package:exercice1/list_livre.dart';
import 'package:exercice1/liste_personne.dart';
import 'package:exercice1/listemprunt.dart';
import 'package:exercice1/emprunter.dart';
import 'package:exercice1/personne.dart';
import 'package:flutter/material.dart';

import 'livre.dart';

class EmpruntForm extends StatefulWidget {
  const EmpruntForm({super.key});

  @override
  State<EmpruntForm> createState() => _EmpruntFormState();
}

class _EmpruntFormState extends State<EmpruntForm> {
  final formKey = GlobalKey<FormState>();
  Personne? selectedPerson;
  Livre? selectedBook;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nouveau emprunt"),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8.0, right: 8.0, bottom: 4.0),
                  child: DropdownButtonFormField<Personne>(
                    value: selectedPerson,
                    onChanged: (Personne? person) {
                      setState(() {
                        selectedPerson = person;
                      });
                    },
                    items: ListPersonneState.personnes
                        .map<DropdownMenuItem<Personne>>((Personne personne) {
                      return DropdownMenuItem<Personne>(
                        value: personne,
                        child: Text(personne.nom + " " + personne.prenom),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                        labelText: 'Emprunteur',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.9)))),
                    validator: (value) {
                      if (value == null) {
                        return "Svp choisissez la personne";
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8.0, right: 8.0, bottom: 4.0),
                  child: DropdownButtonFormField<Livre>(
                    value: selectedBook,
                    onChanged: (Livre? book) {
                      setState(() {
                        selectedBook = book;
                      });
                    },
                    items: ListLivreState.livre
                        .map<DropdownMenuItem<Livre>>((Livre livre) {
                      return DropdownMenuItem<Livre>(
                        value: livre,
                        child: Text(livre.noml + "" + livre.edition),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                        labelText: 'Livre',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.9)))),
                    validator: (value) {
                      if (value == null) {
                        return "svp entrer un livre";
                      }
                      return null;
                    },
                  )),
             const SizedBox(
                height: 4.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Emprunt emprunt = Emprunt(
                          nomemprunt: selectedBook!.noml,
                          nomemprunteur: (selectedPerson!.nom +
                              " " +
                              selectedPerson!.prenom));
                      ListEmpruntState.emprunts.add(emprunt);
                      _showSnackBar(
                          "${selectedPerson!.nom} a emprunte ${selectedBook!.noml}");
                      Navigator.pop(context);
                    }
                  },
                  child:const Text("Save"),
                ),
              )
            ],
          ),
        ));
  }
}

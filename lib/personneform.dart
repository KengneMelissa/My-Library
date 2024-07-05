import 'package:exercice1/liste_personne.dart';
import 'package:exercice1/personne.dart';
import 'package:flutter/material.dart';

class PersonneForm extends StatefulWidget {
  const PersonneForm({super.key});

  @override
  State<PersonneForm> createState() => _PersonneFormState();
}

class _PersonneFormState extends State<PersonneForm> {
  final formKey = GlobalKey<FormState>();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();

  @override
  void dispose() {
    nomController.dispose();
    prenomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nouvelle Personne"),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8.0, right: 8.0, bottom: 4.0),
                  child: TextFormField(
                    controller: nomController,
                    decoration: const InputDecoration(
                        labelText: 'nom',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.9)))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "svp entrer le nom";
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8.0, right: 8.0, bottom: 4.0),
                  child: TextFormField(
                    controller: prenomController,
                    decoration: const InputDecoration(
                        labelText: 'prenom',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.9)))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "svp entrer le prenom";
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
                      Personne personne = Personne(
                          nom: nomController.value.text,
                          prenom: prenomController.value.text);
                      ListPersonneState.personnes.add(personne);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("save"),
                ),
              )
            ],
          ),
        ));
  }
}

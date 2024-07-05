import 'package:exercice1/list_livre.dart';
import 'package:exercice1/livre.dart';
import 'package:flutter/material.dart';

class LivreForm extends StatefulWidget {
  const LivreForm({super.key});

  @override
  State<LivreForm> createState() => _LivreFormState();
}

class _LivreFormState extends State<LivreForm> {
  final formKey = GlobalKey<FormState>();
  final nomlController = TextEditingController();
  final editionController = TextEditingController();

  @override
  void dispose() {
    nomlController.dispose();
    editionController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nouveau Livre"),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8.0, right: 8.0, bottom: 4.0),
                  child: TextFormField(
                    controller: nomlController,
                    decoration: const InputDecoration(
                        labelText: 'noml',
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
                    controller: editionController,
                    decoration: const InputDecoration(
                        labelText: 'edition',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.9)))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "svp entrer l'edition'";
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
                      Livre livre = Livre(
                        noml: nomlController.value.text,
                        edition: editionController.value.text,
                      );
                      ListLivreState.livre.add(livre);
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

import 'package:exercice1/personne.dart';
import 'package:flutter/material.dart';

class ListPersonne extends StatefulWidget {
  const ListPersonne({super.key});

  @override
  State<ListPersonne> createState() {
    return ListPersonneState();
  }
}

class ListPersonneState extends State<ListPersonne> {
  static final List<Personne> personnes = [
    Personne(nom: "Kengne", prenom: "melissa", age: 19),
    Personne(
      nom: "Kengni",
      prenom: "johane",
      age: 20,
    ),
    Personne(nom: "Fotso", prenom: "blaise", age: 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Personnes"),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: personnes.length,
              itemBuilder: ((context, index) {
                final personne = personnes[index];
                return PersonneItemWidget(
                  personne: personne,
                );
              }),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/newpersonne')
                        .then((value) => setState(() {}));
                  },
                  child: Icon(Icons.add),
                ),
              ),
            )
          ],
        ));
  }
}

class PersonneItemWidget extends StatelessWidget {
  const PersonneItemWidget({super.key, required this.personne});
  final Personne personne;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.pushNamed(
      //     context,
      //     '/livre',
      //     arguments: personne,
      //   );
      // },
      child: Card(
          margin: EdgeInsets.all(8),
          elevation: 8,
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(personne.nom,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))),
                      Text(
                        personne.prenom,
                        style: TextStyle(color: Colors.grey[500], fontSize: 16),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}

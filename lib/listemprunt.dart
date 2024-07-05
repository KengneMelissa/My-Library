import 'package:exercice1/emprunter.dart';

import 'package:flutter/material.dart';

class ListEmprunt extends StatefulWidget {
  const ListEmprunt({super.key});

  @override
  State<ListEmprunt> createState() {
    return ListEmpruntState();
  }
}

class ListEmpruntState extends State<ListEmprunt> {
  static final List<Emprunt> emprunts = [
    Emprunt(
      nomemprunt: "les larmes de la patience",
      nomemprunteur: " kengne",
      datemprunt: DateTime(2005, 9, 6),
    ),
    Emprunt(
      nomemprunt: "tribues de capitolie",
      nomemprunteur: " Kengni",
      datemprunt: DateTime(1988, 6, 6),
    ),
    Emprunt(
      nomemprunt: "Ngum a jamea",
      nomemprunteur: " Fotso",
      datemprunt: DateTime(1944, 8, 6),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Emprunt"),
      ),
      body: ListView.builder(
        itemCount: emprunts.length,
        itemBuilder: ((context, index) {
          final emprunt = emprunts[index];
          return EmpruntItemWidget(
            emprunt: emprunt,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/newemprunt')
                .then((value) => setState(() {}));
          },
          child: const Icon(Icons.add)),
    );
  }
}

class EmpruntItemWidget extends StatelessWidget {
  const EmpruntItemWidget({super.key, required this.emprunt});
  final Emprunt emprunt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.pushNamed(
      //     context,
      //     '/',
      //     arguments: emprunt,
      //   );
      // },
      child: Card(
          margin: const EdgeInsets.all(8),
          elevation: 8,
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(emprunt.nomemprunt,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))),
                      Text(
                        emprunt.nomemprunteur,
                        style: TextStyle(color: Colors.grey[500], fontSize: 16),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}

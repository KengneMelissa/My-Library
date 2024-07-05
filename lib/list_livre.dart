import 'package:exercice1/livre.dart';

import 'package:flutter/material.dart';

class ListLivre extends StatefulWidget {
  const ListLivre({super.key});

  @override
  State<ListLivre> createState() {
    return ListLivreState();
  }
}

class ListLivreState extends State<ListLivre> {
  static final List<Livre> livre = [
    Livre(
        noml: "les larmes de la patience", edition: "melissa", publication: 18),
    Livre(
      noml: "les tribues de capitoline",
      edition: "Pc Ombete mbela",
      publication: 30,
    ),
    Livre(noml: "Ngum a jamea", edition: "David Mbanga", publication: 23),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Livres"),
      ),
      body: ListView.builder(
        itemCount: livre.length,
        itemBuilder: ((context, index) {
          final livres = livre[index];
          return LivreItemWidget(
            livre: livres,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/newlivre')
                .then((value) => setState(() {}));
          },
          child: const Icon(Icons.add)),
    );
  }
}

class LivreItemWidget extends StatelessWidget {
  const LivreItemWidget({super.key, required this.livre});
  final Livre livre;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.pushNamed(
      //     context,
      //     '/emprunt',
      //     arguments: livre,
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
                          child: Text(livre.noml,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))),
                      Text(
                        livre.edition,
                        style: TextStyle(color: Colors.grey[500], fontSize: 16),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}

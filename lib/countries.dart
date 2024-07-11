import 'package:flutter/material.dart';

class CountriesItemWidget extends StatelessWidget {
  const CountriesItemWidget({super.key, required this.countries});
  final dynamic countries;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var countrie;
        Navigator.pushNamed(
          context,
          '/',
          arguments: countries,
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
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
                        child: Text(
                          countries["name"]["common"],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    Row(
                      children: countries["capital"] == null
                          ? []
                          : (countries["capital"] as List)
                              .map((e) => Text(e ?? "...",
                                  style: TextStyle(fontSize: (10))))
                              .toList(),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

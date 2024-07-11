import 'package:exercice1/countries.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ListCountries extends StatefulWidget {
  const ListCountries({super.key});
  ListCountriesState createState() {
    return ListCountriesState();
  }
}

class ListCountriesState extends State<ListCountries> {
  final dio = Dio();
  static final List<dynamic> countries = List.empty(growable: true);

  void getHttp() async {
    var response = await Dio().get('https://restcountries.com/v3.1/all');
    print(response.data[0]["name"]["common"]);
    //this.response = response.data;
    setState(() {
      countries.addAll(response.data as List);
    });
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries"),
      ),
      body: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) {
            final countrie = countries[index];
            return Dismissible(
              key: Key(countrie["name"]["common"]),
              onDismissed: (direction) {
                setState(() {
                  // countries.removeAt(index);
                });
              },
              // background: Container(
              //   color: Colors.blue,
              // ),
              child: CountriesItemWidget(countries: countries[index]),
            );
          }),
    );
  }
}

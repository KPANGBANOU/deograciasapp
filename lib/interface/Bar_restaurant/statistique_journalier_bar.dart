// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, must_be_immutable, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../modele/bieere_petit_model.dart';
import '../../modele/bierre_grand_model.dart';
import '../../modele/vente_grand_modele.dart';
import '../../modele/vente_petit_modele.dart';
import 'drawer_admin_bar.dart';

class StatistiqueJournalierBar extends StatelessWidget {
  StatistiqueJournalierBar({Key? key}) : super(key: key);

  Timestamp dte = Timestamp.now();

  int quantite_petit_modele = 0;
  int quantite_grand_modele = 0;
  int montant_petit_modele = 0;
  int montant_grand_modele = 0;
  int total_petit_modele = 0;
  int total_grand_modele = 0;
  int total = 0;
  int benefice = 0;
  int benefice_petit_modele = 0;
  int benefice_grand_modele = 0;

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("dd-MM-yyyy").format(dte.toDate());
    String today_date = DateFormat("yyyy-MM-dd").format(dte.toDate());
    final _petits_modeles =
        Provider.of<List<donneesBieerePetitModele>>(context);
    final _grand_modele = Provider.of<List<donnesBierresGrandModel>>(context);
    final _ventes_petits_modele = Provider.of<List<ventePetitModele>>(context);
    final _ventes_grand_modele = Provider.of<List<venteGrandModele>>(context);

    for (var element in _ventes_grand_modele) {
      if (element.date_vente == today_date) {
        benefice_grand_modele += element.benefice;
        total_grand_modele += element.montant;
      }
    }
    for (var element in _ventes_petits_modele) {
      if (element.date_vente == today_date) {
        total_petit_modele += element.montant;
        benefice_petit_modele += element.benefice;
      }
    }
    if (_petits_modeles.isEmpty ||
        _grand_modele.isEmpty ||
        _ventes_grand_modele.isEmpty ||
        _ventes_petits_modele.isEmpty) {
      return Scaffold(
        drawer: DrawerAdminBar(),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.2,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "Statistique journalier",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.cyan,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.green.shade900,
      drawer: DrawerAdminBar(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.2,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Statistique journalier",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Statistique journalier de vente d'aujourd'hui " + date,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2),
              child: Container(
                color: Colors.black87,
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Vente de pétits modèles".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  border: TableBorder.all(
                      color: Colors.black87, style: BorderStyle.solid),
                  columns: [
                    DataColumn(
                      label: Text(
                        "Bièrre".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Quantité vendue".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Prix unitaire de vente".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Montant de vente".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )
                  ],
                  rows: _petits_modeles.map((_vente) {
                    quantite_petit_modele = 0;
                    montant_petit_modele = 0;

                    _ventes_petits_modele.forEach((element) {
                      if (element.nom_bierre == _vente.nom &&
                          element.date_vente == today_date) {
                        quantite_petit_modele += element.quantite;
                        montant_petit_modele += element.montant;
                      }
                    });
                    return DataRow(cells: [
                      DataCell(
                        Text(
                          _vente.nom,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Text(
                          quantite_petit_modele.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          _vente.prix_unitaire.toString() + " F",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      DataCell(Text(
                        montant_petit_modele.toString() + " F",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))
                    ]);
                  }).toList()),
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Total vente pétit modèle ".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      total_petit_modele.toString() + " F",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Bénéfice sur pétits modèles ".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      benefice_petit_modele.toString() + " F",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2),
              child: Container(
                color: Colors.black87,
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Vente de grands modèles".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  border: TableBorder.all(
                      color: Colors.black87, style: BorderStyle.solid),
                  columns: [
                    DataColumn(
                      label: Text(
                        "Bièrre".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Quantité vendue".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Prix unitaire de vente".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Montant de vente".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )
                  ],
                  rows: _grand_modele.map((_vente) {
                    quantite_grand_modele = 0;
                    montant_grand_modele = 0;

                    _ventes_grand_modele.forEach((element) {
                      if (element.nom_bierre == _vente.nom &&
                          element.date_vente == today_date) {
                        quantite_grand_modele += element.quantite;
                        montant_grand_modele += element.montant;
                      }
                    });

                    return DataRow(cells: [
                      DataCell(
                        Text(
                          _vente.nom,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Text(
                          quantite_grand_modele.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          _vente.prix_unitaire.toString() + " F",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      DataCell(Text(
                        montant_grand_modele.toString() + " F",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))
                    ]);
                  }).toList()),
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Total vente grand modèle ".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      total_grand_modele.toString() + " F",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Bénéfice sur grand modèle ".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      benefice_grand_modele.toString() + " F",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Total vente".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      total.toString() + " F",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2),
              child: Container(
                height: 50,
                color: Colors.black87,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Bénéfice brute".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        benefice.toString() + " F",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 90,
            )
          ],
        ),
      ),
    );
  }
}

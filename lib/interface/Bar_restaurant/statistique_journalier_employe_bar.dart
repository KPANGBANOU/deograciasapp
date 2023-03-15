// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, must_be_immutable, avoid_function_literals_in_foreach_calls, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/Bar_restaurant/drawer_admin_bar.dart';
import 'package:deogracias/modele/bieere_petit_model.dart';
import 'package:deogracias/modele/bierre_grand_model.dart';
import 'package:deogracias/modele/vente_grand_modele.dart';
import 'package:deogracias/modele/vente_petit_modele.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../modele/credit.dart';
import '../../modele/vente_credit.dart';

class StatistiqueJournalierEmployeBar extends StatelessWidget {
  StatistiqueJournalierEmployeBar({
    key,
    required this.user_uid,
    required this.user_prenom,
  }) : super(key: key);
  final String user_uid;
  final String user_prenom;
  Timestamp dt = Timestamp.now();

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('yyyy-MM-dd').format(dt.toDate());

    final petits_modeles = Provider.of<List<donneesBieerePetitModele>>(context);
    final credits = Provider.of<List<credit>>(context);
    final grands_modeles = Provider.of<List<donnesBierresGrandModel>>(context);
    final vente_credits = Provider.of<List<venteCredit>>(context);
    final vente_grands_modeles = Provider.of<List<venteGrandModele>>(context);
    final vente_petit_modeles = Provider.of<List<ventePetitModele>>(context);
    int total = 0;
    int total_petit_modele = 0;
    int nombre_petit_modelet = 0;
    int nbre_petit_modele = 0;
    int nombre_credit = 0;
    int nbre_credit = 0;
    int nbre_grand_modele = 0;
    int nombre_grand_modele = 0;
    int montant_petit_modele = 0;
    int montant_grand_modele = 0;
    int montant_credit = 0;
    int total_grand_modele = 0;
    int total_credits = 0;
    double benefice = 0;
    double benefice_petit_modele = 0;
    double benefice_grand_modele = 0;
    double benefice_credit = 0;

    vente_petit_modeles.forEach((element) {
      if (element.date_vente == day && element.user_uid == user_uid) {
        total_petit_modele += element.montant;
        benefice_petit_modele += element.benefice;
        nombre_petit_modelet++;
      }
    });

    vente_grands_modeles.forEach((element) {
      if (element.date_vente == day && element.user_uid == user_uid) {
        total_grand_modele += element.montant;
        benefice_grand_modele += element.benefice;
        nombre_grand_modele++;
      }
    });

    vente_credits.forEach((element) {
      if (element.date_vente == day && element.user_uid == user_uid) {
        total_credits += element.montant;
        benefice_credit += element.benefice;
        nombre_credit++;
      }
    });

    benefice = benefice_credit + benefice_grand_modele + benefice_petit_modele;

    total = total_credits + total_petit_modele + total_grand_modele;

    if (nombre_grand_modele <= 0 &&
        nombre_credit <= 0 &&
        nombre_petit_modelet <= 0) {
      return Scaffold(
        drawer: DrawerAdminBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.4,
          title: Text(
            "Statistique journalier",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      drawer: DrawerAdminBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: [
          Image.asset(
            "images/icon.jpeg",
            scale: 4.5,
            height: 100,
            width: 100,
          ),
        ],
        title: Text(
          user_prenom,
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("images/bierre2.jfif"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Ventes du " + day + " de " + user_prenom,
              textAlign: TextAlign.center,
              style: GoogleFonts.alike(color: Colors.white, fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  height: 15,
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.96,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  nombre_petit_modelet > 0
                      ? Column(
                          children: [
                            SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width * 0.99,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.lightBlue.shade900),
                                  onPressed: () {},
                                  child: Text(
                                    "Pétits modèles".toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.alike(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  border: TableBorder.all(
                                      color: Colors.lightBlue.shade800,
                                      style: BorderStyle.solid,
                                      width: 3),
                                  columns: [
                                    DataColumn(
                                        label: Text(
                                      "".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Stock vendu".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Prix unitaire".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Montant de vente".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                  rows: petits_modeles.map((produit) {
                                    nbre_petit_modele = 0;
                                    montant_petit_modele = 0;

                                    vente_petit_modeles.forEach((element) {
                                      if (element.date_vente == day &&
                                          element.user_uid == user_uid &&
                                          element.nom_bierre == produit.nom) {
                                        montant_petit_modele += element.montant;
                                        nbre_petit_modele += element.quantite;
                                      }
                                    });

                                    return DataRow(cells: [
                                      DataCell(Text(
                                        produit.nom,
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        nbre_petit_modele.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.prix_unitaire.toString() +
                                            " XOF",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        montant_petit_modele.toString() +
                                            " XOF",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ]);
                                  }).toList()),
                            ),
                            Container(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 0.999,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue.shade800,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "Total pétits modèles :".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      total_petit_modele.toString() + " XOF",
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        )
                      : Container(),
                  nombre_grand_modele > 0
                      ? Column(
                          children: [
                            SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width * 0.99,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.lightBlue.shade900),
                                  onPressed: () {},
                                  child: Text(
                                    "Grands modèles".toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.alike(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  border: TableBorder.all(
                                      color: Colors.lightBlue.shade800,
                                      style: BorderStyle.solid,
                                      width: 3),
                                  columns: [
                                    DataColumn(
                                        label: Text(
                                      "".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Stock vendu".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Prix unitaire".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Montant de vente".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                  rows: grands_modeles.map((produit) {
                                    nbre_grand_modele = 0;
                                    montant_grand_modele = 0;

                                    vente_grands_modeles.forEach((element) {
                                      if (element.date_vente == day &&
                                          element.user_uid == user_uid &&
                                          element.nom_bierre == produit.nom) {
                                        montant_grand_modele += element.montant;
                                        nbre_grand_modele += element.quantite;
                                      }
                                    });
                                    return DataRow(cells: [
                                      DataCell(Text(
                                        produit.nom,
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        nbre_grand_modele.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.prix_unitaire.toString() +
                                            " XOF",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        montant_grand_modele.toString() +
                                            " XOF",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ]);
                                  }).toList()),
                            ),
                            Container(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 0.999,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue.shade800,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "Total grands modèles :".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      total_grand_modele.toString() + " XOF",
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        )
                      : Container(),
                  nombre_credit > 0
                      ? Column(
                          children: [
                            SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width * 0.98,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.lightBlue.shade900),
                                  onPressed: () {},
                                  child: Text(
                                    "Crédits".toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.alike(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  border: TableBorder.all(
                                      color: Colors.lightBlue.shade800,
                                      style: BorderStyle.solid,
                                      width: 3),
                                  columns: [
                                    DataColumn(
                                        label: Text(
                                      "".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "montant vendu".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                  rows: credits.map((produit) {
                                    montant_credit = 0;

                                    vente_credits.forEach((element) {
                                      if (element.date_vente == day &&
                                          element.user_uid == user_uid &&
                                          element.nom == produit.nom) {
                                        montant_credit += element.montant;
                                      }
                                    });
                                    return DataRow(cells: [
                                      DataCell(Text(
                                        produit.nom,
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        montant_credit.toString() + " XOF",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ]);
                                  }).toList()),
                            ),
                            Container(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 0.999,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue.shade800,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "Total de vente de crédits :"
                                          .toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      total_credits.toString() + " XOF",
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        )
                      : Container(),
                  Container(
                    height: 47,
                    width: MediaQuery.of(context).size.width * 0.999,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade900,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Icon(
                                Icons.monetization_on,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "Total de vente :".toUpperCase(),
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            total.toString() + " XOF",
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 47,
                    width: MediaQuery.of(context).size.width * 0.999,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade900,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Icon(
                                Icons.monetization_on,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "Bénéfice brute :".toUpperCase(),
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            benefice.floor().toString() + " XOF",
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

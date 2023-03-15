// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:deogracias/interface/centre_informatique/drawer_admin_centre.dart';
import 'package:deogracias/modele/centre_vente.dart';
import 'package:deogracias/modele/credit.dart';
import 'package:deogracias/modele/photocopie.dart';
import 'package:deogracias/modele/produit.dart';
import 'package:deogracias/modele/serigraphie.dart';
import 'package:deogracias/modele/vente_credit.dart';
import 'package:deogracias/modele/vente_photocopie.dart';
import 'package:deogracias/modele/vente_tee_shirts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoriqueVentePremiereDateCentre extends StatelessWidget {
  const HistoriqueVentePremiereDateCentre(
      {super.key, required this.premiere_date});
  final String premiere_date;
  @override
  Widget build(BuildContext context) {
    final credits = Provider.of<List<credit>>(context);
    final tee_shirt = Provider.of<List<serigraphie>>(context);
    final produits = Provider.of<List<products>>(context);
    final photocopies = Provider.of<List<Photocopies>>(context);
    final vente_credits = Provider.of<List<venteCredit>>(context);
    final vente_tee_shirts = Provider.of<List<venteteeshirts>>(context);
    final vente_produits = Provider.of<List<centreVente>>(context);
    final vente_photocopies = Provider.of<List<VentePhotocopies>>(context);
    int nombre_tee_shirts = 0;
    int nombre_credit = 0;
    int nombre_produits = 0;
    int nombre_photocopies = 0;
    int nbre_tee_shirts = 0;
    int nbre_produits = 0;
    int nbre_photocopies = 0;
    int total_credits = 0;
    int total_produits = 0;
    int total_photocopies = 0;
    int total_tee_shirt = 0;
    int montant_credit = 0;
    int montant_produits = 0;
    int montant_tee_shirt = 0;
    int montant_photocopies = 0;
    double benefice_credit = 0;
    int benefice_produits = 0;
    int benefice_tee_shirts = 0;
    int benefice_photocopies = 0;

    int total = 0;
    double benefice = 0;

    vente_credits.forEach((element) {
      if (element.date_vente == premiere_date) {
        nombre_credit++;
        total_credits += element.montant;
        benefice_credit += element.benefice;
      }
    });

    vente_photocopies.forEach((element) {
      if (element.created_at == premiere_date) {
        nombre_photocopies++;
        total_photocopies += element.montant;
        benefice_photocopies += element.benefice;
      }
    });

    vente_tee_shirts.forEach((element) {
      if (element.date_vente == premiere_date) {
        nombre_tee_shirts++;
        total_tee_shirt += element.montant;
        benefice_tee_shirts += element.benefice;
      }
    });

    vente_produits.forEach((element) {
      if (element.date_vente == premiere_date) {
        nombre_produits++;
        total_produits += element.montant;
        benefice_produits += element.benefice;
      }
    });

    total =
        total_credits + total_photocopies + total_tee_shirt + total_produits;
    benefice = benefice_credit +
        benefice_photocopies +
        benefice_tee_shirts +
        benefice_produits;

    if (nombre_photocopies <= 0 &&
        nombre_produits <= 0 &&
        nombre_credit <= 0 &&
        nombre_tee_shirts <= 0) {
      return Scaffold(
        backgroundColor: Colors.green.shade800,
        drawer: DrawerAdminCentre(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          centerTitle: true,
          actions: [
            Image.asset(
              "images/icon.jpeg",
              height: 60,
              width: 60,
              scale: 2.5,
            ),
          ],
          elevation: 0,
          title: Text(
            "Historique de vente",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerAdminCentre(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        centerTitle: true,
        actions: [
          Image.asset(
            "images/icon.jpeg",
            height: 60,
            width: 60,
            scale: 2.5,
          ),
        ],
        elevation: 0,
        title: Text(
          "Historique de vente",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                      image: AssetImage("images/image3.jfif"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Historique de vente du " + premiere_date,
              textAlign: TextAlign.center,
              style: GoogleFonts.alike(color: Colors.white, fontSize: 20),
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
                  nombre_produits > 0
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
                                    "Produits".toUpperCase(),
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
                                      "Stock physique".toUpperCase(),
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
                                  rows: produits.map((produit) {
                                    nbre_produits = 0;
                                    montant_produits = 0;

                                    vente_produits.forEach((element) {
                                      if (element.date_vente == premiere_date &&
                                          element.nom_produit == produit.nom) {
                                        nbre_produits += element.quantite;
                                        montant_produits += element.montant;
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
                                        nbre_produits.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.quantite_physique.toString(),
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
                                        montant_produits.toString() + " XOF",
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
                                      "Total produit :".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      total_produits.toString() + " XOF",
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 7,
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
                                      "Bénéfice produits :".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      benefice_produits.toString() + " XOF",
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
                  nombre_photocopies > 0
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
                                    "Photocopies".toUpperCase(),
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
                                      "Stock physique".toUpperCase(),
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
                                  rows: photocopies.map((produit) {
                                    nbre_photocopies = 0;
                                    montant_photocopies = 0;

                                    vente_photocopies.forEach((element) {
                                      if (element.created_at == premiere_date &&
                                          element.photocopie_uid ==
                                              produit.uid) {
                                        nbre_photocopies += element.nombre;
                                        montant_photocopies += element.montant;
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
                                        nbre_photocopies.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.quantite_physique.toString(),
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
                                        montant_photocopies.toString() + " XOF",
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
                                      "Total photocopies :".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      total_photocopies.toString() + " XOF",
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 7,
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
                                      "Bénéfice photocopies :".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      benefice_photocopies.toString() + " XOF",
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
                  nombre_tee_shirts > 0
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
                                    "Tee Shirts".toUpperCase(),
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
                                      "Stock physique".toUpperCase(),
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
                                  rows: tee_shirt.map((produit) {
                                    nbre_tee_shirts = 0;
                                    montant_tee_shirt = 0;

                                    vente_tee_shirts.forEach((element) {
                                      if (element.date_vente == premiere_date &&
                                          element.nom_tee_shirts ==
                                              produit.tee_shirt_nom) {
                                        nbre_tee_shirts += element.quantite;
                                        montant_tee_shirt += element.montant;
                                      }
                                    });

                                    return DataRow(cells: [
                                      DataCell(Text(
                                        produit.tee_shirt_nom,
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        nbre_tee_shirts.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.quantite_physique.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.prix_unitaire_vente.toString() +
                                            " XOF",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        montant_tee_shirt.toString() + " XOF",
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
                                      "Total tee shirts :".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      total_tee_shirt.toString() + " XOF",
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 7,
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
                                      "Bénéfice tee shirts :".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      benefice_tee_shirts.toString() + " XOF",
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
                              width: MediaQuery.of(context).size.width * 0.99,
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
                                      "Montant vendu".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Stock physique".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                  rows: credits.map((produit) {
                                    montant_credit = 0;

                                    vente_credits.forEach((element) {
                                      if (element.date_vente == premiere_date &&
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
                                      DataCell(Text(
                                        produit.montant_disponible.toString() +
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
                                      "Total crédits :".toUpperCase(),
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
                              height: 7,
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
                                      "Bénéfice crédits :".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      benefice_credit.floor().toString() +
                                          " XOF",
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
                  SizedBox(
                    height: 10,
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

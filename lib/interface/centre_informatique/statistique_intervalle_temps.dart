// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_interpolation_to_compose_strings, avoid_function_literals_in_foreach_calls, avoid_types_as_parameter_names, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/centre_vente.dart';
import '../../modele/credit.dart';
import '../../modele/produit.dart';
import '../../modele/serigraphie.dart';
import '../../modele/vente_credit.dart';
import '../../modele/vente_tee_shirts.dart';
import 'drawer_admin_centre.dart';

class StatistiqueIntervalleTemps extends StatelessWidget {
  StatistiqueIntervalleTemps({
    Key? key,
    required this.during_premiere_date,
    required this.during_deuxieme_date,
    required this.premiere_date,
    required this.deuxieme_date,
  }) : super(key: key);

  final int during_premiere_date;
  final int during_deuxieme_date;
  final String premiere_date;
  final String deuxieme_date;

  int total_credit = 0;
  double benefice_credit = 0;
  int total_produits = 0;
  int benefice_produit = 0;
  int total_tee_shirt = 0;
  int benefice_tte_shirt = 0;
  int total = 0;
  double benefice = 0;
  int montant_credit = 0;
  int montant_produit = 0;
  int quantite_produit = 0;
  int montant_tee_shirt = 0;
  int quantite_tee_shirt = 0;

  @override
  Widget build(BuildContext context) {
    final _tee_shirts = Provider.of<List<serigraphie>>(context);
    final _products = Provider.of<List<products>>(context);
    final _credits = Provider.of<List<credit>>(context);
    final _vente_credits = Provider.of<List<venteCredit>>(context);
    final _ventes_products = Provider.of<List<centreVente>>(context);
    final _ventes_tee_shirts = Provider.of<List<venteteeshirts>>(context);

    _vente_credits.forEach((element) {
      if (element.during >= during_premiere_date &&
          element.during <= during_deuxieme_date) {
        total_credit += element.montant;
        benefice_credit += element.benefice;
      }
    });

    _ventes_products.forEach((element) {
      if (element.during_date >= during_premiere_date &&
          element.during_date <= during_deuxieme_date) {
        total_produits += element.montant;
        benefice_produit += element.benefice;
      }
    });

    _ventes_tee_shirts.forEach((element) {
      if (element.during_date >= during_premiere_date &&
          element.during_date <= during_deuxieme_date) {
        total_tee_shirt += element.montant;
        benefice_tte_shirt += element.benefice;
      }
    });

    total = total_credit + total_produits + total_tee_shirt;
    benefice = benefice_credit + benefice_produit + benefice_tte_shirt;

    if (_tee_shirts.isEmpty ||
        _credits.isEmpty ||
        _products.isEmpty ||
        _ventes_tee_shirts.isEmpty ||
        _ventes_products.isEmpty ||
        _vente_credits.isEmpty) {
      return Scaffold(
        drawer: DrawerAdminCentre(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0.2,
          title: Text(
            "Ventesi",
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
      drawer: DrawerAdminCentre(),
      backgroundColor: Colors.green.shade900,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.2,
        title: Text(
          "Ventes",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Statistique des ventes enregstré entre le  " +
                    premiere_date +
                    " et le " +
                    deuxieme_date,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2),
              child: Container(
                width: double.infinity,
                height: 45,
                color: Colors.black87,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Vente de produits".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
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
                          "Produit".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
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
                      ))
                    ],
                    rows: _products.map((_produit) {
                      montant_produit = 0;
                      quantite_produit = 0;

                      _ventes_products.forEach((element) {
                        if (element.during_date >= during_premiere_date &&
                            element.during_date <= during_deuxieme_date &&
                            element.nom_produit == _produit.nom) {
                          quantite_produit += element.quantite;
                          montant_produit += element.montant;
                        }
                      });

                      return DataRow(cells: [
                        DataCell(
                          Text(
                            _produit.nom,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(
                          Text(
                            quantite_produit.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(
                          Text(
                            _produit.prix_unitaire.toString() + " F",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text(
                          montant_produit.toString() + " F",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                      ]);
                    }).toList())),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Total vente produits".toUpperCase(),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      total_produits.toString() + " F",
                      style: GoogleFonts.lato(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.black87,
                width: double.infinity,
                child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Bénéfice sur les produits",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          benefice_produit.toString() + " F",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2),
              child: Container(
                width: double.infinity,
                height: 45,
                color: Colors.black87,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Vente de tee shirts".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
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
                          "Tee Shirt".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
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
                      ))
                    ],
                    rows: _tee_shirts.map((credit) {
                      montant_tee_shirt = 0;
                      quantite_tee_shirt = 0;

                      _ventes_tee_shirts.forEach((element) {
                        if (element.during_date >= during_premiere_date &&
                            element.during_date <= during_deuxieme_date &&
                            element.nom_tee_shirts == credit.tee_shirt_nom) {
                          quantite_tee_shirt += element.quantite;
                          montant_tee_shirt += element.montant;
                        }
                      });

                      return DataRow(cells: [
                        DataCell(
                          Text(
                            credit.tee_shirt_nom,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(
                          Text(
                            quantite_tee_shirt.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(
                          Text(
                            credit.prix_unitaire_vente.toString() + " F",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text(
                          montant_tee_shirt.toString() + " F",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                      ]);
                    }).toList())),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Total vente tee shirt".toUpperCase(),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      total_tee_shirt.toString() + " F",
                      style: GoogleFonts.lato(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.black87,
                width: double.infinity,
                child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Bénéfice sur les tee shirt",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          benefice_tte_shirt.toString() + " F",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2),
              child: Container(
                width: double.infinity,
                height: 45,
                color: Colors.black87,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Vente de crédits".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
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
                          "Crédit".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "montant vendu".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                    rows: _credits.map((_credit) {
                      montant_credit = 0;

                      _vente_credits.forEach((element) {
                        if (element.during >= during_premiere_date &&
                            element.during <= during_deuxieme_date &&
                            element.nom == _credit.nom) {
                          montant_credit += element.montant;
                        }
                      });

                      return DataRow(cells: [
                        DataCell(
                          Text(
                            _credit.nom,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text(
                          montant_credit.toString() + " F",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                      ]);
                    }).toList())),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Total vente crédit".toUpperCase(),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      total_credit.toString() + " F",
                      style: GoogleFonts.lato(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.black87,
                width: double.infinity,
                child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Bénéfice sur le crédit",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          benefice_credit.floor().toString() + " F",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2),
              child: SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Totaux ventes".toUpperCase(),
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        total.toString() + " F",
                        style: GoogleFonts.lato(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2),
              child: Container(
                color: Colors.black87,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Bénéfice brute".toUpperCase(),
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        benefice.floor().toString() + " F",
                        style: GoogleFonts.lato(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

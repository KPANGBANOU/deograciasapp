// ignore_for_file: must_be_immutable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, avoid_function_literals_in_foreach_calls, prefer_interpolation_to_compose_strings, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../modele/bieere_petit_model.dart';
import '../../modele/bierre_grand_model.dart';
import '../../modele/donnesservants.dart';
import '../../modele/vente_grand_modele.dart';
import '../../modele/vente_petit_modele.dart';
import 'drawer_admin_bar.dart';

class StatistiqueGrandPetitModele extends StatelessWidget {
  StatistiqueGrandPetitModele({key});

  int peti_model_lenght = 0;
  int grand_model_lenght = 0;
  double petit_model_sizebox = 0;
  double grand_model_sizebox = 0;
  int total_petit_model = 0;
  int total_grand_model = 0;
  int totaux = 0;
  int nombre_vente_petit_modele = 0;
  int nombre_vente_grand_modele = 0;
  int quantite_grand_modele = 0;
  int quantite_petit_modele = 0;
  int montant_petit_modele = 0;
  int montant_grand_modele = 0;

  @override
  Widget build(BuildContext context) {
    final _donnesUtilisateur = Provider.of<donnesServants>(context);
    final _listVentepetitmodel = Provider.of<List<ventePetitModele>>(context);
    final _listVentegrandmodel = Provider.of<List<venteGrandModele>>(context);
    final _list_petit_modele =
        Provider.of<List<donneesBieerePetitModele>>(context);
    final _list_grand_modele =
        Provider.of<List<donnesBierresGrandModel>>(context);
    peti_model_lenght = _list_petit_modele.length;
    grand_model_lenght = _list_grand_modele.length;

    _listVentegrandmodel.forEach((element) {
      total_grand_model = total_grand_model + element.montant;
    });

    _listVentepetitmodel.forEach((element) {
      total_petit_model = total_petit_model + element.montant;
    });

    totaux = total_petit_model + total_grand_model;

    if (_list_grand_modele.isEmpty ||
        _list_petit_modele.isEmpty ||
        _listVentegrandmodel.isEmpty ||
        _listVentepetitmodel.isEmpty) {
      return Scaffold(
        drawer: DrawerAdminBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Statistique générale",
            style: GoogleFonts.lato(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0.4,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
        backgroundColor: Colors.green.shade900,
        drawer: DrawerAdminBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Statistique générale",
            style: GoogleFonts.lato(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(
                height: 95,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Entreprise Déo Gracias".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 21,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Statistique générale de vente de " +
                      _donnesUtilisateur.prenom.toString().toUpperCase() +
                      "  " +
                      _donnesUtilisateur.nom.toString().toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 62,
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
                    rows: _list_petit_modele.map((_vente) {
                      nombre_vente_petit_modele = 0;
                      quantite_petit_modele = 0;
                      montant_petit_modele = 0;

                      _listVentepetitmodel.forEach((element) {
                        if (element.nom_bierre == _vente.nom) {
                          nombre_vente_petit_modele++;
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
                        "Totale de vente de pétit modèle ".toUpperCase(),
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        total_petit_model.toString() + " F",
                        style: GoogleFonts.lato(
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
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              DataTable(
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
                  rows: _list_grand_modele.map((_vente) {
                    nombre_vente_grand_modele = 0;
                    quantite_grand_modele = 0;
                    montant_grand_modele = 0;

                    _listVentegrandmodel.forEach((element) {
                      if (element.nom_bierre == _vente.nom) {
                        nombre_vente_grand_modele++;
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
                        "Totale de vente de grand modèle ".toUpperCase(),
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        total_grand_model.toString() + " F",
                        style: GoogleFonts.lato(
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
                          "Totaux vente".toUpperCase(),
                          style: GoogleFonts.lato(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          totaux.toString() + " F",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              )
            ])));
  }
}

// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, prefer_final_fields, unused_field, prefer_const_constructors, avoid_unnecessary_containers, avoid_init_to_null, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings, non_constant_identifier_names, unused_local_variable, use_build_context_synchronously, dead_code, no_leading_underscores_for_local_identifiers, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/Bar_restaurant/enregistrer_nouvelle_bierre_gerant.dart';
import 'package:deogracias/interface/centre_informatique/centre_enregistrer_nouveau_produit_gerant.dart';
import 'package:deogracias/interface/enregistrer_depense_gerant.dart';
import 'package:deogracias/interface/new_password_gerant.dart';
import 'package:deogracias/interface/profil_gerant.dart';
import 'package:deogracias/modele/centre_vente.dart';
import 'package:deogracias/modele/vente_credit.dart';
import 'package:deogracias/modele/vente_grand_modele.dart';
import 'package:deogracias/modele/vente_petit_modele.dart';
import 'package:deogracias/modele/vente_photocopie.dart';
import 'package:deogracias/modele/vente_tee_shirts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../services/user.dart';
import 'Bar_restaurant/list_vente_credits_employe_bar_gerant.dart';
import 'bar_enregistrer_nouveau_matereil_gerant.dart';
import 'centre_enregistrer_nouveau_materiel_gerant.dart';
import 'centre_informatique/centre_enregistrer_nouveau_credit_gerant.dart';
import 'centre_informatique/centre_list_credit_clients_gerant.dart';
import 'centre_informatique/enregister_vente_a_credit_gerant.dart';
import 'centre_informatique/enregistrer_nouveau_produit_photocopie_gerant.dart';
import 'drawer_gerant.dart';
import 'enregistrer_depense_bar_gerant.dart';
import 'enregistrer_perte_bar_gerant.dart';
import 'enregistrer_pertes_gerant.dart';
import 'enregistrer_vente_a_credit_bar_gerant.dart';

class AccueilGerant extends StatelessWidget {
  AccueilGerant({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> ShowExitApp() async {
      return await showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: Text(
                    "Quitter l'application",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  content: Text(
                    "Voulez vous vraiment quitter Déo Gracias ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade900),
                            onPressed: (() {
                              Navigator.of(context).pop(true);
                            }),
                            child: Text(
                              "Confirmer",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: (() {
                              Navigator.of(context).pop(false);
                            }),
                            child: Text(
                              "Annuler",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              })) ??
          false;
    }

    Timestamp time = Timestamp.now();
    String date = DateFormat("yyyy-MM-dd").format(time.toDate());
    final user = Provider.of<donnesUtilisateur>(context);
    final vente_credit = Provider.of<List<venteCredit>>(context);
    final vente_produit = Provider.of<List<centreVente>>(context);
    final vente_grands_modeles = Provider.of<List<venteGrandModele>>(context);
    final vente_petit_modele = Provider.of<List<ventePetitModele>>(context);
    final vente_photocopie = Provider.of<List<VentePhotocopies>>(context);
    final vente_tee_shirt = Provider.of<List<venteteeshirts>>(context);
    int total_credit = 0;
    int total_produit = 0;
    int total_tee_shirt = 0;
    int total_grand_modele = 0;
    int total_petit_modele = 0;
    int total_photocopie = 0;

    vente_grands_modeles.forEach((element) {
      if (element.date_vente == date) {
        total_grand_modele += element.montant;
      }
    });

    vente_petit_modele.forEach((element) {
      if (element.date_vente == date) {
        total_petit_modele += element.montant;
      }
    });

    vente_credit.forEach((element) {
      if (element.date_vente == date) {
        total_credit += element.montant;
      }
    });

    vente_produit.forEach((element) {
      if (element.date_vente == date) {
        total_produit += element.montant;
      }
    });

    vente_tee_shirt.forEach((element) {
      if (element.date_vente == date) {
        total_tee_shirt += element.montant;
      }
    });

    vente_photocopie.forEach((element) {
      if (element.created_at == date) {
        total_photocopie += element.montant;
      }
    });

    return WillPopScope(
      onWillPop: ShowExitApp,
      child: Scaffold(
        backgroundColor: Colors.green.shade800,
        appBar: AppBar(
          actions: [
            Image.asset(
              "images/icon.jpeg",
              height: 60,
              width: 60,
              scale: 2.5,
            ),
          ],
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Déo Gracias",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: DrawerGerant(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    image: DecorationImage(
                        image: AssetImage(
                          "images/informatique2.jpg",
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Bonjour, " + user.prenom + " !",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              user.role != "Gerant"
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: Colors.brown.shade800,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Gérant",
                            style: GoogleFonts.alike(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.96,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(27)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(17),
                                topRight: Radius.circular(17)),
                            border: Border.all(
                                style: BorderStyle.solid,
                                width: 2,
                                color: Colors.lightBlue.shade900)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Grand modèle",
                                    style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        total_grand_modele.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "XOF".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                width: 2,
                                height: 60,
                                color: Colors.lightBlue.shade900,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pétit modèle",
                                    style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        total_petit_modele.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "XOF".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(17),
                                topRight: Radius.circular(17)),
                            border: Border.all(
                                style: BorderStyle.solid,
                                width: 2,
                                color: Colors.lightBlue.shade900)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Crédit",
                                    style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        total_credit.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "XOF".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                width: 2,
                                height: 60,
                                color: Colors.lightBlue.shade900,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Produit",
                                    style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        total_produit.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "XOF".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(17),
                                topRight: Radius.circular(17)),
                            border: Border.all(
                                style: BorderStyle.solid,
                                width: 2,
                                color: Colors.lightBlue.shade900)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Photocopie",
                                    style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        total_photocopie.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "XOF".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                width: 2,
                                height: 60,
                                color: Colors.lightBlue.shade900,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tee shirt",
                                    style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        total_tee_shirt.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "XOF".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        height: 45,
                        alignment: Alignment.center,
                        color: Colors.lightBlue.shade900,
                        width: MediaQuery.of(context).size.width * 0.94,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Personnalisez vos privilèges",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.rule_sharp,
                              color: Colors.white,
                            )
                          ],
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilGerant(),
                                  ));
                            },
                            child: Text(
                              "Profil",
                              style: GoogleFonts.alike(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EnregistrerNouvelBierreFormPageGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Ajouter une nouvelle bièrre",
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CentreEnregistrerNouveauProduitGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  "Ajouter un nouveau produit du centre informatique",
                                  softWrap: true,
                                  maxLines: 3,
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CentreEnregistrerNouveauPhotocopieGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  "Ajouter un nouveau produit de la photocopie",
                                  softWrap: true,
                                  maxLines: 3,
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CentreEnregistrerNouveauReseauCreditGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  "Ajouter un nouveau crédit de communication",
                                  softWrap: true,
                                  maxLines: 3,
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EnregistrerDepenseGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  "Enregistrer une dépense du centre informatique",
                                  softWrap: true,
                                  maxLines: 3,
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EnregistrerDepenseBarGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  "Enregistrer une dépense du restaurant",
                                  softWrap: true,
                                  maxLines: 3,
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CentreEnregistrerNouveauMaterielGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  "Ajouter un nouveau matériel du centre informatique bièrre",
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BarEnregistrerNouveauMaterielGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  "Ajouter un nouveau matériel du restaurant",
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EnregistrerPerteGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  "Enregistrer une perte du centre informatique",
                                  softWrap: true,
                                  maxLines: 3,
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EnregistrerPerteBarGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  "Enregistrer une perte du restaurant",
                                  softWrap: true,
                                  maxLines: 3,
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EnregistrerVenteACreditGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  "Enregistrer une vente à crédit du centre informatique",
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EnregistrerVenteACreditBarGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  "Enregistrer une vente à crédit du restaurant",
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CentreListCreditsClientsGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  "Ventes à crédits  du centre informatique",
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ListVenteCreditsEmployeBarGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Vente à crédits du restaurant",
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewPasswordGerant(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Mot de passe",
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.lightBlue.shade900,
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black12,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

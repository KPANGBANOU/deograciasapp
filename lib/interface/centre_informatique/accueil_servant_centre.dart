// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, prefer_final_fields, unused_field, prefer_const_constructors, avoid_unnecessary_containers, avoid_init_to_null, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings, non_constant_identifier_names, unused_local_variable, use_build_context_synchronously, dead_code, no_leading_underscores_for_local_identifiers, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/centre_informatique/centre_enregistrer_credit_client.dart';
import 'package:deogracias/interface/centre_informatique/centre_enregistrer_depense.dart';
import 'package:deogracias/interface/centre_informatique/enregistrer_perte_servant_centre.dart';
import 'package:deogracias/interface/new_%C3%A2ssword_servant_centre.dart';
import 'package:deogracias/interface/profil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../modele/centre_vente.dart';
import '../../modele/vente_credit.dart';
import '../../modele/vente_photocopie.dart';
import '../../modele/vente_tee_shirts.dart';
import '../../services/user.dart';
import 'centre_servant_drawer.dart';

class AccueilServantCentre extends StatelessWidget {
  AccueilServantCentre({key}) : super(key: key);

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

    final donnes = Provider.of<donnesUtilisateur>(context);
    Timestamp time = Timestamp.now();
    String date = DateFormat("yyyy-MM-dd").format(time.toDate());
    final vente_credit = Provider.of<List<venteCredit>>(context);
    final vente_produit = Provider.of<List<centreVente>>(context);
    final vente_photocopie = Provider.of<List<VentePhotocopies>>(context);
    final vente_tee_shirt = Provider.of<List<venteteeshirts>>(context);
    int total_credit = 0;
    int total_produit = 0;
    int total_tee_shirt = 0;
    int total_photocopie = 0;

    vente_credit.forEach((element) {
      if (element.date_vente == date && element.user_uid == donnes.uid) {
        total_credit += element.montant;
      }
    });

    vente_produit.forEach((element) {
      if (element.date_vente == date && element.user_uid == donnes.uid) {
        total_produit += element.montant;
      }
    });

    vente_tee_shirt.forEach((element) {
      if (element.date_vente == date && element.user_uid == donnes.uid) {
        total_tee_shirt += element.montant;
      }
    });

    vente_photocopie.forEach((element) {
      if (element.created_at == date && element.user_uid == donnes.uid) {
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
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        drawer: CentreServantdrawer(),
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
                    "Bonjour, " + donnes.prenom + " !",
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
              donnes.role != "Servant"
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
                            "Servant",
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
                                    builder: (context) => ProfilServantCentre(),
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
                                      EnregistrerPerteServantCentre(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Enregistrer une perte",
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
                                      CentreEnregistrerDepense(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Enregistrer une dépense",
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
                                      EnregistrerVenteACreditCentrre(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Enregistrer une vente à crédit",
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
                                  builder: (context) => NewPasswordCentre(),
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

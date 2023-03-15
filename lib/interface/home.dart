// ignore_for_file: prefer_const_constructors, unused_field, prefer_const_constructors_in_immutables, await_only_futures, must_be_immutable, non_constant_identifier_names, unused_local_variable, unused_import, no_leading_underscores_for_local_identifie, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, avoid_function_literals_in_foreach_calls, prefer_const_literals_to_create_immutables, unused_element, use_build_context_synchronously, dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/Bar_restaurant/initialiser_stock_bar.dart';
import 'package:deogracias/interface/centre_informatique/centre_initialise_stock.dart';
import 'package:deogracias/modele/budgetBar.dart';
import 'package:deogracias/modele/budget_centre.dart';
import 'package:deogracias/modele/credits_servants.dart';
import 'package:deogracias/modele/credits_vente.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';

import '../modele/donnesservants.dart';
import '../provider/provider_ajouter_photocpie.dart';
import '../services/user.dart';
import '../services/user_centre.dart';
import 'Bar_restaurant/enregistrer_nouvel_bierre.dart';
import 'Bar_restaurant/enregistrer_nouvel_materiel_bar.dart';
import 'Bar_restaurant/statistique_des_gerant.dart';
import 'accorder_droit.dart';
import 'centre_informatique/centre_enregistrer_nouveau_materiel.dart';
import 'centre_informatique/centre_enregistrer_nouveau_produit.dart';
import 'centre_informatique/centre_enregistrer_nouveau_reseau_credit.dart';
import 'centre_informatique/centre_informatique.dart';
import 'centre_informatique/enregister_nouveau_phtocopie.dart';
import 'centre_informatique/restaurant.dart';
import 'connexion.dart';
import 'drawer.dart';
import 'new_password_admin.dart';
import 'profil_admin.dart';

class HomePage extends StatefulWidget {
  HomePage({key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool affiche_centre = false;
  bool affiche_bar = false;
  bool affiche_credit_centre = false;
  bool affiche_credit_bar = false;
  bool statistique = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      affiche_bar = false;
      statistique = false;
      affiche_centre = false;
      affiche_credit_bar = false;
      affiche_credit_centre = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderAjoutPhotocopie>(context);
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

    int total_depense = 0;
    int total_perte = 0;
    double tota_benfice_brute = 0;
    int solde_total = 0;
    double total_benefice = 0;
    double benefice_centre = 0;
    double benefice_bar = 0;
    final user = Provider.of<donnesUtilisateur>(context);
    final budget_centre = Provider.of<budgetCentre>(context);
    final budget_bar = Provider.of<BudgetBar>(context);
    total_depense = budget_bar.depense + budget_centre.depense;
    total_perte = budget_bar.pertes + budget_centre.pertes;
    solde_total = budget_bar.solde_total + budget_centre.solde_total;
    total_benefice = budget_bar.benefice + budget_centre.benefice;
    if (total_benefice < total_depense + total_perte) {
      tota_benfice_brute = 0;
    } else {
      tota_benfice_brute = total_benefice - (total_depense + total_perte);
    }

    if (budget_bar.benefice < (budget_bar.depense + budget_bar.pertes)) {
      benefice_bar = 0;
    } else {
      benefice_bar =
          budget_bar.benefice - (budget_bar.pertes + budget_bar.depense);
    }

    if (budget_centre.benefice <
        (budget_centre.depense + budget_centre.pertes)) {
      benefice_centre = 0;
    } else {
      benefice_centre = budget_centre.benefice -
          (budget_centre.pertes + budget_centre.depense);
    }

    int credit_non_paye_centre = 0;
    int credit_non_paye_bar = 0;
    int credits_non_payes = 0;
    int credit_paye_centre = 0;
    int credit_paye_bar = 0;
    int credits_payes = 0;

    final vente_a_credits_centre =
        Provider.of<List<VenteACreditsCentre>>(context);
    final vents_a_credit_bar = Provider.of<List<VenteACreditBars>>(context);
    vente_a_credits_centre.forEach((element) {
      if (element.paye) {
        credit_paye_centre += element.montant;
      } else {
        credit_non_paye_centre += element.montant;
      }
    });
    vents_a_credit_bar.forEach((element) {
      if (element.paye) {
        credit_paye_bar += element.montant;
      } else {
        credit_non_paye_bar += element.montant;
      }
    });

    credits_payes = credit_paye_bar + credit_paye_centre;
    credits_non_payes = credit_non_paye_bar + credit_non_paye_centre;
    return WillPopScope(
      onWillPop: ShowExitApp,
      child: Scaffold(
        drawer: DrawerHome(),
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
          centerTitle: true,

          iconTheme: IconThemeData(color: Colors.black),
          //centerTitle: true,
          title: Text(
            "Déo Gracias",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("images/services.jpeg"),
                      fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 40, bottom: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Bonjour " + user.prenom + " !",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
            ),
            user.admin
                ? Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.lightBlue.shade900,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Administrateur",
                          style: GoogleFonts.alike(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.96,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
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
                                  "Solde actuel",
                                  style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      solde_total.toString(),
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
                                  "Bénéfice brute",
                                  style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      tota_benfice_brute.floor().toString(),
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
                                  "Dépenses",
                                  style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      total_depense.toString(),
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
                                  "Pertes",
                                  style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      total_perte.toString(),
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
                    height: 0,
                  ),
                  affiche_centre
                      ? Container()
                      : SizedBox(
                          height: 48,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue.shade900),
                            onPressed: () {
                              setState(() {
                                affiche_centre = true;
                              });
                            },
                            child: Text(
                              "Plus".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                  //centre informatique
                  affiche_centre
                      ? Column(
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue.shade900),
                                onPressed: () {},
                                child: Text(
                                  "Centre informatique".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.alike(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Solde actuel",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                budget_centre.solde_total
                                                    .toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Bénéfice brute",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                benefice_centre
                                                    .floor()
                                                    .toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        style: BorderStyle.solid,
                                        width: 2,
                                        color: Colors.lightBlue.shade900)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 20, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Dépenses",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                budget_centre.depense
                                                    .toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Pertes",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                budget_centre.pertes.toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                            ), //bar restaurant
                            SizedBox(
                              height: 4,
                            ),
                            affiche_bar
                                ? Container()
                                : SizedBox(
                                    height: 48,
                                    width: MediaQuery.of(context).size.width *
                                        0.90,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.lightBlue.shade900),
                                      onPressed: () {
                                        setState(() {
                                          affiche_bar = true;
                                        });
                                      },
                                      child: Text(
                                        "Plus".toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.alike(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                          ],
                        )
                      : Container(),

//restaurant

                  affiche_bar
                      ? Column(
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue.shade900),
                                onPressed: () {},
                                child: Text(
                                  "Bar restaurant".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.alike(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Solde actuel",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                budget_bar.solde_total
                                                    .toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Bénéfice brute",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                benefice_bar.floor().toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        style: BorderStyle.solid,
                                        width: 2,
                                        color: Colors.lightBlue.shade900)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 20, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Dépenses",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                budget_bar.depense.toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Pertes",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                budget_bar.pertes.toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                            affiche_credit_centre
                                ? Container()
                                : SizedBox(
                                    height: 48,
                                    width: MediaQuery.of(context).size.width *
                                        0.90,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.lightBlue.shade900),
                                      onPressed: () {
                                        setState(() {
                                          affiche_credit_centre = true;
                                        });
                                      },
                                      child: Text(
                                        "Plus".toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.alike(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                          ],
                        )
                      : Container(),

                  // credits_centre

                  affiche_credit_centre
                      ? Column(
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue.shade900),
                                onPressed: () {},
                                child: Text(
                                  "Crédits du centre".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.alike(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Non payés",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                credit_non_paye_centre
                                                    .toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Payés",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                credit_paye_centre.toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                            affiche_credit_bar
                                ? Container()
                                : SizedBox(
                                    height: 48,
                                    width: MediaQuery.of(context).size.width *
                                        0.90,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.lightBlue.shade900),
                                      onPressed: () {
                                        setState(() {
                                          affiche_credit_bar = true;
                                        });
                                      },
                                      child: Text(
                                        "Plus".toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.alike(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                          ],
                        )
                      : Container(),

//credits_bar

                  affiche_credit_bar
                      ? Column(
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue.shade900),
                                onPressed: () {},
                                child: Text(
                                  "Crédits du restaurant".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.alike(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Non payés",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                credit_non_paye_bar.toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Payés",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                credit_paye_bar.toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                            statistique
                                ? Container()
                                : SizedBox(
                                    height: 48,
                                    width: MediaQuery.of(context).size.width *
                                        0.90,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.lightBlue.shade900),
                                      onPressed: () {
                                        setState(() {
                                          statistique = true;
                                        });
                                      },
                                      child: Text(
                                        "Plus".toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.alike(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                          ],
                        )
                      : Container(),

// statistique

                  statistique
                      ? Column(
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue.shade900),
                                onPressed: () {},
                                child: Text(
                                  "Statistique des crédits".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.alike(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ), //centre informatique
                            SizedBox(
                              height: 2,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Total non payés",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                credits_non_payes.toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Total payés",
                                            style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade900,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                credits_payes.toString(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "XOF".toUpperCase(),
                                                style: GoogleFonts.alike(
                                                    color: Colors
                                                        .lightBlue.shade900,
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
                          ],
                        )
                      : Container(),

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
                                  builder: (context) => ProfilAdmin(),
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
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CentreInformatique(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Centre informatique",
                                textAlign: TextAlign.justify,
                                softWrap: true,
                                maxLines: 2,
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Restaurant(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Restaurant",
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AccoredrDroitsListEmploye(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Accorder de privilèges aux employés",
                                textAlign: TextAlign.justify,
                                softWrap: true,
                                maxLines: 2,
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CentreEnregistrerNouveauProduit(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Ajouter un nouveau produit du centre informatique",
                                softWrap: true,
                                maxLines: 2,
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CentreEnregistrerNouveauReseauCredit(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Ajouter un nouveau crédit",
                                textAlign: TextAlign.justify,
                                softWrap: true,
                                maxLines: 2,
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Ajouter un nouveau produit de la photocopie",
                                softWrap: true,
                                maxLines: 2,
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CentreEnregistrerNouveauMateriel(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Ajouter un nouveau matériel du centre",
                                softWrap: true,
                                maxLines: 2,
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EnregistrerNouvelMaterielBar(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Ajouter un nouveau matériel  du bar restaurant",
                                softWrap: true,
                                maxLines: 2,
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CentreEnregistrerNouveauPhotocopie(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Ajouter un nouveau produit de la photocopie",
                                softWrap: true,
                                maxLines: 2,
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EnregistrerNouvelBierreFormPage(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Ajouter une nouvelle bièrre",
                                softWrap: true,
                                maxLines: 2,
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
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InitialiseStockCentre(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Réinitialisation du stock du centre informatique",
                                softWrap: true,
                                maxLines: 2,
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InitialiseStockBar(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Réinitialisation du stock du bar restaurant",
                                softWrap: true,
                                maxLines: 2,
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StatistiqueListGerant(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Ventes journalières des gérants",
                                softWrap: true,
                                maxLines: 2,
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
                    padding: const EdgeInsets.only(left: 25, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewPassword(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
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
          ]),
        ),
      ),
    );
  }
}

Future _speak(String text) async {
  final FlutterTts _flutter_tts = FlutterTts();
  _flutter_tts.setLanguage("Fr");
  _flutter_tts.setSpeechRate(0.5);
  _flutter_tts.setVolume(0.5);
  _flutter_tts.setPitch(1.0);
  _flutter_tts.speak(text);
}

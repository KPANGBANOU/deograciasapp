// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, sort_child_properties_last, unred_type_equality_checks, use_build_context_synchronously, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_gerant.dart';
import 'package:deogracias/provider/provider_affiche.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/credit.dart';

class CentreApprovisionnementCreditGerant extends StatelessWidget {
  CentreApprovisionnementCreditGerant({key});

  TextEditingController _quantite = TextEditingController();
  int quantite = 0;
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _credit = Provider.of<credit>(context);
    final _provider = Provider.of<ProviderAffiche>(context);
    affiche = _provider.affiche;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerGerant(),
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
          _credit.nom,
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("images/reseau2.jpg"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Approvisionnement de " + _credit.nom,
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
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Montant d'approvisionnement",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15,
              ),
              child: TextField(
                controller: _quantite,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.shade900,
                        textStyle: TextStyle()),
                    child: affiche
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                )),
                          )
                        : Text(
                            "Réchargez le stock".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                    onPressed: (() async {
                      _provider.affiche_true();
                      quantite = _quantite.text.isNotEmpty
                          ? int.parse(_quantite.text)
                          : 0;

                      try {
                        if (_quantite.text.isEmpty || quantite <= 0) {
                          _provider.affiche_false();
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Vous n'avez pas renseigné le montant que vous voudriez réchargez ou le montant saisi est incorrecte. Veuillez réessayez svp !",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.8),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        } else {
                          await FirebaseFirestore.instance
                              .collection("reseaux_communication")
                              .doc(_credit.uid)
                              .update({
                            "approvisionne": true,
                            "montant_disponible":
                                _credit.montant_disponible + quantite,
                            "montant_initial":
                                _credit.montant_initial + quantite,
                            "montant_disponible_cumule":
                                _credit.montant_disponible_cumule + quantite,
                            "montant_initial_cumule":
                                _credit.montant_initial_cumule + quantite,
                          });

                          _quantite.clear();
                          _provider.affiche_false();

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Le réchargement de stock de " +
                                      _credit.nom.toString() +
                                      " a été effectué avec succès. Vous disponez maintenant de " +
                                      _credit.montant_disponible.toString() +
                                      " F de " +
                                      _credit.nom.toString() +
                                      "  en stock",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            backgroundColor: Colors.black87,
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        }
                      } catch (e) {
                        _provider.affiche_false();
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Une erreur inattendue s'est produite pendant le réchargement de stock de " +
                                    _credit.nom.toString() +
                                    "! Vérifiez votre connection internet et réessayez",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          backgroundColor: Colors.redAccent.withOpacity(.8),
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snakbar);
                      }
                    }),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

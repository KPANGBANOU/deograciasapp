// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, sort_child_properties_last, unred_type_equality_checks, empty_catches, use_build_context_synchronously, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/bieere_petit_model.dart';
import '../../provider/pr_ovider_gestion_gerant.dart';
import '../drawer_gerant.dart';

class ApprovisionnementPetitModeleGerant extends StatelessWidget {
  ApprovisionnementPetitModeleGerant({key});

  TextEditingController _quantite = TextEditingController();
  int quantite = 0;
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _produit = Provider.of<donneesBieerePetitModele>(context);
    final _provider = Provider.of<ProviderGestionGerant>(context);
    affiche = _provider.approvisionner_petit_modele;
    return Scaffold(
      drawer: DrawerGerant(),
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
          _produit.nom,
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
                      image: AssetImage("images/bierre_bon.webp"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Réchargement de stock",
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
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Quantité d'approvisionnement svp",
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
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    hintStyle: GoogleFonts.lato(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 20, bottom: 70),
                child: SizedBox(
                    height: 50,
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown.shade900),
                          onPressed: (() async {
                            _provider.put_approvisionner_petit_modele_true();
                            quantite = _quantite.text.isNotEmpty
                                ? int.parse(_quantite.text)
                                : 0;

                            try {
                              if (_quantite.text.isEmpty || quantite <= 0) {
                                _provider
                                    .put_approvisionner_petit_modele_false();
                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Vous n'avez pas renseigné la quantité que vous voudriez réchargez ou la quantité saisie est incorrrecte. Veuillez réessayez svp !",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  backgroundColor:
                                      Colors.redAccent.withOpacity(.8),
                                  elevation: 10,
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.all(5),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snakbar);
                              } else {
                                await FirebaseFirestore.instance
                                    .collection("bierres_petit_modele")
                                    .doc(_produit.uid)
                                    .update({
                                  "approvisionne": true,
                                  "quantite_initial":
                                      _produit.quantite_initial + quantite,
                                  "quantite_physique":
                                      _produit.quantite_physique + quantite,
                                  "quantite_initial_cumule":
                                      _produit.quantite_initial_cumule +
                                          quantite,
                                  "quantite_physique_cumule":
                                      _produit.quantite_physique_cumule +
                                          quantite,
                                });
                                _provider
                                    .put_approvisionner_petit_modele_false();

                                _quantite.clear();

                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Le réchargement de stock de " +
                                            _produit.nom +
                                            " a été effectué avec succès. Vous disponez maintenant de " +
                                            _produit.quantite_physique
                                                .toString() +
                                            " " +
                                            _produit.nom +
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
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snakbar);
                              }
                            } catch (e) {
                              _provider.put_approvisionner_grand_modele_false();
                              final snakbar = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Une erreur inattendue s'est produite pendant le réchargement de stock de " +
                                          _produit.nom.toString() +
                                          "! Vérifiez votre connection internet et réessayez",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                backgroundColor:
                                    Colors.redAccent.withOpacity(.8),
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(5),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snakbar);
                            }
                          }),
                          child: affiche
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: CircularProgressIndicator(
                                        color: Colors.cyanAccent,
                                      )),
                                )
                              : Text(
                                  "Réchargez le stock".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.alike(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                        )))),
          ],
        ),
      ),
    );
  }
}

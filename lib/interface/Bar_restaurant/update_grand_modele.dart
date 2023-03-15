// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, unused_field, unused_local_variable, non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, unred_type_equality_checks, prefer_const_declarations, prefer_is_empty, override_on_non_overriding_member, unnecessary_null_comparison, prefer_interpolation_to_compose_strings, prefer_conditional_assignment

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/bierre_grand_model.dart';
import '../../provider/provider_admin_centre.dart';
import '../../services/user.dart';
import 'drawer_admin_bar.dart';

class UpdateGrandModele extends StatelessWidget {
  UpdateGrandModele({
    key,
  }) : super(key: key);

  @override
  TextEditingController nomProduit = TextEditingController();
  TextEditingController seuilAprovisionnement = TextEditingController();
  TextEditingController prix_unitaire = TextEditingController();
  TextEditingController prix_unitaire_achat = TextEditingController();
  TextEditingController quantite_physique = TextEditingController();

  int seuil = 0;
  String nom = "";
  bool result = true;
  int prix = 0;
  bool affiche = false;
  int prix_achat = 0;
  int stock_physique = 0;

  @override
  Widget build(BuildContext context) {
    final _donnesUtilisateur = Provider.of<donnesUtilisateur>(context);
    final _produit = Provider.of<donnesBierresGrandModel>(context);
    final _affiche = Provider.of<ProviderAdminCentre>(context);
    affiche = _affiche.mise_jour_grand_modele;
    nomProduit.text = _produit.nom.isNotEmpty ? _produit.nom : "";
    seuilAprovisionnement.text = _produit.seuil_approvisionnement > 0
        ? _produit.seuil_approvisionnement.toString()
        : "0";
    prix_unitaire.text =
        _produit.prix_unitaire > 0 ? _produit.prix_unitaire.toString() : "0";
    prix_unitaire_achat.text = _produit.prix_unitaire_achat > 0
        ? _produit.prix_unitaire_achat.toString()
        : "0";
    quantite_physique.text = _produit.quantite_physique > 0
        ? _produit.quantite_physique.toString()
        : "0";
    return Scaffold(
        backgroundColor: Colors.green.shade800,
        drawer: DrawerAdminBar(),
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
          centerTitle: true,
          elevation: 0,
          title: Text(
            _produit.nom,
            style: GoogleFonts.alike(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
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
                "Mise à jour de la bièrre",
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
                    "Nom de la bièrre",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextFormField(
                  onTap: () {
                    _speak("Nom de la bièrre");
                  },
                  autocorrect: true,
                  enableSuggestions: true,
                  controller: nomProduit,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.white.withOpacity(.7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Prix unitaire d'achat de cette bièrre",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15),
                child: TextFormField(
                  onTap: () {
                    _speak("Prix unitaire d'achat");
                  },
                  controller: prix_unitaire_achat,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Prix unitaire de vente de la bièrre",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15),
                child: TextFormField(
                  onTap: () {
                    _speak("Prix unitaire de vente");
                  },
                  controller: prix_unitaire,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Stock physique de la bièrre",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15),
                child: TextFormField(
                  onTap: () {
                    _speak("Stock physique de la bièrre");
                  },
                  controller: quantite_physique,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Seuil d'approvisionnement de la bièrre",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15),
                child: TextFormField(
                  onTap: () {
                    _speak("Seuil d'approvisionnement");
                  },
                  controller: seuilAprovisionnement,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 15.0, left: 15, bottom: 40),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        _affiche.mise_jour_grand_modele_true();
                        try {
                          seuil = seuilAprovisionnement.text.isNotEmpty
                              ? int.parse(seuilAprovisionnement.text)
                              : _produit.seuil_approvisionnement > 0
                                  ? _produit.seuil_approvisionnement
                                  : 0;
                          nom = nomProduit.text.isNotEmpty
                              ? nomProduit.text
                              : _produit.nom.isNotEmpty
                                  ? _produit.nom
                                  : "";
                          prix = prix_unitaire.text.isNotEmpty
                              ? int.parse(prix_unitaire.text)
                              : _produit.prix_unitaire > 0
                                  ? _produit.prix_unitaire
                                  : 0;
                          prix_achat = prix_unitaire_achat.text.isNotEmpty
                              ? int.parse(prix_unitaire_achat.text)
                              : _produit.prix_unitaire_achat > 0
                                  ? _produit.prix_unitaire_achat
                                  : 0;

                          stock_physique = quantite_physique.text.isNotEmpty
                              ? int.parse(quantite_physique.text)
                              : _produit.quantite_physique > 0
                                  ? _produit.quantite_physique
                                  : 0;

                          if (prix < prix_achat) {
                            _affiche.mise_jour_grand_modele_false();
                            _speak(
                                "Le prix unitaire de vente de cette bièrre doit etre plus grand ou égale au prix unitaire d'achat. Veuillez corriger. Merci");

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Le prix unitaire de vente doit etre plus grand ou égale au prix unitaire d'achat de la bièrre !",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              backgroundColor: Colors.redAccent.withOpacity(.8),
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(5),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                          } else {
                            if (nom == _produit.nom) {
                              // si aucun nom n'est saisi
                              var diff =
                                  _produit.quantite_physique - stock_physique;

                              if (diff > 0) {
                                await FirebaseFirestore.instance
                                    .collection("bierres_grand_modele")
                                    .doc(_produit.uid)
                                    .update({
                                  "quantite_initial":
                                      _produit.quantite_initial - diff,
                                  "quantite_initial_cumule":
                                      _produit.quantite_initial_cumule - diff,
                                  "quantite_physique": stock_physique,
                                  "quantite_physique_cumule": stock_physique,
                                  "seuil_approvisionnement": seuil,
                                  "prix_unitaire": prix,
                                  "prix_unitaire_achat": prix_achat,
                                  "update_at": DateTime.now()
                                });
                              } else if (diff < 0) {
                                await FirebaseFirestore.instance
                                    .collection("bierres_grand_modele")
                                    .doc(_produit.uid)
                                    .update({
                                  "quantite_initial":
                                      _produit.quantite_initial + (-1 * diff),
                                  "quantite_initial_cumule":
                                      _produit.quantite_initial_cumule +
                                          (-1 * diff),
                                  "quantite_physique": stock_physique,
                                  "quantite_physique_cumule": stock_physique,
                                  "seuil_approvisionnement": seuil,
                                  "prix_unitaire": prix,
                                  "prix_unitaire_achat": prix_achat,
                                  "update_at": DateTime.now()
                                });
                              } else {
                                await FirebaseFirestore.instance
                                    .collection("bierres_grand_modele")
                                    .doc(_produit.uid)
                                    .update({
                                  "seuil_approvisionnement": seuil,
                                  "prix_unitaire": prix,
                                  "prix_unitaire_achat": prix_achat,
                                  "update_at": DateTime.now()
                                });
                              }

                              _affiche.mise_jour_grand_modele_false();
                              _speak(
                                  "La mise à jour  des informations de cette bièrre a été effectué avec succès.");

                              nomProduit.clear();
                              prix_unitaire.clear();
                              seuilAprovisionnement.clear();
                              prix_unitaire_achat.clear();
                              quantite_physique.clear();
                              final snakbar = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "La mise à jour des informations de cette bièrre a été effectuée avec succès",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                backgroundColor: Colors.black87,
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(5),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snakbar);
                            } else {
                              final _result = await FirebaseFirestore.instance
                                  .collection("bierres_grand_modele")
                                  .where("nom", isEqualTo: nom)
                                  .get();

                              result = _result.docs.isEmpty;

                              if (!result) {
                                // si le nom existe deja
                                _affiche.mise_jour_grand_modele_false();

                                _speak(
                                    "Le nom que vous avez saisi existe dèjà. Veuillez modifier le nom et réessayer. Merci");

                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Le nouveau nom que vous proposez correspondant à une bièrre  qui existe dans la base de donnée !",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
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
                                var diff =
                                    _produit.quantite_physique - stock_physique;

                                if (diff > 0) {
                                  await FirebaseFirestore.instance
                                      .collection("bierres_grand_modele")
                                      .doc(_produit.uid)
                                      .update({
                                    "nom": nom,
                                    "quantite_initial":
                                        _produit.quantite_initial - diff,
                                    "quantite_initial_cumule":
                                        _produit.quantite_initial_cumule - diff,
                                    "quantite_physique": stock_physique,
                                    "quantite_physique_acumule": stock_physique,
                                    "seuil_approvisionnement": seuil,
                                    "prix_unitaire": prix,
                                    "prix_unitaire_achat": prix_achat,
                                    "update_at": DateTime.now()
                                  });
                                } else if (diff < 0) {
                                  await FirebaseFirestore.instance
                                      .collection("bierres_grand_modele")
                                      .doc(_produit.uid)
                                      .update({
                                    "nom": nom,
                                    "quantite_initial":
                                        _produit.quantite_initial + (-1 * diff),
                                    "quantite_initial_cumule":
                                        _produit.quantite_initial_cumule +
                                            (-1 * diff),
                                    "quantite_physique": stock_physique,
                                    "quantite_physique_acumule": stock_physique,
                                    "seuil_approvisionnement": seuil,
                                    "prix_unitaire": prix,
                                    "prix_unitaire_achat": prix_achat,
                                    "update_at": DateTime.now()
                                  });
                                } else {
                                  await FirebaseFirestore.instance
                                      .collection("bierres_grand_modele")
                                      .doc(_produit.uid)
                                      .update({
                                    "nom": nom,
                                    "seuil_approvisionnement": seuil,
                                    "prix_unitaire": prix,
                                    "prix_unitaire_achat": prix_achat,
                                    "update_at": DateTime.now()
                                  });
                                }

                                _affiche.mise_jour_grand_modele_false();
                                _speak(
                                    "La mise à jour des informations de cette bièrre a été effectué avec succès.");

                                nomProduit.clear();
                                prix_unitaire.clear();
                                seuilAprovisionnement.clear();
                                prix_unitaire_achat.clear();
                                quantite_physique.clear();
                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "La mise à jour de cette bièrre a été effectuée avec succès",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
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
                            }
                          }

                          // ignore: empty_catches
                        } catch (e) {
                          _affiche.mise_jour_grand_modele_false();
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Une erreur inattendue s'est produite pendant cette opération. Vérifiez votre connection internet et réessayez !",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.8),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: affiche
                            ? CircularProgressIndicator(
                                color: Colors.cyanAccent,
                              )
                            : Text(
                                "Mise à jour".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      )),
                ),
              )
            ],
          ),
        ));
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

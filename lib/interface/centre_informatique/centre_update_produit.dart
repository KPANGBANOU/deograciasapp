// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, unused_field, unused_local_variable, non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, unred_type_equality_checks, prefer_const_declarations, prefer_is_empty, override_on_non_overriding_member, unnecessary_null_comparison, prefer_interpolation_to_compose_strings, prefer_conditional_assignment

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/produit.dart';
import '../../provider/serac.dart';
import '../../services/user.dart';
import 'drawer_admin_centre.dart';

class CentreUpdateProduit extends StatelessWidget {
  CentreUpdateProduit({
    key,
  }) : super(key: key);

  @override
  TextEditingController nomProduit = TextEditingController();
  TextEditingController seuilAprovisionnement = TextEditingController();
  TextEditingController prix_unitaire = TextEditingController();
  TextEditingController prix_unitaire_achat = TextEditingController();
  TextEditingController quantite_physique = TextEditingController();
  bool affiche = false;

  int seuil = 0;
  String nom = "";
  bool result = true;
  int prix = 0;
  int prix_achat = 0;
  int stock_physique = 0;

  @override
  Widget build(BuildContext context) {
    final _donnesUtilisateur = Provider.of<donnesUtilisateur>(context);
    final _produit = Provider.of<products>(context);
    final _provider = Provider.of<Search>(context);
    affiche = _provider.val;

    nomProduit.text = _produit.nom.isNotEmpty ? _produit.nom : "";
    prix_unitaire_achat.text = _produit.prix_unitaire_achat > 0
        ? _produit.prix_unitaire_achat.toString()
        : "0";
    prix_unitaire.text =
        _produit.prix_unitaire > 0 ? _produit.prix_unitaire.toString() : "0";
    seuilAprovisionnement.text = _produit.seuil_approvisionnement > 0
        ? _produit.seuil_approvisionnement.toString()
        : "0";
    quantite_physique.text = _produit.quantite_physique > 0
        ? _produit.quantite_physique.toString()
        : "0";

    return Scaffold(
        backgroundColor: Colors.green.shade800,
        drawer: DrawerAdminCentre(),
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
                color: Colors.black, fontWeight: FontWeight.bold),
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
                        image: AssetImage("images/informatique2.jpg"),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Mise à jour de " + _produit.nom,
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
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nom du produit",
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
                  onChanged: (value) {
                    _provider.changenomproduit(value);
                  },
                  onTap: () {
                    _speak("Nom du produit");
                  },
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
                    "Prix unitaire d'achat du produit",
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
                  onChanged: (value) {
                    _provider.change_prix_achat(value);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    "Prix unitaire de vente du produit",
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
                  onChanged: (value) {
                    _provider.change_prix_vente(value);
                  },
                  keyboardType: TextInputType.number,
                  controller: prix_unitaire,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    "Stock physique de " + _produit.nom,
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
                    _speak("Stock physique");
                  },
                  onChanged: (value) {
                    _provider.change_prix_vente(value);
                  },
                  keyboardType: TextInputType.number,
                  controller: quantite_physique,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    "Seuil d'approvisionnement du produit",
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
                  controller: seuilAprovisionnement,
                  onChanged: (value) {
                    _provider.change_seuil(value);
                  },
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
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          _provider.puttrue();
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
                          if (prix <= prix_achat) {
                            _provider.putfalse();

                            _speak(
                                "Le prix unitaire unitaire de vente de ce produit doit etre plus grand ou égale au prix unitaire d'achat de ce produit. Veuillez corriger et réessayez. Merci");

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Le prix unitaire de vente saisi est inferieur au prix unitaire d'achat du produit. Veuillez corriger cette errreur",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              backgroundColor: Colors.redAccent.withOpacity(.7),
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(5),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                          } else {
                            if (nom == _produit.nom) {
                              var diff =
                                  _produit.quantite_physique - stock_physique;
                              if (diff > 0) {
                                await FirebaseFirestore.instance
                                    .collection("produits_centre")
                                    .doc(_produit.uid)
                                    .update({
                                  "quantite_initial":
                                      _produit.quantite_initial - diff,
                                  "quantite_initial_cumule":
                                      _produit.quantite_initial_cumule - diff,
                                  "quantite_physiquen": stock_physique,
                                  "quantite_physique_cumule": stock_physique,
                                  "seuil_approvisionnement": seuil,
                                  "prix_unitaire": prix,
                                  "prix_unitaire_achat": prix_achat,
                                  "update_at": DateTime.now()
                                });
                              } else if (diff < 0) {
                                await FirebaseFirestore.instance
                                    .collection("produits_centre")
                                    .doc(_produit.uid)
                                    .update({
                                  "quantite_initial":
                                      _produit.quantite_initial + (-1 * diff),
                                  "quantite_initial_cumule":
                                      _produit.quantite_initial_cumule +
                                          (-1 * diff),
                                  "quantite_physiquen": stock_physique,
                                  "quantite_physique_cumule": stock_physique,
                                  "seuil_approvisionnement": seuil,
                                  "prix_unitaire": prix,
                                  "prix_unitaire_achat": prix_achat,
                                  "update_at": DateTime.now()
                                });
                              } else {
                                await FirebaseFirestore.instance
                                    .collection("produits_centre")
                                    .doc(_produit.uid)
                                    .update({
                                  "seuil_approvisionnement": seuil,
                                  "prix_unitaire": prix,
                                  "prix_unitaire_achat": prix_achat,
                                  "update_at": DateTime.now()
                                });
                              }

                              nomProduit.clear();
                              prix_unitaire.clear();
                              seuilAprovisionnement.clear();
                              prix_unitaire_achat.clear();
                              quantite_physique.clear();
                              _speak(
                                  "La mise à jour des informations rélatives à ce produit a été éffectué avec succès");

                              _provider.putfalse();

                              final snakbar = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "La mise à jour de ce produit a été effectué avec succès",
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
                              // verifier si le nom existe deja

                              final _result = await FirebaseFirestore.instance
                                  .collection("produits_centre")
                                  .where("nom", isEqualTo: nom)
                                  .get();

                              result = _result.docs.isEmpty;

                              if (result) {
                                // s'il n'existe pas
                                var diff =
                                    _produit.quantite_physique - stock_physique;
                                if (diff > 0) {
                                  await FirebaseFirestore.instance
                                      .collection("produits_centre")
                                      .doc(_produit.uid)
                                      .update({
                                    "nom": nom,
                                    "quantite_initial":
                                        _produit.quantite_initial - diff,
                                    "quantite_initial_cumule":
                                        _produit.quantite_initial_cumule - diff,
                                    "quantite_physiquen": stock_physique,
                                    "quantite_physique_cumule": stock_physique,
                                    "seuil_approvisionnement": seuil,
                                    "prix_unitaire": prix,
                                    "prix_unitaire_achat": prix_achat,
                                    "update_at": DateTime.now()
                                  });
                                } else if (diff < 0) {
                                  await FirebaseFirestore.instance
                                      .collection("produits_centre")
                                      .doc(_produit.uid)
                                      .update({
                                    "nom": nom,
                                    "quantite_initial":
                                        _produit.quantite_initial + diff,
                                    "quantite_initial_cumule":
                                        _produit.quantite_initial_cumule + diff,
                                    "quantite_physiquen": stock_physique,
                                    "quantite_physique_cumule": stock_physique,
                                    "seuil_approvisionnement": seuil,
                                    "prix_unitaire": prix,
                                    "prix_unitaire_achat": prix_achat,
                                    "update_at": DateTime.now()
                                  });
                                } else {
                                  await FirebaseFirestore.instance
                                      .collection("produits_centre")
                                      .doc(_produit.uid)
                                      .update({
                                    "nom": nom,
                                    "seuil_approvisionnement": seuil,
                                    "prix_unitaire": prix,
                                    "prix_unitaire_achat": prix_achat,
                                    "update_at": DateTime.now()
                                  });
                                }
                                _speak(
                                    "La mise à jour des informations rélatives à ce produit a été éffectué avec succès");

                                nomProduit.clear();
                                prix_unitaire.clear();
                                seuilAprovisionnement.clear();
                                prix_unitaire_achat.clear();
                                quantite_physique.clear();
                                _provider.putfalse();

                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "La mise à jour de ce produit a été effectué avec succès",
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
                                // s'il existe deja
                                _provider.putfalse();
                                _speak(
                                    "Le nouveau nom proposé existe dèjà. Veuillez modifier le nom et réessayez. Merci");
                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Le nouveau nom que vous proposez correspondant à un produit qui existe dejà dans la base de donnée !",
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
                              }
                            }
                          }

                          // ignore: empty_catches
                        } catch (e) {
                          _provider.putfalse();
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
                          backgroundColor: Colors.brown.shade900),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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

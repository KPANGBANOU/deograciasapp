// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, unused_field, unused_local_variable, non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, unred_type_equality_checks, prefer_const_declarations, prefer_is_empty, override_on_non_overriding_member, unnecessary_null_comparison, prefer_interpolation_to_compose_strings, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer.dart';
import 'package:deogracias/provider/provider_nouveau_produit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../services/user.dart';

class CentreEnregistrerNouveauProduit extends StatelessWidget {
  CentreEnregistrerNouveauProduit({key}) : super(key: key);

  @override
  TextEditingController nomProduit = TextEditingController();
  TextEditingController quantiteInitial = TextEditingController();
  TextEditingController prixUnitaire = TextEditingController();
  TextEditingController seuilAprovisionnement = TextEditingController();
  TextEditingController prix_unitaire_achat_saisie = TextEditingController();
  int prix = 0;
  int seuil = 0;
  int quantite = 0;
  String nom = "";
  String quantite_initial = "";
  String prix_unitaire_achat = "";
  String prix_unitaire_vente = "";
  String seuil_approvisionnement = "";
  bool result = true;
  int prix_achat = 0;
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _donnesUtilisateur = Provider.of<donnesUtilisateur>(context);
    final provider = Provider.of<ProviderNouveauProduit>(context);
    affiche = provider.affiche;
    nom = provider.nom;
    quantite_initial = provider.quantite_initial;
    prix_unitaire_achat = provider.prix_unitaire_achat;
    prix_unitaire_vente = provider.prix_unitaire_vente;
    seuil_approvisionnement = provider.seuil_approvisionnement;
    return Scaffold(
        backgroundColor: Colors.green.shade800,
        drawer: DrawerHome(),
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
            "Nouveau produit",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
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
                "Nouveau produit",
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
                child: TextField(
                  controller: nomProduit,
                  keyboardType: TextInputType.name,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.white.withOpacity(.7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                nom.isEmpty ? Colors.redAccent : Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_nom(value);
                  },
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Prix unitaire d'achat",
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
                child: TextField(
                  onTap: () {
                    _speak("Saisissez le prix unitaire d'achat");
                  },
                  controller: prix_unitaire_achat_saisie,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: prix_unitaire_achat.isEmpty
                                ? Colors.redAccent
                                : Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_prix_unitaire_achat(value);
                  },
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Prix unitaire de vente",
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
                child: TextField(
                  onTap: () {
                    _speak(
                        "Saisissez le prix unitaire de vente qui soit supérieur ou égale au prix unitaire d'achat");
                  },
                  controller: prixUnitaire,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: prix_unitaire_vente.isEmpty
                                ? Colors.redAccent
                                : Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_prix_unitaire_vente(value);
                  },
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Stock initial du produit",
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
                child: TextField(
                  onTap: () {
                    _speak("Quel est la quantité initiale ?");
                  },
                  controller: quantiteInitial,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: quantite_initial.isEmpty
                                ? Colors.redAccent
                                : Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_quantite_initial(value);
                  },
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Seuil d'approvisionnement",
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
                child: TextField(
                  onTap: () {
                    _speak("Quel est le seuil d'approvisionnement ?");
                  },
                  controller: seuilAprovisionnement,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: seuil_approvisionnement.isEmpty
                                ? Colors.redAccent
                                : Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_seuil_approvisionnement(value);
                  },
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 15.0, left: 15, bottom: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        provider.affiche_true();
                        try {
                          prix = prixUnitaire.text.isNotEmpty
                              ? int.parse(prixUnitaire.text).floor()
                              : 0;

                          quantite = quantiteInitial.text.isNotEmpty
                              ? int.parse(quantiteInitial.text).floor()
                              : 0;

                          seuil = seuilAprovisionnement.text.isNotEmpty
                              ? int.parse(seuilAprovisionnement.text).floor()
                              : 0;

                          nom = nomProduit.text.isNotEmpty
                              ? nomProduit.text.toLowerCase()
                              : "";
                          prix_achat =
                              prix_unitaire_achat_saisie.text.isNotEmpty
                                  ? int.parse(prix_unitaire_achat_saisie.text)
                                      .floor()
                                  : 0;

                          if (prixUnitaire.text.isEmpty ||
                              prix_unitaire_achat_saisie.text.isEmpty ||
                              seuilAprovisionnement.text.isEmpty ||
                              nomProduit.text.isEmpty ||
                              quantiteInitial.text.isEmpty ||
                              prix <= 0 ||
                              prix_achat <= 0 ||
                              quantite < 0 ||
                              seuil < 0) {
                            _speak(
                                "Vous devriez s'il vous plait renseigné tous les champs. Veuillez vérifier surtout si vous avez bien renseigné ces informations ");
                            provider.affiche_false();
                            final snakbar = SnackBar(
                              // verication des donnees de saisi
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Vous n'avez pas renseigné tous les champs ou un des champs a été mal renseigné. Veuillez réessayer svp !",
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
                            // si les donnees sont correctes
                            final _result = await FirebaseFirestore.instance
                                .collection("produits_centre")
                                .where("nom", isEqualTo: nom)
                                .get();

                            result = _result.docs.isEmpty;
// verification de l'unicité du produit
                            if (result) {
                              // si le produit n'existe pas encore
                              if (prix < prix_achat) {
                                // verifer que le prix d'achat inferieur au prix de vente
                                _speak(
                                    "Le prix unitaire de vente doit etre plus grand ou égale au prix unitaire d'achat du produit. Vérifiez les données que vous avez renseignées et réessayez ");
                                provider.affiche_false();

                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Une erreur de votre niveau s'est produite pendant que vous enregistrez ce produit. Vous avez saisi un prix unitaire de vente plus pétit que le prix unitaire d'achat. Ce qui n'est pas logique.\n Veuillez réessayer svp !",
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
                                /// si la condition est veriféé
                                ///

                                await FirebaseFirestore.instance
                                    .collection("produits_centre")
                                    .add({
                                  "approvisionne": false,
                                  "montant_vendu": 0,
                                  "montant_vendu_cumule": 0,
                                  "nom": nom,
                                  "benefice": 0,
                                  "benefice_cumule": 0,
                                  "quantite_initial": quantite,
                                  "quantite_initial_cumule": quantite,
                                  "quantite_physique": quantite,
                                  "quantite_physique_cumule": quantite,
                                  "prix_unitaire": prix,
                                  "prix_unitaire_achat": prix_achat,
                                  "seuil_approvisionnement": seuil,
                                  "created_at": DateTime.now(),
                                  "update_at": DateTime.now()
                                });

                                nomProduit.clear();
                                quantiteInitial.clear();
                                prixUnitaire.clear();
                                seuilAprovisionnement.clear();
                                prix_unitaire_achat_saisie.clear();
                                provider.affiche_false();
                                _speak(
                                    "Produit ajouté avec succès dans la base de données");

                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Le produit " +
                                          nom +
                                          " a été ajouté dans la base de données",
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
                            } else {
                              // si le produit existe deja
                              provider.affiche_false();
                              _speak(
                                  "Le produit que vous voudriez ajouter existe déjà dans la base de données. Veuillez si possible modifier le nom du produit et réessayez ");
                              final snakbar = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Le produit que vous voudriez ajouter existe dejà dans la base de donnée !",
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

                          // ignore: empty_catches
                        } catch (e) {
                          provider.affiche_false();
                          _speak("Une erreur inattendue s'est produite ");
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
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    )),
                              )
                            : Text(
                                "Enregistrez le produit".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
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

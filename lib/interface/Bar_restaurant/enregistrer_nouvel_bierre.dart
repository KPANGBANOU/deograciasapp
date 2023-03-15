// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, unused_field, unused_local_variable, non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, unred_type_equality_checks, prefer_const_declarations, prefer_is_empty, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer.dart';
import 'package:deogracias/provider/provider_nouvelle_bierre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../services/user.dart';

class EnregistrerNouvelBierreFormPage extends StatelessWidget {
  EnregistrerNouvelBierreFormPage({key}) : super(key: key);

  String type_bierre_selectionne = "Grand modèle";

  TextEditingController nomProduit = TextEditingController();
  TextEditingController quantiteInitial = TextEditingController();
  TextEditingController prixUnitaire = TextEditingController();
  TextEditingController seuilAprovisionnement = TextEditingController();
  TextEditingController prixUnitaire_achat = TextEditingController();
  int prix = 0;
  int prix_achat = 0;
  int seuil = 0;
  int quantite = 0;
  String nom = "";
  String quantite_initial = "";
  String prix_unitaire_achat_provider = "";
  String prix_unitaire_vente = "";
  String seuil_approvisionnement = "";
  bool result = false;
  String conca = "";
  String conca_lowercase = "";
  bool affiche = false;
  bool result2 = false;
  @override
  Widget build(BuildContext context) {
    final _donnesUtilisateur = Provider.of<donnesUtilisateur>(context);
    final service = Provider.of<serviceBD>(context);
    final provider = Provider.of<ProviderNouvelleBierre>(context);
    type_bierre_selectionne = provider.type;
    affiche = provider.affiche;
    nom = provider.nom;
    quantite_initial = provider.quantite_initial;
    prix_unitaire_achat_provider = provider.prix_unitaire_achat;
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
            "Nouvelle bièrre",
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
                        image: AssetImage("images/bierre_bon.webp"),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Nouvelle bièrre",
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
                    "Modèle de la bièrre",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              RadioListTile(
                title: Text(
                  "Grand modèle".toUpperCase(),
                  style: GoogleFonts.alike(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                value: "Grand modèle",
                groupValue: type_bierre_selectionne,
                onChanged: (value) {
                  provider.change_type(value);
                },
              ),
              RadioListTile(
                title: Text(
                  "Pétit modèle".toUpperCase(),
                  style: GoogleFonts.alike(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                value: "Pétit modèle",
                groupValue: type_bierre_selectionne,
                onChanged: (value) {
                  provider.change_type(value);
                },
              ),
              SizedBox(
                height: 35,
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
                child: TextField(
                  controller: nomProduit,
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
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Prix unitaire d'achat de la bièrre",
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
                  controller: prixUnitaire_achat,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: prix_unitaire_achat_provider.isEmpty
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
                child: TextField(
                  onTap: () {
                    _speak(
                        "Saisissez le prix unitaire de vente supérieur ou égale au prix unitaire d'achat ");
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
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Stock initial de la bièrre",
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
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Seuil d'approvisionnement de cette bièrre",
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
                height: 18,
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
                        prix = prixUnitaire.text.isNotEmpty
                            ? int.parse(prixUnitaire.text)
                            : 0;
                        quantite = quantiteInitial.text.isNotEmpty
                            ? int.parse(quantiteInitial.text)
                            : 0;
                        seuil = seuilAprovisionnement.text.isNotEmpty
                            ? int.parse(seuilAprovisionnement.text)
                            : 0;
                        nom = nomProduit.text.isNotEmpty
                            ? nomProduit.text.toLowerCase()
                            : "";

                        prix_achat = prixUnitaire_achat.text.isNotEmpty
                            ? int.parse(prixUnitaire_achat.text)
                            : 0;

                        try {
                          if (type_bierre_selectionne.isEmpty ||
                              nomProduit.text.isEmpty ||
                              prixUnitaire.text.isEmpty ||
                              quantiteInitial.text.isEmpty ||
                              prix_achat <= 0 ||
                              prix <= 0 ||
                              quantite < 0 ||
                              seuil < 0 ||
                              prixUnitaire_achat.text.isEmpty ||
                              seuilAprovisionnement.text.isEmpty) {
                            _speak(
                                "Tous les champs sont recquis. vérifiez surtout si vous avez bien renseigné les  informations ");
                            // vérification de sasie
                            provider.affiche_false();
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Vous n'avez pas renseigné tous les champs ou certains champs renseignés sont incorrectes. Tous ces champs sont obligatoires svp !",
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
                            // si c'est le grand modèle

                            if (type_bierre_selectionne == "Grand modèle") {
                              final _result = await FirebaseFirestore.instance
                                  .collection("bierres_grand_modele")
                                  .where("nom", isEqualTo: nom)
                                  .get();

                              result = _result.docs.isEmpty;

                              if (result) {
                                // si ce bierre grand modele n'existe pas
                                if (prix > prix_achat) {
                                  // cohérence de saisie

                                  await FirebaseFirestore.instance
                                      .collection("bierres_grand_modele")
                                      .add({
                                    "approvisionne": false,
                                    "montant_vendu": 0,
                                    "montant_vendu_cumule": 0,
                                    "benefice": 0,
                                    "benefice_cumule": 0,
                                    "prix_unitaire_achat": prix_achat,
                                    "nom": nom,
                                    "quantite_initial": quantite,
                                    "quantite_initial_cumule": quantite,
                                    "quantite_physique": quantite,
                                    "quantite_physique_cumule": quantite,
                                    "prix_unitaire": prix,
                                    "seuil_approvisionnement": seuil,
                                    "created_at": DateTime.now(),
                                    "update_at": DateTime.now(),
                                    "type": type_bierre_selectionne,
                                  });

                                  nomProduit.clear();
                                  quantiteInitial.clear();
                                  prixUnitaire.clear();
                                  seuilAprovisionnement.clear();
                                  prixUnitaire_achat.clear();
                                  provider.affiche_false();
                                  _speak(
                                      "Cette bièrre a été ajouté avec succès dans  la base données ");

                                  final snakbar = SnackBar(
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Le produit " +
                                            nom +
                                            " a été ajouté au stock avec succès",
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
                                  // incoherence de saisie de donnéés
                                  _speak(
                                      "Le prix unitaire de vente de la bièrre doit etre plus grand ou égale au prix unitaire d'achat. ");
                                  provider.affiche_false();
                                  final snakbar = SnackBar(
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Il y a une incohérence dans votre enregistrement. Le produit unitaire de vente doit etre plus grand que le prix unitaire d'achat !",
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
                              } else {
                                provider.affiche_false();
                                _speak(
                                    "Cette bièrre existe déjà dans la base de données.  ");
                                // si le produit existe

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
                            } else {
                              // si c'est pétit modèle

                              final _result1 = await FirebaseFirestore.instance
                                  .collection("bierres_petit_modele")
                                  .where("nom", isEqualTo: nom)
                                  .get();

                              result2 = _result1.docs.isEmpty;

                              if (result2) {
                                if (prix > prix_achat) {
                                  // si ce produit n'existespas encore
                                  await FirebaseFirestore.instance
                                      .collection("bierres_petit_modele")
                                      .add({
                                    "approvisionne": false,
                                    "montant_vendu": 0,
                                    "benefice": 0,
                                    "prix_unitaire_achat": prix_achat,
                                    "nom": nom,
                                    "quantite_initial": quantite,
                                    "quantite_physique": quantite,
                                    "prix_unitaire": prix,
                                    "seuil_approvisionnement": seuil,
                                    "created_at": DateTime.now(),
                                    "update_at": DateTime.now(),
                                    "type": type_bierre_selectionne,
                                  });

                                  nomProduit.clear();
                                  quantiteInitial.clear();
                                  prixUnitaire.clear();
                                  seuilAprovisionnement.clear();
                                  prixUnitaire_achat.clear();

                                  provider.affiche_false();
                                  _speak(
                                      "Cette bièrre a été ajoutéé avec succès dans la base de données ");

                                  final snakbar = SnackBar(
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Le produit " +
                                            nom +
                                            " a été ajouté au stock avec succès",
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
                                  _speak(
                                      "Le prix unitaire de vente doit etre plus grand ou égale au prix unitaire d'achat ");
                                  provider.affiche_false();
                                  final snakbar = SnackBar(
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Incohérence de données. Le prix unitaire d'achat saisie est plus grand que le prix unitaire de vente. Résaisissez de valeurs juste svp svp !",
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
                              } else {
                                _speak(
                                    "La bièrre que vous voulez ajouter existe déjà. ");
                                provider.affiche_false();
                                // si le produit existe

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
                          }
                        } catch (e) {
                          _speak("Une erreur s'est produite ");
                          provider.affiche_false();
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
                          backgroundColor: Colors.brown.shade800),
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
                                "Enregistrez la biérre".toUpperCase(),
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

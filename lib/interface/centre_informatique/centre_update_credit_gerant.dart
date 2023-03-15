// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, unused_field, unused_local_variable, non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, unred_type_equality_checks, prefer_const_declarations, prefer_is_empty, override_on_non_overriding_member, unnecessary_null_comparison, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_gerant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/credit.dart';
import '../../provider/serac.dart';
import '../../services/user.dart';

class CentreUpdateCreditGerant extends StatelessWidget {
  CentreUpdateCreditGerant({key}) : super(key: key);

  @override
  TextEditingController nomReseau = TextEditingController();
  TextEditingController seuilAprovisionnement = TextEditingController();
  TextEditingController benefice = TextEditingController();
  TextEditingController montant_disponible = TextEditingController();

  int seuil = 0;
  int benefice_sur_500 = 0;
  String nom = "";
  bool result = true;
  bool affiche = false;
  int stock_physique = 0;

  @override
  Widget build(BuildContext context) {
    final _donnesUtilisateur = Provider.of<donnesUtilisateur>(context);
    final _credit = Provider.of<credit>(context);
    final _provider = Provider.of<Search>(context);
    affiche = _provider.val;
    nomReseau.text = _credit.nom.isNotEmpty ? _credit.nom : "";
    seuilAprovisionnement.text = _credit.seuil_approvisionnement > 0
        ? _credit.seuil_approvisionnement.toString()
        : "0";
    benefice.text = _credit.benefice_sur_5000 > 0
        ? _credit.benefice_sur_5000.toString()
        : "0";
    montant_disponible.text = _credit.montant_disponible > 0
        ? _credit.montant_disponible.toString()
        : "0";

    return Scaffold(
        backgroundColor: Colors.green.shade800,
        drawer: DrawerGerant(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            Image.asset(
              "images/icon.jpeg",
              height: 60,
              width: 60,
              scale: 2.5,
            ),
          ],
          centerTitle: true,
          elevation: 0,
          title: Text(
            _credit.nom,
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
                        image: AssetImage("images/reseau2.jpg"),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Reséau mobile " + _credit.nom,
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
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nom du crédit",
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
                  controller: nomReseau,
                  onTap: () {
                    _speak("Nom du réseau de communication");
                  },
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
                    "Stock physique du crédit",
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
                  controller: montant_disponible,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                child: TextFormField(
                  controller: seuilAprovisionnement,
                  onTap: () {
                    _speak("Seuil d'approvisionnement");
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    "Bénéfice sur 5000 F de vente de " + _credit.nom,
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
                    _speak("Bénéfice de vente de 5000 Franc de ce crédit");
                  },
                  controller: benefice,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        _provider.puttrue();

                        try {
                          stock_physique = montant_disponible.text.isNotEmpty
                              ? int.parse(montant_disponible.text)
                              : _credit.montant_disponible > 0
                                  ? _credit.montant_disponible
                                  : 0;
                          nom = nomReseau.text.isNotEmpty
                              ? nomReseau.text
                              : _credit.nom.isNotEmpty
                                  ? _credit.nom
                                  : "";
                          seuil = seuilAprovisionnement.text.isNotEmpty
                              ? int.parse(seuilAprovisionnement.text)
                              : _credit.seuil_approvisionnement > 0
                                  ? _credit.seuil_approvisionnement
                                  : 0;
                          benefice_sur_500 = benefice.text.isNotEmpty
                              ? int.parse(benefice.text)
                              : _credit.benefice_sur_5000 > 0
                                  ? _credit.benefice_sur_5000
                                  : 0;
                          if (nom.isEmpty ||
                              seuil <= 0 ||
                              benefice_sur_500 < 0 ||
                              benefice_sur_500 > 300 ||
                              benefice_sur_500 < 200 ||
                              stock_physique < 0) {
                            _speak(
                                "Toutes les informations doivent etre renseigné. Vérifiez surtout si vous avez bien renseigné ces informations. Merci");
                            _provider.putfalse();
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Tous les champs sont recquis !",
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
                            if (nom == _credit.nom) {
                              var diff =
                                  _credit.montant_disponible - stock_physique;

                              if (diff > 0) {
                                await FirebaseFirestore.instance
                                    .collection("reseaux_communication")
                                    .doc(_credit.uid)
                                    .update({
                                  "seuil_approvisionnement": seuil,
                                  "montant_initial_cumule":
                                      _credit.montant_initial_cumule - diff,
                                  "montant_disponible_cumule": stock_physique,
                                  "montant_initial":
                                      _credit.montant_initial - diff,
                                  "montant_disponible": stock_physique,
                                  "benefice_sur_5000": benefice_sur_500,
                                  "update_at": DateTime.now(),
                                });
                              } else if (diff < 0) {
                                await FirebaseFirestore.instance
                                    .collection("reseaux_communication")
                                    .doc(_credit.uid)
                                    .update({
                                  "seuil_approvisionnement": seuil,
                                  "montant_initial_cumule":
                                      _credit.montant_initial_cumule +
                                          (-1 * diff),
                                  "montant_disponible_cumule": stock_physique,
                                  "montant_initial":
                                      _credit.montant_initial + (-1 * diff),
                                  "montant_disponible": stock_physique,
                                  "benefice_sur_5000": benefice_sur_500,
                                  "update_at": DateTime.now(),
                                });
                              } else {
                                await FirebaseFirestore.instance
                                    .collection("reseaux_communication")
                                    .doc(_credit.uid)
                                    .update({
                                  "seuil_approvisionnement": seuil,
                                  "benefice_sur_5000": benefice_sur_500,
                                  "update_at": DateTime.now(),
                                });
                              }

                              nomReseau.clear();
                              seuilAprovisionnement.clear();
                              benefice.clear();
                              montant_disponible.clear();

                              _provider.putfalse();
                              _speak(
                                  "La mise à jour des informations de ce crédit a été éffectué avec succès ");
                              final snakbar = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "La mise à jour des informations de ce crédit a été effectué avec succès",
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
                                  .collection("reseaux_communication")
                                  .where("nom", isEqualTo: nom)
                                  .get();
                              result = _result.docs.isEmpty;

                              if (result) {
                                var diff =
                                    _credit.montant_disponible - stock_physique;
                                if (diff > 0) {
                                  await FirebaseFirestore.instance
                                      .collection("reseaux_communication")
                                      .doc(_credit.uid)
                                      .update({
                                    "nom": nom,
                                    "seuil_approvisionnement": seuil,
                                    "montant_initial_cumule":
                                        _credit.montant_initial_cumule - diff,
                                    "montant_disponible_cumule": stock_physique,
                                    "montant_initial":
                                        _credit.montant_initial - diff,
                                    "montant_disponible": stock_physique,
                                    "benefice_sur_5000": benefice_sur_500,
                                    "update_at": DateTime.now(),
                                  });
                                } else if (diff < 0) {
                                  await FirebaseFirestore.instance
                                      .collection("reseaux_communication")
                                      .doc(_credit.uid)
                                      .update({
                                    "nom": nom,
                                    "seuil_approvisionnement": seuil,
                                    "montant_initial_cumule":
                                        _credit.montant_initial_cumule + diff,
                                    "montant_disponible_cumule": stock_physique,
                                    "montant_initial":
                                        _credit.montant_initial + diff,
                                    "montant_disponible": stock_physique,
                                    "benefice_sur_5000": benefice_sur_500,
                                    "update_at": DateTime.now(),
                                  });
                                } else {
                                  await FirebaseFirestore.instance
                                      .collection("reseaux_communication")
                                      .doc(_credit.uid)
                                      .update({
                                    "nom": nom,
                                    "seuil_approvisionnement": seuil,
                                    "benefice_sur_5000": benefice_sur_500,
                                    "update_at": DateTime.now(),
                                  });
                                }
                                nomReseau.clear();
                                seuilAprovisionnement.clear();
                                benefice.clear();
                                montant_disponible.clear();

                                _provider.putfalse();
                                _speak(
                                    "La mise à jour des informations de ce crédit a été éffectué avec succès ");
                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "La mise à jour des informations de ce crédit a été effectué avec succès",
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
                                _provider.putfalse();
                                _speak(
                                    "Le nom que vous avez saisi existe déjà. Veuillez modifier le nom et réessayez. Merci");
                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Le nom saisi existe déjà . Veuillez réessayez svp !",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  backgroundColor:
                                      Colors.redAccent.withOpacity(.7),
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
                          backgroundColor: Colors.black87),
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

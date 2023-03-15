// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, unused_local_variable, unred_type_equality_checks, no_leading_underscores_for_local_identifiers, prefer_final_fields, unused_field, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/Bar_restaurant/drawer_servant.dart';
import 'package:deogracias/modele/budgetBar.dart';
import 'package:deogracias/provider/provider_perte.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import '../../services/user.dart';

class BarEnregistrerDepense extends StatelessWidget {
  BarEnregistrerDepense({key}) : super(key: key);

  TextEditingController _montant = TextEditingController();
  TextEditingController _description = TextEditingController();
  String message = "";
  int montant = 0;
  bool affiche = false;
  @override
  Widget build(BuildContext context) {
    final _donnesUser = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<ProviderPerte>(context);
    affiche = _provider.affiche;

    final _budget_centre = Provider.of<BudgetBar>(context);
    return Scaffold(
      drawer: servantdrawer(),
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        actions: [
          Image.asset(
            "images/icon.jpeg",
            scale: 4.5,
            height: 100,
            width: 100,
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Dépense du restaurant",
          style: GoogleFonts.alike(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    image: DecorationImage(
                        image: AssetImage(
                          "images/resto1.jfif",
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.92,
                decoration: BoxDecoration(
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.black87,
                        width: 3)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Enregistrer les dépenses que vous réalisez"
                          .toUpperCase(),
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
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
                    "Déscription de la dépense",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
                child: TextField(
                    maxLines: 7,
                    autocorrect: true,
                    enableSuggestions: true,
                    controller: _description,
                    decoration: InputDecoration(
                      contentPadding: // Text Field height
                          EdgeInsets.symmetric(
                        vertical: 40.0,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Montant dépensé",
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
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _montant,
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        _provider.affiche_true();

                        try {
                          montant = _montant.text.isNotEmpty
                              ? int.parse(_montant.text)
                              : 0;
                          if (_description.text.isEmpty ||
                              _montant.text.isEmpty ||
                              montant <= 0) {
                            _speak(
                                "Tous les champs sont recquis. Vérifiez si vous avez bien renseigné les informations ");
                            _provider.affiche_false();
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Tous les champs sont obligatoires svp !",
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
                                .collection("depenses")
                                .add({
                              'user_uid': _donnesUser.uid,
                              'user_nom': _donnesUser.nom,
                              'user_prenom': _donnesUser.prenom,
                              'created_at': DateTime.now(),
                              'description': _description.text,
                              'montant': montant,
                              'numero': _donnesUser.telephone,
                              'numero_watsapp': _donnesUser.email
                            });

                            await FirebaseFirestore.instance
                                .collection("budget")
                                .doc(_budget_centre.uid)
                                .update({
                              "depense": _budget_centre.depense + montant,
                            });

                            _description.clear();
                            _montant.clear();
                            _provider.affiche_false();
                            _speak(
                                "Votre dépense a été enregistré avec succàs dans la base de données");
                            message = _donnesUser.prenom
                                    .toString()
                                    .toUpperCase() +
                                " ,  Votre depense a été enregistré avec succès !"
                                    .toUpperCase();

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  message,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
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
                          _speak("Une erreur inattendue s'est produite ");
                          message =
                              "Une erreure inattendue s'est produite pendant l'enregistrement. Vérifiez votre connection internet et si le montant saisi n'est pas à virgule et réeessayez svp !"
                                  .toUpperCase();

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                message,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.7),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown.shade900,
                          textStyle: TextStyle()),
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
                                "Enregistrez la dépense".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      )),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          )),
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

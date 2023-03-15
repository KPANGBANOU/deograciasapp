// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, must_be_immutable, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer.dart';
import 'package:deogracias/modele/photocopie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/credit.dart';
import '../../modele/produit.dart';
import '../../modele/serigraphie.dart';
import '../../provider/provider_admin_centre.dart';

class InitialiseStockCentre extends StatelessWidget {
  InitialiseStockCentre({
    key,
  }) : super(key: key);

  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _credits = Provider.of<List<credit>>(context);
    final _produits = Provider.of<List<products>>(context);
    final _tee_shirts = Provider.of<List<serigraphie>>(context);
    final photocopies = Provider.of<List<Photocopies>>(context);
    final _provider = Provider.of<ProviderAdminCentre>(context);
    affiche = _provider.initi_bar;
    if (_credits.isEmpty && _produits.isEmpty && _tee_shirts.isEmpty) {
      return Scaffold(
        drawer: DrawerHome(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.2,
          centerTitle: true,
          title: Text(
            "Réinitialisation",
            style: GoogleFonts.alike(color: Colors.black, fontSize: 12),
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.cyan,
          ),
        ),
      );
    }

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
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Réinitialisation",
          style: GoogleFonts.alike(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("images/materiel_centre2.jfif"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Réinitialisation de stock",
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Etes vous vraiment sur de vouloir réinitialiser le stock du centre informatique de cette entreprise ?",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 80),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87),
                    onPressed: (() async {
                      _provider.put_init_bar_true();
                      try {
                        _speak("Réinitialisation  du stock lancée");

                        if (_credits.isNotEmpty) {
                          _credits.forEach((element) async {
                            if (element.montant_initial !=
                                element.montant_initial_cumule) {
                              await FirebaseFirestore.instance
                                  .collection("reseaux_communication")
                                  .doc(element.uid)
                                  .update({
                                "montant_initial": element.montant_disponible,
                                "benefice": 0.toDouble()
                              });
                            }
                          });
                        }
                        if (_produits.isNotEmpty) {
                          _produits.forEach((element) async {
                            if (element.quantite_initial !=
                                element.quantite_initial_cumule) {
                              await FirebaseFirestore.instance
                                  .collection("produit_centre")
                                  .doc(element.uid)
                                  .update({
                                "quantite_initial": element.quantite_physique,
                                "benefice": 0,
                                "montant_vendu": 0
                              });
                            }
                          });
                        }

                        if (photocopies.isNotEmpty) {
                          _produits.forEach((element) async {
                            if (element.quantite_initial !=
                                element.quantite_initial_cumule) {
                              await FirebaseFirestore.instance
                                  .collection("photocopies")
                                  .doc(element.uid)
                                  .update({
                                "quantite_initial": element.quantite_physique,
                                "benefice": 0,
                                "montant_vendu": 0
                              });
                            }
                          });
                        }

                        if (_tee_shirts.isNotEmpty) {
                          _tee_shirts.forEach((element) async {
                            if (element.quantite_initial !=
                                element.quantite_initial_cumule) {
                              await FirebaseFirestore.instance
                                  .collection("tee_shirts")
                                  .doc(element.uid)
                                  .update({
                                "quantite_initial": element.quantite_physique,
                                "benefice": 0,
                                "montant_vendu": 0
                              });
                            }
                          });
                        }
                        _speak(
                            "Réinitialisation du stock terminée avec succès");
                        var message =
                            "Réinitialisation terminée avec succès avec succès !";

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
                        _provider.put_init_bar_false();
                      } catch (e) {
                        _provider.put_init_bar_false();
                        _speak(
                            "Echec de réinitialisation de stock du centre informatique. Vérifiez votre connection s'il vous plait");
                        var message =
                            "Echec de réinitialisation de stock du centre informatique. Vérifiez votre connection s'il vous plait";

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
                          backgroundColor: Colors.redAccent,
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snakbar);
                      }
                    }),
                    child: affiche
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              color: Colors.cyan,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Réinitialisation".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
              ),
            )
          ],
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

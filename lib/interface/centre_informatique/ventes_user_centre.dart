// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_interpolation_to_compose_strings, must_be_immutable, no_leading_underscores_for_local_identifiers, prefer_final_fields, avoid_function_literals_in_foreach_calls

import 'package:deogracias/interface/centre_informatique/vente_user_centre_intervalle.dart';
import 'package:deogracias/interface/centre_informatique/vente_user_deuxieme_date.dart';
import 'package:deogracias/modele/vente_photocopie.dart';
import 'package:deogracias/provider/provider_affiche.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import '../../modele/centre_vente.dart';
import '../../modele/vente_credit.dart';
import '../../modele/vente_tee_shirts.dart';
import '../drawer_gerant.dart';

class VentesUserCentre extends StatelessWidget {
  VentesUserCentre({
    key,
    required this.user_nom,
    required this.user_prenom,
    required this.user_uid,
  }) : super(key: key);
  final String user_nom;
  final String user_prenom;
  final String user_uid;
  TextEditingController _premiere_date = TextEditingController();
  TextEditingController _deuxieme_date = TextEditingController();
  int nombre_credit = 0;
  int nombre_produit = 0;
  int nombre_tee_shirt = 0;
  int during_premiere_date = 0;
  int during_deuxieme_date = 0;
  bool affiche = false;
  @override
  Widget build(BuildContext context) {
    final _credits = Provider.of<List<venteCredit>>(context);
    final _produits = Provider.of<List<centreVente>>(context);
    final _tee_shirts = Provider.of<List<venteteeshirts>>(context);
    final photocopies = Provider.of<List<VentePhotocopies>>(context);
    final provider = Provider.of<ProviderAffiche>(context);
    affiche = provider.affiche;
    int nombre_credit = 0;
    int nombre_produit = 0;
    int nombre_tee_shirt = 0;
    int nombre_photocopie = 0;
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
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        title: Text(
          user_prenom,
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("images/informatique.jpg"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Les ventes de " + user_prenom,
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
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Première date svp",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15, bottom: 30),
              child: TextField(
                onTap: () async {
                  var deuxieme_date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));
                  if (deuxieme_date != null) {
                    String format =
                        DateFormat("yyyy-MM-dd").format(deuxieme_date);
                    _premiere_date.text = format;
                    during_premiere_date = deuxieme_date.millisecondsSinceEpoch;
                  }
                },
                controller: _premiere_date,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Deuxième date svp",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
              child: TextField(
                onTap: () async {
                  var deuxieme_date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));
                  if (deuxieme_date != null) {
                    String format =
                        DateFormat("yyyy-MM-dd").format(deuxieme_date);
                    _deuxieme_date.text = format;
                    during_deuxieme_date = deuxieme_date.millisecondsSinceEpoch;
                  }
                },
                controller: _deuxieme_date,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 70),
              child: SizedBox(
                height: 47,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87),
                    onPressed: () {
                      try {
                        provider.affiche_true();
                        if (_premiere_date.text.isEmpty &&
                            _deuxieme_date.text.isEmpty) {
                          provider.affiche_false();
                          _speak("Vous devez saisir au moins un des champs");
                          final snack = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Vous devez saisir un champ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.8),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(4),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                        } else if (_deuxieme_date.text.isNotEmpty &&
                            _premiere_date.text.isNotEmpty) {
                          nombre_credit = 0;
                          nombre_photocopie = 0;
                          nombre_produit = 0;
                          nombre_tee_shirt = 0;
                          _credits.forEach((element) {
                            if (element.user_uid == user_uid &&
                                element.during >= during_premiere_date &&
                                element.during <= during_deuxieme_date) {
                              nombre_credit++;
                            }
                          });
                          _produits.forEach((element) {
                            if (element.user_uid == user_uid &&
                                element.during_date >= during_premiere_date &&
                                element.during_date <= during_deuxieme_date) {
                              nombre_produit++;
                            }
                          });
                          _tee_shirts.forEach((element) {
                            if (element.during_date >= during_premiere_date &&
                                element.user_uid == user_uid &&
                                element.during_date <= during_deuxieme_date) {
                              nombre_tee_shirt++;
                            }
                          });
                          photocopies.forEach((element) {
                            if (element.user_uid == user_uid &&
                                element.crated_at_in_days >=
                                    during_premiere_date &&
                                element.crated_at_in_days <=
                                    during_deuxieme_date) {
                              nombre_photocopie++;
                            }
                          });

                          if (nombre_photocopie <= 0 &&
                              nombre_credit <= 0 &&
                              nombre_produit <= 0 &&
                              nombre_tee_shirt <= 0) {
                            provider.affiche_false();
                            _speak(
                                "Cet employé n'a éeefectué aucune vente pendant cette période");
                            final snack = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  user_prenom +
                                      " n'a éffectué aucune vente pendant cette période",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              backgroundColor: Colors.redAccent.withOpacity(.8),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(4),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snack);
                          } else {
                            provider.affiche_false();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VenteIntervalleUser(
                                      premiere_date: _premiere_date.text,
                                      deuxieme_date: _deuxieme_date.text,
                                      during_premiere_date:
                                          during_premiere_date,
                                      during_deuxieme_date:
                                          during_deuxieme_date,
                                      user_uid: user_uid,
                                      user_nom: user_nom,
                                      user_prenom: user_prenom),
                                ));
                          }
                        } else if (_deuxieme_date.text.isNotEmpty) {
                          nombre_credit = 0;
                          nombre_photocopie = 0;
                          nombre_produit = 0;
                          nombre_tee_shirt = 0;
                          _credits.forEach((element) {
                            if (element.user_uid == user_uid &&
                                element.date_vente == _deuxieme_date.text) {
                              nombre_credit++;
                            }
                          });
                          _produits.forEach((element) {
                            if (element.user_uid == user_uid &&
                                element.date_vente == _deuxieme_date.text) {
                              nombre_produit++;
                            }
                          });
                          _tee_shirts.forEach((element) {
                            if (element.date_vente == _deuxieme_date.text &&
                                element.user_uid == user_uid) {
                              nombre_tee_shirt++;
                            }
                          });
                          photocopies.forEach((element) {
                            if (element.user_uid == user_uid &&
                                element.created_at == _deuxieme_date.text) {
                              nombre_photocopie++;
                            }
                          });

                          if (nombre_photocopie <= 0 &&
                              nombre_credit <= 0 &&
                              nombre_produit <= 0 &&
                              nombre_tee_shirt <= 0) {
                            provider.affiche_false();
                            _speak(
                                "Cet employé n'a éeefectué aucune vente pendant cette date");
                            final snack = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  user_prenom +
                                      " n'a éffectué aucune vente pendant cette date",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              backgroundColor: Colors.redAccent.withOpacity(.8),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(4),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snack);
                          } else {
                            provider.affiche_false();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VenteDeuxiemeDateUser(
                                      deuxieme_date: _deuxieme_date.text,
                                      user_uid: user_uid,
                                      user_prenom: user_prenom,
                                      user_nom: user_nom),
                                ));
                          }
                        } else {
                          nombre_credit = 0;
                          nombre_photocopie = 0;
                          nombre_produit = 0;
                          nombre_tee_shirt = 0;
                          _credits.forEach((element) {
                            if (element.user_uid == user_uid &&
                                element.date_vente == _premiere_date.text) {
                              nombre_credit++;
                            }
                          });
                          _produits.forEach((element) {
                            if (element.user_uid == user_uid &&
                                element.date_vente == _premiere_date.text) {
                              nombre_produit++;
                            }
                          });
                          _tee_shirts.forEach((element) {
                            if (element.date_vente == _premiere_date.text &&
                                element.user_uid == user_uid) {
                              nombre_tee_shirt++;
                            }
                          });
                          photocopies.forEach((element) {
                            if (element.user_uid == user_uid &&
                                element.created_at == _premiere_date.text) {
                              nombre_photocopie++;
                            }
                          });

                          if (nombre_photocopie <= 0 &&
                              nombre_credit <= 0 &&
                              nombre_produit <= 0 &&
                              nombre_tee_shirt <= 0) {
                            provider.affiche_false();
                            _speak(
                                "Cet employé n'a éeefectué aucune vente pendant cette date");
                            final snack = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  user_prenom +
                                      " n'a éffectué aucune vente pendant cette date",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              backgroundColor: Colors.redAccent.withOpacity(.8),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(4),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snack);
                          } else {
                            provider.affiche_false();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VenteDeuxiemeDateUser(
                                      deuxieme_date: _premiere_date.text,
                                      user_uid: user_uid,
                                      user_prenom: user_prenom,
                                      user_nom: user_nom),
                                ));
                          }
                        }
                      } catch (e) {
                        provider.affiche_false();
                        _speak("Une erreur est survenue pendant la recherche");
                        final snack = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Une erreur est survenue pendant la recherche!!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          backgroundColor: Colors.redAccent.withOpacity(.8),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(4),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snack);
                      }
                    },
                    child: affiche
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Recherchez".toUpperCase(),
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

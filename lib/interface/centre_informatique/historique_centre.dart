// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_field, non_constant_identifier_names, prefer_final_fields, unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_function_literals_in_foreach_calls, use_function_type_syntax_for_parameters, prefer_interpolation_to_compose_strings

import 'package:deogracias/interface/centre_informatique/historique_mensuelle_centre.dart';
import 'package:deogracias/interface/centre_informatique/historique_vente_annuelle_centre.dart';
import 'package:deogracias/interface/centre_informatique/historique_vente_deuxieme_date.dart';
import 'package:deogracias/interface/centre_informatique/historique_vente_intervalle_centre.dart';
import 'package:deogracias/interface/centre_informatique/historique_vente_premiere_date.dart';
import 'package:deogracias/modele/vente_photocopie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import '../../modele/centre_vente.dart';
import '../../modele/vente_credit.dart';
import '../../modele/vente_tee_shirts.dart';
import '../../provider/provider_change_date.dart';
import 'drawer_admin_centre.dart';

class HistoriqueCentre extends StatelessWidget {
  HistoriqueCentre({key}) : super(key: key);

  TextEditingController _premiere_date = TextEditingController();
  TextEditingController _deuxieme_date = TextEditingController();
  TextEditingController _mois = TextEditingController();
  TextEditingController _anne = TextEditingController();
  int during_premiere_date = 0;
  int during_deuxieme_date = 0;
  int nombre_vente_tee_shirt = 0;
  int nombre_vente_produits = 0;
  int nombre_vente_credits = 0;
  int nombre_vente_photocopies = 0;

  @override
  Widget build(BuildContext context) {
    bool affiche = false;
    final _provider = Provider.of<changeDateProvider>(context);
    final _ventes_tee_shirts = Provider.of<List<venteteeshirts>>(context);
    final _ventes_credits = Provider.of<List<venteCredit>>(context);
    final _ventes_products = Provider.of<List<centreVente>>(context);
    final _ventes_photocopies = Provider.of<List<VentePhotocopies>>(context);
    affiche = _provider.affiche;
    if (_ventes_credits.isEmpty &&
        _ventes_products.isEmpty &&
        _ventes_tee_shirts.isEmpty) {
      return Scaffold(
        drawer: DrawerAdminCentre(),
        backgroundColor: Colors.green.shade800,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0.2,
          title: Text(
            "Aucone vente",
            style: GoogleFonts.alike(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerAdminCentre(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Image.asset(
            "images/icon.jpeg",
            height: 60,
            width: 60,
            scale: 2.5,
          ),
        ],
        elevation: 0,
        title: Text(
          "Historique des ventes",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                      image: AssetImage("images/image3.jfif"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Historique de vente ",
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
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Première date",
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
                  var premiere_date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));
                  String formated = premiere_date != null
                      ? DateFormat("yyyy-MM-dd").format(premiere_date)
                      : "";
                  during_premiere_date = premiere_date != null
                      ? premiere_date.millisecondsSinceEpoch
                      : 0;

                  _premiere_date.text = formated.isNotEmpty ? formated : "";
                },
                controller: _premiere_date,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Deuxième date",
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
                  String format = deuxieme_date != null
                      ? DateFormat("yyyy-MM-dd").format(deuxieme_date)
                      : "";
                  during_deuxieme_date = deuxieme_date != null
                      ? deuxieme_date.millisecondsSinceEpoch
                      : 0;
                  _deuxieme_date.text = format.isNotEmpty ? format : "";
                },
                controller: _deuxieme_date,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mois-Année(Ex: 2023-01)",
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
                controller: _mois,
                maxLength: 7,
                decoration: InputDecoration(
                    counterText: "",
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Année",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15, bottom: 25),
              child: TextField(
                maxLength: 4,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: _anne,
                decoration: InputDecoration(
                    counterText: "",
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 40),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87),
                    onPressed: (() {
                      try {
                        _provider.affiche_true();

                        if (_premiere_date.text.isEmpty &&
                            _deuxieme_date.text.isEmpty &&
                            _mois.text.isEmpty &&
                            _anne.text.isEmpty) {
                          _provider.affiche_false();
                          _speak(
                              "Vous devez renseigner au moins un  des champs");
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Vous devez renseigner au moins un  des champs",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
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
                        } else if (_mois.text.isNotEmpty) {
                          nombre_vente_tee_shirt = 0;
                          nombre_vente_credits = 0;
                          nombre_vente_photocopies = 0;
                          nombre_vente_produits = 0;

                          _ventes_credits.forEach((element) {
                            if (element.date_vente_month == _mois.text) {
                              nombre_vente_credits++;
                            }
                          });

                          _ventes_photocopies.forEach((element) {
                            if (element.date_vente_month == _mois.text) {
                              nombre_vente_photocopies++;
                            }
                          });

                          _ventes_tee_shirts.forEach((element) {
                            if (element.date_vente_month == _mois.text) {
                              nombre_vente_tee_shirt++;
                            }
                          });

                          _ventes_products.forEach((element) {
                            if (element.vente_month == _mois.text) {
                              nombre_vente_produits++;
                            }
                          });

                          if (nombre_vente_credits <= 0 &&
                              nombre_vente_produits <= 0 &&
                              nombre_vente_tee_shirt <= 0 &&
                              nombre_vente_photocopies <= 0) {
                            _provider.affiche_false();
                            _speak(
                                "Aucune vente n'est éffectué pour le mois saisi");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Aucune vente enregistrée pour le mois saisi",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
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
                            _provider.affiche_false();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HistoriqueVenteMensuelleCentre(
                                          mois: _mois.text),
                                ));
                          }
                        } else if (_anne.text.isNotEmpty) {
                          nombre_vente_tee_shirt = 0;
                          nombre_vente_credits = 0;
                          nombre_vente_photocopies = 0;
                          nombre_vente_produits = 0;

                          _ventes_credits.forEach((element) {
                            if (element.date_vente_annee == _anne.text) {
                              nombre_vente_credits++;
                            }
                          });

                          _ventes_photocopies.forEach((element) {
                            if (element.annee == _anne.text) {
                              nombre_vente_photocopies++;
                            }
                          });

                          _ventes_tee_shirts.forEach((element) {
                            if (element.date_vente_annee == _anne.text) {
                              nombre_vente_tee_shirt++;
                            }
                          });

                          _ventes_products.forEach((element) {
                            if (element.date_vente_annee == _anne.text) {
                              nombre_vente_produits++;
                            }
                          });

                          if (nombre_vente_credits <= 0 &&
                              nombre_vente_produits <= 0 &&
                              nombre_vente_tee_shirt <= 0 &&
                              nombre_vente_photocopies <= 0) {
                            _provider.affiche_false();
                            _speak(
                                "Aucune vente n'est éffectué pour l'année saisi");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Aucune vente enregistrée pour l'année saisi",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
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
                            _provider.affiche_false();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HistoriqueVenteAnnuelleCentre(
                                            annee: _anne.text)));
                          }
                        } else if (_premiere_date.text.isNotEmpty &&
                            _deuxieme_date.text.isEmpty) {
                          nombre_vente_tee_shirt = 0;
                          nombre_vente_credits = 0;
                          nombre_vente_photocopies = 0;
                          nombre_vente_produits = 0;

                          _ventes_credits.forEach((element) {
                            if (element.date_vente == _premiere_date.text) {
                              nombre_vente_credits++;
                            }
                          });

                          _ventes_photocopies.forEach((element) {
                            if (element.created_at == _premiere_date.text) {
                              nombre_vente_photocopies++;
                            }
                          });

                          _ventes_tee_shirts.forEach((element) {
                            if (element.date_vente == _premiere_date.text) {
                              nombre_vente_tee_shirt++;
                            }
                          });

                          _ventes_products.forEach((element) {
                            if (element.date_vente == _premiere_date.text) {
                              nombre_vente_produits++;
                            }
                          });

                          if (nombre_vente_credits <= 0 &&
                              nombre_vente_produits <= 0 &&
                              nombre_vente_tee_shirt <= 0 &&
                              nombre_vente_photocopies <= 0) {
                            _provider.affiche_false();
                            _speak(
                                "Aucune vente n'est éffectué pour la date  saisie");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Aucune vente enregistrée pour la date saisi",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
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
                            _provider.affiche_false();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HistoriqueVentePremiereDateCentre(
                                            premiere_date:
                                                _premiere_date.text)));
                          }
                        } else if (_deuxieme_date.text.isNotEmpty &&
                            _premiere_date.text.isEmpty) {
                          nombre_vente_tee_shirt = 0;
                          nombre_vente_credits = 0;
                          nombre_vente_photocopies = 0;
                          nombre_vente_produits = 0;

                          _ventes_credits.forEach((element) {
                            if (element.date_vente == _deuxieme_date.text) {
                              nombre_vente_credits++;
                            }
                          });

                          _ventes_photocopies.forEach((element) {
                            if (element.created_at == _deuxieme_date.text) {
                              nombre_vente_photocopies++;
                            }
                          });

                          _ventes_tee_shirts.forEach((element) {
                            if (element.date_vente == _deuxieme_date.text) {
                              nombre_vente_tee_shirt++;
                            }
                          });

                          _ventes_products.forEach((element) {
                            if (element.date_vente == _deuxieme_date.text) {
                              nombre_vente_produits++;
                            }
                          });

                          if (nombre_vente_credits <= 0 &&
                              nombre_vente_produits <= 0 &&
                              nombre_vente_tee_shirt <= 0 &&
                              nombre_vente_photocopies <= 0) {
                            _provider.affiche_false();
                            _speak(
                                "Aucune vente n'est éffectué pour la date saisie");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Aucune vente enregistrée pour la date saisize",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
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
                            _provider.affiche_false();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HistoriqueVenteDeuxiemeDateCentre(
                                            deuxieme_date:
                                                _deuxieme_date.text)));
                          }
                        } else {
                          nombre_vente_tee_shirt = 0;
                          nombre_vente_credits = 0;
                          nombre_vente_photocopies = 0;
                          nombre_vente_produits = 0;

                          _ventes_credits.forEach((element) {
                            if (element.during >= during_premiere_date &&
                                element.during <= during_deuxieme_date) {
                              nombre_vente_credits++;
                            }
                          });

                          _ventes_photocopies.forEach((element) {
                            if (element.crated_at_in_days >=
                                    during_premiere_date &&
                                element.crated_at_in_days <=
                                    during_deuxieme_date) {
                              nombre_vente_photocopies++;
                            }
                          });

                          _ventes_tee_shirts.forEach((element) {
                            if (element.during_date >= during_premiere_date &&
                                element.during_date <= during_deuxieme_date) {
                              nombre_vente_tee_shirt++;
                            }
                          });

                          _ventes_products.forEach((element) {
                            if (element.during_date >= during_premiere_date &&
                                element.during_date <= during_deuxieme_date) {
                              nombre_vente_produits++;
                            }
                          });

                          if (nombre_vente_credits <= 0 &&
                              nombre_vente_produits <= 0 &&
                              nombre_vente_tee_shirt <= 0 &&
                              nombre_vente_photocopies <= 0) {
                            _provider.affiche_false();
                            _speak(
                                "Aucune vente n'est éffectué pour la date saisie");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Aucune vente enregistrée pour la date saisie",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
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
                            _provider.affiche_false();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HistoriqueVenteIntervalleCentre(
                                            premiere_date: _premiere_date.text,
                                            deuxieme_date: _deuxieme_date.text,
                                            during_premiere_date:
                                                during_premiere_date,
                                            during_deuxieme_date:
                                                during_deuxieme_date)));
                          }
                        }
                      } catch (e) {
                        _provider.affiche_false();
                        _speak("Une erreur s'est produite");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Une erreur s'est produite",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
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
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: affiche
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Recherchez ...",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                    )),
              ),
            ),
            SizedBox(
              height: 80,
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

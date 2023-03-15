// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_local_variable, no_leading_underscores_for_local_identifiers, unred_type_equality_checks, prefer_final_fields, use_build_context_synchronously, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../base_donne/servicebasededonnees.dart';
import '../provider/pr_ovider_gestion_gerant.dart';
import '../services/user.dart';
import 'drawer_gerant.dart';

class EnregistrerProblemeGerant extends StatelessWidget {
  EnregistrerProblemeGerant({key}) : super(key: key);

  TextEditingController _description = TextEditingController();
  String message = "";
  bool affiche = false;
  @override
  Widget build(BuildContext context) {
    final _service = Provider.of<serviceBD>(context);
    final _donnesUser = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<ProviderGestionGerant>(context);
    affiche = _provider.enregister_probleme;
    return Scaffold(
      drawer: DrawerGerant(),
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
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Probème rencontré",
          style: GoogleFonts.alike(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    image: DecorationImage(
                        image: AssetImage(
                          "images/informatique2.jpg",
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Probème rencontré ",
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
                    "Description du problème svp",
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
                    const EdgeInsets.only(left: 25.0, right: 15, bottom: 20),
                child: TextField(
                    onTap: () {
                      _speak(
                          "Décrivez s'il vous plait brièvement le problème que vous avez rencontré");
                    },
                    autocorrect: true,
                    enableSuggestions: true,
                    minLines: 4,
                    maxLines: 10,
                    cursorColor: Colors.black,
                    cursorHeight: .2,
                    cursorWidth: 0.2,
                    controller: _description,
                    decoration: InputDecoration(
                        hintStyle: GoogleFonts.lato(color: Colors.black),
                        fillColor: Colors.white,
                        filled: true)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 21.0, right: 21, top: 10, bottom: 70),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        _provider.put_enregister_probleme_true();
                        try {
                          if (_description.text.isEmpty) {
                            _speak(
                                "Vous devriez  décrire le problème rencontré ");
                            _provider.put_enregister_probleme_false();
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Vous dévriez décrire svp le problème que vous rencontrez !",
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
                            _speak("Veuillez patienter ");
                            await FirebaseFirestore.instance
                                .collection("problemes_centre")
                                .add({
                              'user_uid': _donnesUser.uid,
                              'user_nom': _donnesUser.nom,
                              'user_prenom': _donnesUser.prenom,
                              'description': _description.text,
                              'created_at': DateTime.now(),
                              'numero': _donnesUser.telephone,
                              'numero_watsapp': _donnesUser.email
                            });
                            _description.clear();
                            _speak(
                                "Votre problème a été enregistré avec succès ");
                            _provider.put_enregister_probleme_false();
                            message = _donnesUser.prenom
                                    .toString()
                                    .toUpperCase() +
                                " , votre problème a té enregistré avec succès"
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
                          _provider.put_enregister_probleme_false();
                          _speak("Une erreur inattendue s'est produite ");
                          message =
                              "Une erreur intattendue s'est produite pendant l'enregistrement du problème ! Réessayez svp !"
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
                            backgroundColor: Colors.redAccent.withOpacity(.8),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          textStyle: TextStyle(fontWeight: FontWeight.bold)),
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
                                "Signalez le problème".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      )),
                ),
              ),
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

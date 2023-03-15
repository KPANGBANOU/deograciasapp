// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, camel_case_types, unused_local_variable, must_be_immutable, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:deogracias/interface/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../provider/provider_drawer_home_admin.dart';
import '../services/user.dart';
import 'connexion.dart';

class DrawerHome extends StatelessWidget {
  DrawerHome({key}) : super(key: key);

  bool bar_selected = false;
  bool centre_selected = false;
  bool comptabilite_selected = false;
  bool attribution_droits_selected = false;
  bool list_employe_selected = false;
  bool parametre_selected = false;

  @override
  Widget build(BuildContext context) {
    final _donnesUsers = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<providerAdminDrawerHome>(context);
    bar_selected = _provider.bar_selected;
    centre_selected = _provider.centre_selected;
    comptabilite_selected = _provider.comptabilite_selected;
    attribution_droits_selected = _provider.attribution_droiits_selected;
    list_employe_selected = _provider.list_employes_selected;
    parametre_selected = _provider.parametre_selected;

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 96),
        child: Drawer(
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 200,
                child: DrawerHeader(
                    child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    _donnesUsers.photo_url.isEmpty
                        ? Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ClipOval(
                              child: Image.asset(
                                'images/icon.jpeg',
                                width: 90,
                                height: 90,
                                scale: 2.5,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        : Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: NetworkImage(_donnesUsers.photo_url),
                                    fit: BoxFit.cover,
                                    scale: 2.5)),
                          ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          _donnesUsers.prenom.toString() +
                              " " +
                              _donnesUsers.nom.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                )),
              ),
              ListTile(
                textColor: centre_selected ? Colors.white : Colors.black,
                tileColor: centre_selected ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Home",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_centre_selection_true();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
              ),
              ListTile(
                textColor: list_employe_selected ? Colors.white : null,
                tileColor:
                    list_employe_selected ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Liste des employés de l'entreprise",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_employe_selection_true();
                  Navigator.pushNamed(context, "/listeEmployes");
                },
              ),
              ListTile(
                title: Text(
                  "Déconnexion".toUpperCase(),
                  style: GoogleFonts.alike(color: Colors.red),
                ),
                onTap: () async {
                  _speak(
                      "Veuillez cliquer sur confirmer pour vous déconnecter");
                  _showMyDialog(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Etes vous sur ?".toUpperCase()),
          content: SingleChildScrollView(
            child: ListBody(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Text("Voudriez vous déconnecter?"),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          textStyle: TextStyle()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Confirmer'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance.signOut();
                          _speak("Vous avez été déconnecté ");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginPage())));

                          // ignore: empty_catches
                        } catch (e) {
                          _speak("Une erreur inattendue s'est produite");
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent.withOpacity(.7),
                          textStyle: TextStyle()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Annuler'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        _speak("Déconnexion annulée");
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        );
      },
    );
  }

  Future _speak(String text) async {
    final FlutterTts _flutter_tts = FlutterTts();
    _flutter_tts.setLanguage("Fr");
    _flutter_tts.setSpeechRate(0.5);
    _flutter_tts.setVolume(0.5);
    _flutter_tts.setPitch(1.0);
    _flutter_tts.speak(text);
  }
}

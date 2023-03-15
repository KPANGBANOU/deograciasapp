// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, camel_case_types, unused_local_variable, must_be_immutable, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, non_constant_identifier_names, prefer_final_fields, unused_field

import 'package:deogracias/interface/Bar_restaurant/accueil_servant_bar.dart';
import 'package:deogracias/interface/Bar_restaurant/bar_list_credit_servant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../provider/provider_servant_bar.dart';
import '../../services/user.dart';
import 'bar_vente_list_credits.dart';
import 'signaler_list_materiel_bar_servant.dart';

class servantdrawer extends StatelessWidget {
  servantdrawer({key}) : super(key: key);

  bool _vente_petit_modele = true;
  bool _vente_grand_modele = false;
  bool _vente_credit = false;
  bool _statistique_journalier = false;
  bool _enregister_dpense = false;
  bool _enregister_credit = false;
  bool _signaler_probleme = false;
  bool _vente_list_credits = false;
  bool _problemes_enregistres = false;
  bool _depenses_enregistres = false;
  bool _parametres = false;
  bool enregistrer_perte = false;
  bool signaler_materiel = false;

  @override
  Widget build(BuildContext context) {
    final _donnesUtilisateur = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<providerServantBar>(context);
    _vente_petit_modele = _provider.vente_petit_modele;
    _vente_grand_modele = _provider.vente_grand_modele;
    _vente_credit = _provider.vente_credit;
    _enregister_dpense = _provider.enregistrer_depense;
    _enregister_credit = _provider.enregistrer_credit_client;
    _signaler_probleme = _provider.signaler_probleme;
    _statistique_journalier = _provider.statistique_journalier;
    _parametres = _provider.parametres;
    _depenses_enregistres = _provider.depenses_enregistres;
    _problemes_enregistres = _provider.problemes_enregistres;
    _vente_list_credits = _provider.vente_list_credits;
    enregistrer_perte = _provider.enregistrer_perte;
    signaler_materiel = _provider.signaler_materiel;

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
                    _donnesUtilisateur.photo_url.isEmpty
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
                                    image: NetworkImage(
                                        _donnesUtilisateur.photo_url),
                                    fit: BoxFit.cover,
                                    scale: 2.5)),
                          ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            _donnesUtilisateur.prenom.toString() +
                                ' ' +
                                _donnesUtilisateur.nom.toString(),
                            style: GoogleFonts.alike(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ],
                )),
              ),
              ListTile(
                tileColor:
                    _vente_petit_modele ? Colors.lightBlue.shade900 : null,
                textColor: _vente_petit_modele ? Colors.white : null,
                title: Text(
                  "Home",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_vente_petit_modele_true();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccueilServantBar(),
                      ));
                },
              ),
              ListTile(
                tileColor:
                    _statistique_journalier ? Colors.lightBlue.shade900 : null,
                textColor: _statistique_journalier ? Colors.white : null,
                title: Text(
                  "Vente de petits modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_statistique_journalier_true();
                  Navigator.pushNamed(context, "/listedespetitsmodeles");
                },
              ),
              ListTile(
                tileColor:
                    _vente_grand_modele ? Colors.lightBlue.shade800 : null,
                textColor: _vente_grand_modele ? Colors.white : null,
                title: Text(
                  "vente de grands modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_vente_grand_modele_true();
                  Navigator.pushNamed(context, "/listedesgrandsmodeles");
                },
              ),
              ListTile(
                tileColor: _vente_credit ? Colors.lightBlue.shade900 : null,
                textColor: _vente_credit ? Colors.white : null,
                title: Text(
                  "vente de crédit",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_vente_credit_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => BarVenteListCredits())));
                },
              ),
              ListTile(
                tileColor: signaler_materiel ? Colors.lightBlue.shade900 : null,
                textColor: signaler_materiel ? Colors.white : null,
                title: Text(
                  "Signaler un matériel cassé ",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_signaler_materiel();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              BarSignalerListMaterielServant())));
                },
              ),
              ListTile(
                tileColor:
                    _vente_list_credits ? Colors.lightBlue.shade900 : null,
                textColor: _vente_list_credits ? Colors.white : null,
                title: Text(
                  "Liste des ventes à crédits éffectuées",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_vente_list_credits_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              BarListCreditsClientsServant())));
                },
              ),
              ListTile(
                title: Text(
                  "Déconnexion".toUpperCase(),
                  style: GoogleFonts.alike(
                      fontWeight: FontWeight.bold, color: Colors.redAccent),
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
              Text("Voudriez vous déconnecter ?"),
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
                        backgroundColor: Colors.indigo, textStyle: TextStyle()),
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
                        Navigator.of(context).pushNamed("/login");
                        _speak("Vous etes déconnecté !");
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

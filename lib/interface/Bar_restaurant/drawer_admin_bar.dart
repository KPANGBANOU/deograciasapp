// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, camel_case_types, unused_local_variable, must_be_immutable, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../provider/provider_drawer_admin_bar.dart';
import '../../services/user.dart';
import '../connexion.dart';
import '../home.dart';
import 'approvisionnement_list_petit_modele.dart';
import 'approvisonnement_list_grand_modele.dart';
import 'enegistrer_perte_admin._bar.dart';
import 'enregistrer_depense_bar_admin.dart';
import 'historique_bar.dart';
import 'historique_stock_cumule_bar.dart';
import 'list_depense_employe_bar.dart';
import 'list_grand_modele.dart';
import 'list_materiel_bar.dart';
import 'list_pertes_bar.dart';
import 'list_petit_modele.dart';
import 'list_problemes_employes_bar.dart';
import 'list_vente_credits_employe_bar.dart';
import 'statistique_list_employe_bar.dart';
import 'stockphysiquedesgrandtmodel.dart';
import 'stockphysiquepetitmodel.dart';

class DrawerAdminBar extends StatelessWidget {
  DrawerAdminBar({key}) : super(key: key);

  bool centre = true;
  bool benefice = false;
  bool rubrique = false;
  bool statistique_generale = false;
  bool statistique_journalier = false;
  bool problemes = false;
  bool depenses = false;
  bool list_vente = false;
  bool liquidite_grand_modele = false;
  bool liquidite_petit_modele = false;
  bool approvisionnement_grand_modele = false;
  bool approvisionnement_petit_modele = false;
  bool list_grand_modele = false;
  bool list_petit_modele = false;
  bool nouvelle_bierre = false;
  bool home = false;
  bool enregistrer_materiel = false;
  bool list_materiel = false;
  bool list_pertes = false;
  bool enregistrer_depense = false;
  bool historique = false;
  bool initialise = false;
  bool stock_cumule = false;
  bool enregistre_perte = false;
  @override
  Widget build(BuildContext context) {
    final _donnesUtilisateur = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<providerDrawerAdminBar>(context);
    home = _provider.home_selected;
    centre = _provider.centre_selected;
    enregistrer_depense = _provider.enregistrer_depense;
    benefice = _provider.benefice_selected;
    historique = _provider.historique;
    rubrique = _provider.rubrique_selected;
    statistique_generale = _provider.statistique_generale_selected;
    statistique_journalier = _provider.statistique_journalier_selected;
    problemes = _provider.problemes_selected;
    depenses = _provider.depenses_selected;
    list_vente = _provider.ventes_credits_selected;
    liquidite_grand_modele = _provider.liquidite_grand_modele_selected;
    liquidite_petit_modele = _provider.liquidite_petit_modele_selected;
    approvisionnement_grand_modele =
        _provider.approvisionnement_grand_modele_selected;
    approvisionnement_petit_modele =
        _provider.approvisionnement_petit_modele_selected;
    list_grand_modele = _provider.list_grand_modele_selected;
    list_petit_modele = _provider.list_petit_modele_selected;
    nouvelle_bierre = _provider.nouvelle_bierre_selected;
    enregistrer_materiel = _provider.enregistrer_materiel;
    list_materiel = _provider.list_materiel;
    list_pertes = _provider.list_pertes;
    initialise = _provider.initialise;
    stock_cumule = _provider.stock_cumule;
    enregistre_perte = _provider.enregistrer_perte;
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
                        ? Image.asset(
                            'images/icon.jpeg',
                            width: 90,
                            height: 90,
                            scale: 2.5,
                            fit: BoxFit.contain,
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
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ],
                )),
              ),
              ListTile(
                textColor: centre ? Colors.white : Colors.black,
                tileColor: centre ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "HOME",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_centre_selected_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
              ),
              ListTile(
                tileColor: historique ? Colors.lightBlue.shade900 : null,
                textColor: historique ? Colors.white : null,
                title: Text(
                  "Historique des ventes du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_historique();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => HistoriqueBar())));
                },
              ),
              ListTile(
                textColor: stock_cumule ? Colors.white : null,
                tileColor: stock_cumule ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Historique des stock cumulés du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_stock_cumule();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => HistoriqueStockCumulesBar())));
                },
              ),
              ListTile(
                textColor: statistique_journalier ? Colors.white : null,
                tileColor:
                    statistique_journalier ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Statistique journalier de vente du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_statistique_journalier_selected_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => StatistiqueListEmployeBar())));
                },
              ),
              ListTile(
                textColor: approvisionnement_petit_modele ? Colors.white : null,
                tileColor: approvisionnement_petit_modele
                    ? Colors.lightBlue.shade900
                    : null,
                title: Text(
                  "Approvisionnement de pétit modèle",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_approvisionnement_petit_modele_selected_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              ApprovisionnerListPetitModele())));
                },
              ),
              ListTile(
                textColor: approvisionnement_grand_modele ? Colors.white : null,
                tileColor: approvisionnement_grand_modele
                    ? Colors.lightBlue.shade900
                    : null,
                title: Text(
                  "Approvisionnement de grand modèle",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_approvisionnement_grand_modele_selected_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              ApprovisionnerListGrandModele())));
                },
              ),
              ListTile(
                textColor: enregistre_perte ? Colors.white : null,
                tileColor: enregistre_perte ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Enregistrer une perte du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_enregstre_perte();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => EnregistrerPerteAdminBar())));
                },
              ),
              ListTile(
                textColor: enregistrer_depense ? Colors.white : null,
                tileColor:
                    enregistrer_depense ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Enregistrer une dépense du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_enregistrer_depense();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              EnregistrerDepenseBarAdmin())));
                },
              ),
              ListTile(
                textColor: liquidite_grand_modele ? Colors.white : null,
                tileColor:
                    liquidite_grand_modele ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Liquidité de grand modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_liquidite_grand_modele_selected_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => LiquiditeListGrandModele())));
                },
              ),
              ListTile(
                textColor: liquidite_petit_modele ? Colors.white : null,
                tileColor:
                    liquidite_petit_modele ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Liquidité de pétit modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_liquidite_petit_modele_selected_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => LiquiditeListPetitModele())));
                },
              ),
              ListTile(
                textColor: list_grand_modele ? Colors.white : null,
                tileColor: list_grand_modele ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Liste des grands modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_grand_modele_selected_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ListGrandModele())));
                },
              ),
              ListTile(
                textColor: list_petit_modele ? Colors.white : null,
                tileColor: list_petit_modele ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Liste des pétits modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_petit_modele_selected_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ListPetitModele())));
                },
              ),
              ListTile(
                textColor: list_pertes ? Colors.white : null,
                tileColor: list_pertes ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Pertes du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_pertes();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ListPertesBar())));
                },
              ),
              ListTile(
                textColor: list_materiel ? Colors.white : null,
                tileColor: list_materiel ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Matériaux du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_materiel();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ListMaterielBar())));
                },
              ),
              ListTile(
                textColor: problemes ? Colors.white : null,
                tileColor: problemes ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Problèmes des employés du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_probleme_selected_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ListProblemeEmployesBar())));
                },
              ),
              ListTile(
                textColor: depenses ? Colors.white : null,
                tileColor: depenses ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Dépenses du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_depenses_selected_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ListDepenseEmployeBar())));
                },
              ),
              ListTile(
                textColor: list_vente ? Colors.white : null,
                tileColor: list_vente ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Ventes à crédits du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_vente_credits_selected_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              ListVenteCreditsEmployeBar())));
                },
              ),
              ListTile(
                title: Text(
                  "Deconnexion".toUpperCase(),
                  style: GoogleFonts.alike(color: Colors.redAccent),
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
              Text("Voudiez vous déconnecter ?"),
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LoginPage())));
                        _speak("Vous etes déconnecté");
                        // ignore: empty_catches
                      } catch (e) {
                        _speak("une erreur inattendue s'est produite");
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

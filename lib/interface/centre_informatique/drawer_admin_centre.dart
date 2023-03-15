// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, camel_case_types, unused_local_variable, must_be_immutable, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:deogracias/interface/centre_informatique/centre_approvisionnement_list_produits_photocopies.dart';
import 'package:deogracias/interface/centre_informatique/centre_produits_photocopies.dart';
import 'package:deogracias/interface/centre_informatique/centre_stock_physique_list_produit_photocopie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../../provider/provider_drawer_admin_centre.dart';
import '../../services/user.dart';
import '../Bar_restaurant/approvisionnerlisteeshirt.dart';
import '../connexion.dart';
import '../home.dart';
import '../list_pertes_centre.dart';
import 'centre_approvisionner_list_produits.dart';
import 'centre_approvisionner_list_reseaux_credit.dart';
import 'centre_liquidite_list_credits.dart';
import 'centre_list_credit.dart';
import 'centre_list_tee_shirt.dart';
import 'centre_produits.dart';
import 'centre_stock_physique.dart';
import 'centreliquidite_serigraphie.dart';
import 'enregistrer_depense_admin_centre.dart';
import 'enregistrer_perte_admin_centre.dart';
import 'historique_centre.dart';
import 'historique_stock_cumule_centre.dart';
import 'list_depense_employe_centre.dart';
import 'list_materiel_centre.dart';
import 'list_probleme_employe_centre.dart';
import 'list_vente_credit_employe_centre.dart';
import 'statistique_journalier_list_employe_centre.dart';

class DrawerAdminCentre extends StatelessWidget {
  DrawerAdminCentre({key}) : super(key: key);
  bool bar = true;
  bool benefice = false;
  bool rubrique = false;
  bool statistique_generale = false;
  bool statistique_journalier = false;
  bool liquidite_credit = false;
  bool liquidite_produit = false;
  bool liquidite_tee_shirt = false;
  bool approvisionnement_credit = false;
  bool approvisionnement_produit = false;
  bool approvisionnement_tee_shirt = false;
  bool list_credits = false;
  bool list_produit = false;
  bool list_tee_shirt = false;
  bool nouveau_credit = false;
  bool nouveau_produit = false;
  bool home = false;
  bool depenses = false;
  bool problemes = false;
  bool vente_credits = false;
  bool enregistrer_materiel = false;
  bool list_materiel = false;
  bool list_pertes = false;
  bool enregistrer_depense = false;
  bool historique = false;
  bool initialise = false;
  bool stock_cumule = false;
  bool enregistrer_perte = false;

  @override
  Widget build(BuildContext context) {
    final _donnesUtilisateur = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<providerDrawerAdminCenter>(context);
    bar = _provider.bar_selected;
    benefice = _provider.benefice;
    rubrique = _provider.rubrique;
    statistique_generale = _provider.statistique_generale;
    statistique_journalier = _provider.statistique_journalier;
    liquidite_credit = _provider.liquidite_credit;
    liquidite_produit = _provider.liquidite_produit;
    liquidite_tee_shirt = _provider.liquidite_tee_shirt;
    approvisionnement_credit = _provider.approvisionnement_credit_selected;
    approvisionnement_produit = _provider.approvisionnement_produit;
    approvisionnement_tee_shirt = _provider.approvisionnement_tee_shirt;
    list_credits = _provider.list_credits_selected;
    list_produit = _provider.list_produits_selected;
    list_tee_shirt = _provider.list_tee_shirts_selected;
    nouveau_credit = _provider.nouveau_credit_selected;
    nouveau_produit = _provider.nouveau_produit_selected;
    home = _provider.home_selected;
    depenses = _provider.depenses;
    problemes = _provider.problemes;
    vente_credits = _provider.vente_credits;
    enregistrer_materiel = _provider.enregistrer_materiel;
    list_materiel = _provider.list_materiel;
    list_pertes = _provider.list_pertes;
    enregistrer_depense = _provider.enregistrer_depense;
    historique = _provider.historique;
    initialise = _provider.initialise;
    stock_cumule = _provider.stock_cumule;
    enregistrer_perte = _provider.enregistre_perte;
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
                tileColor: bar ? Colors.lightBlue.shade900 : null,
                textColor: bar ? Colors.white : Colors.black,
                title: Text(
                  "HOME",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_bar_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
              ),
              ListTile(
                tileColor: stock_cumule ? Colors.lightBlue.shade900 : null,
                textColor: stock_cumule ? Colors.white : null,
                title: Text(
                  "Historique des stocks cumulés  du centre informatique",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_stock_cumule();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              HistoriqueStockCumuleCentre())));
                },
              ),
              ListTile(
                tileColor: historique ? Colors.lightBlue.shade900 : null,
                textColor: historique ? Colors.white : null,
                title: Text(
                  "Historique des ventes du centre informatique",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_historique();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => HistoriqueCentre())));
                },
              ),
              ListTile(
                tileColor:
                    statistique_journalier ? Colors.lightBlue.shade900 : null,
                textColor: statistique_journalier ? Colors.white : null,
                title: Text(
                  "Statistique journalier de vente du centre informatique",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_statistique_journalier_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              StatistiqueJournalierListEmployeCentre())));
                },
              ),
              ListTile(
                tileColor:
                    approvisionnement_credit ? Colors.lightBlue.shade900 : null,
                textColor: approvisionnement_credit ? Colors.white : null,
                title: Text(
                  "Approvisionnement de crédits",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_approvisionnement_credit_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreApprovisionnerListReseauxCredit())));
                },
              ),
              ListTile(
                tileColor: nouveau_credit ? Colors.lightBlue.shade900 : null,
                textColor: nouveau_credit ? Colors.white : null,
                title: Text(
                  "Approvisionnement de produits de photocopies",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_nouveau_credit_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreApprovisionnerListProduitsPhotocopies())));
                },
              ),
              ListTile(
                tileColor: approvisionnement_produit
                    ? Colors.lightBlue.shade900
                    : null,
                textColor: approvisionnement_produit ? Colors.white : null,
                title: Text(
                  "Approvisionnement de produits du centre",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_approvisionnement_produit_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreApprovisionnerListProduits())));
                },
              ),
              ListTile(
                tileColor: approvisionnement_tee_shirt
                    ? Colors.lightBlue.shade900
                    : null,
                textColor: approvisionnement_tee_shirt ? Colors.white : null,
                title: Text(
                  "Approvisionnement de tee-shirts",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_approvisionnement_tee_shirt_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreRechargementListTeeShirt())));
                },
              ),
              ListTile(
                tileColor: enregistrer_perte ? Colors.lightBlue.shade900 : null,
                textColor: enregistrer_perte ? Colors.white : null,
                title: Text(
                  "Enregistrer une perte du centre",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_enregistre_perte();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              EnregistrerPerteAdminCentre())));
                },
              ),
              ListTile(
                tileColor:
                    enregistrer_depense ? Colors.lightBlue.shade900 : null,
                textColor: enregistrer_depense ? Colors.white : null,
                title: Text(
                  "Enregistrer une dépense du centre",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_enregistrer_depense();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              EnregistrerDepenseAdminCentre())));
                },
              ),
              ListTile(
                tileColor: liquidite_credit ? Colors.lightBlue.shade900 : null,
                textColor: liquidite_credit ? Colors.white : null,
                title: Text(
                  "Liquidité de crédit",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_liquidite_credit_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreLiquiditeListCredits())));
                },
              ),
              ListTile(
                tileColor:
                    statistique_generale ? Colors.lightBlue.shade900 : null,
                textColor: statistique_generale ? Colors.white : null,
                title: Text(
                  "Liquidité des produits de photocopie",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_statistique_generale_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreStockPhysiqueListProduitsPhotocopies())));
                },
              ),
              ListTile(
                tileColor: liquidite_produit ? Colors.lightBlue.shade900 : null,
                textColor: liquidite_produit ? Colors.white : null,
                title: Text(
                  "Liquidité des produits du centre",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_liquidite_produit_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreStockPhysiqueListProduits())));
                },
              ),
              ListTile(
                tileColor:
                    liquidite_tee_shirt ? Colors.lightBlue.shade900 : null,
                textColor: liquidite_tee_shirt ? Colors.white : null,
                title: Text(
                  "Liquidité de tee shirts",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_liquidite_tee_shirt_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreLiquiditeSerigraphie())));
                },
              ),
              ListTile(
                tileColor: initialise ? Colors.lightBlue.shade900 : null,
                textColor: initialise ? Colors.white : null,
                title: Text(
                  "Liste des produits de photocopies",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_initialise();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreListProduitsPhotocopies())));
                },
              ),
              ListTile(
                tileColor: list_produit ? Colors.lightBlue.shade900 : null,
                textColor: list_produit ? Colors.white : null,
                title: Text(
                  "Liste des produits du centre",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_produit_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CentreListProduits())));
                },
              ),
              ListTile(
                tileColor: list_credits ? Colors.lightBlue.shade900 : null,
                textColor: list_credits ? Colors.white : null,
                title: Text(
                  "Liste des crédits",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_credit_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CentreListCredits())));
                },
              ),
              ListTile(
                tileColor: list_tee_shirt ? Colors.lightBlue.shade900 : null,
                textColor: list_tee_shirt ? Colors.white : null,
                title: Text(
                  "Liste des tee shirts",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_tee_shirt_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CentreListTeeShirt())));
                },
              ),
              ListTile(
                tileColor: list_pertes ? Colors.lightBlue.shade900 : null,
                textColor: list_pertes ? Colors.white : null,
                title: Text(
                  "Liste des pertes du centre informatique",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_pertes();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ListPertesCentre())));
                },
              ),
              ListTile(
                tileColor: list_materiel ? Colors.lightBlue.shade900 : null,
                textColor: list_materiel ? Colors.white : null,
                title: Text(
                  "Liste des materiaux du centre",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_materiel();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ListMaterielCentre())));
                },
              ),
              ListTile(
                tileColor: problemes ? Colors.lightBlue.shade900 : null,
                textColor: problemes ? Colors.white : null,
                title: Text(
                  "Problèmes des employés du centre informatique",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_probleme_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              ListProblemeEmployesCentre())));
                },
              ),
              ListTile(
                tileColor: depenses ? Colors.lightBlue.shade900 : null,
                textColor: depenses ? Colors.white : null,
                title: Text(
                  "Dépenses du centre informatique",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_depense_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ListDepenseEmployeCentre())));
                },
              ),
              ListTile(
                tileColor: vente_credits ? Colors.lightBlue.shade900 : null,
                textColor: vente_credits ? Colors.white : null,
                title: Text(
                  "Ventes à crédits du centre informatique",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_vente_credits_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              ListVenteCreditsEmployeCentre())));
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

Future<void> _showMyDialog(
  BuildContext context,
) async {
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
                        _speak("Vous avez été déconnecté");
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

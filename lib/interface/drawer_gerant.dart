// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, prefer_const_constructors, use_build_context_synchronously

import 'package:deogracias/interface/accuel_gerant.dart';
import 'package:deogracias/interface/centre_informatique/centre_approvisionnement_list_produits_photocopies_gerant.dart';
import 'package:deogracias/interface/centre_informatique/centre_informatique_gerant.dart';
import 'package:deogracias/interface/centre_informatique/centre_produits_photocopie_gerant.dart';
import 'package:deogracias/interface/centre_informatique/centre_stock_physique_list_produits_photocopie_gerant.dart';
import 'package:deogracias/interface/centre_informatique/restaurant_gerant.dart';
import 'package:deogracias/interface/centre_informatique/ventes_des_produits_photocopies_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/gerant_drawer_provider.dart';
import '../services/user.dart';
import 'Bar_restaurant/approvisionnement_list_grand_modele_gerand.dart';
import 'Bar_restaurant/approvisionnement_list_petit_modele_gerant.dart';
import 'Bar_restaurant/list_grands_modele_gerant_gerant.dart';
import 'Bar_restaurant/list_petit_modele_gerant.dart';
import 'Bar_restaurant/stockdesgrandsmodelegerant.dart';
import 'Bar_restaurant/stockphysiquepetitmodelegerant.dart';
import 'Bar_restaurant/vente_des_petits_modele_admin.dart';
import 'Bar_restaurant/ventes_bar_gerant.dart';
import 'Bar_restaurant/ventes_de_grand_modele_admin.dart';
import 'bar_recharger_list_materiel_gerant.dart';
import 'centre_informatique/approvisionnement_list_tee_shirt_gerant.dart';
import 'centre_informatique/centre_approvisionnement_list_produits_gerant.dart';
import 'centre_informatique/centre_approvisionnement_list_reseaux_gerant.dart';
import 'centre_informatique/centre_liquidite_list_credit_gerant.dart';
import 'centre_informatique/centre_list_credits_gerant.dart';
import 'centre_informatique/centre_list_tee_shirt_gerant.dart';
import 'centre_informatique/centre_produits_gerant.dart';
import 'centre_informatique/centre_stock_physique_list_produits_gerant.dart';
import 'centre_informatique/centreliquidite_serigraphie_gerant.dart';
import 'centre_informatique/ventes_centre_gerant.dart';
import 'centre_informatique/ventes_des_credits_admin.dart';
import 'centre_informatique/ventes_des_produits_admin.dart';
import 'centre_informatique/ventes_des_tee_shirts_admin.dart';
import 'centre_rechargement_list_materiel_gerant.dart';
import 'connexion.dart';
import 'list_materiel_bar_gerant.dart';
import 'list_materiel_centre_gerant.dart';
import 'signaler_list_materiel_bar_gerant.dart';
import 'signaler_list_materiel_centre_gerant.dart';

class DrawerGerant extends StatefulWidget {
  const DrawerGerant({key}) : super(key: key);

  @override
  State<DrawerGerant> createState() => _DrawerGerantState();
}

class _DrawerGerantState extends State<DrawerGerant> {
  bool rubrique_centre = false;

  bool rubrique_bar = true;

  bool statistique_bar = false;

  bool statistique_centre = false;

  bool liquidite_credit = false;

  bool liquidite_produit = false;

  bool liquidite_tee_shirt = false;

  bool liquidite_petit_modele = false;

  bool liquidite_grand_modele = false;

  bool approvisionnement_credit = false;

  bool approvisionnement_produit = false;

  bool approvisionnement_tee_shirt = false;

  bool approvisionnement_petit_modele = false;

  bool approvisionnement_grand_modele = false;

  bool list_credits = false;

  bool list_petit_modele = false;

  bool list_grand_modele = false;

  bool list_produit = false;

  bool list_tee_shirt = false;

  bool nouveau_credit = false;

  bool nouveau_produit = false;

  bool nouvelle_bierre = false;

  bool depense_bar = false;

  bool depenses_centre = false;

  bool vente_bar = false;

  bool vente_centre = false;

  bool deconnexion = false;

  bool parametre = false;

  bool enregistrer_probleme = false;

  bool enregistrer_depense = false;

  bool enregister_pertes = false;

  bool pertes = false;

  bool depenses = false;

  bool problemes = false;

  bool pertes_bar = false;

  bool pertes_centre = false;

  bool enregistrer_materiel_centre = false;

  bool enregistrer_materiel_bar = false;

  bool signaler_materiel_bar = false;

  bool signaler_materiel_centre = false;

  bool list_materiel_centre = false;

  bool list_materiel_bar = false;

  bool recharger_materiel_centre = false;

  bool recharger_materiel_bar = false;

  bool vente_credit = false;

  bool vente_produit = false;

  bool vente_tee_shirt = false;

  bool vente_petit_modele = false;

  bool vente_grand_modele = false;

  bool ventes_bar = false;

  bool ventes_centre = false;

  bool enregistrer_vente_a_credit = false;

  @override
  Widget build(BuildContext context) {
    final _donnesUtilisateur = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<GerantDrawerProvider>(context);
    parametre = _provider.parametre;
    statistique_bar = _provider.statistique_bar;
    statistique_centre = _provider.statistique_centre;
    liquidite_credit = _provider.liquidite_credit;
    liquidite_produit = _provider.liquidite_produit;
    liquidite_tee_shirt = _provider.liquidite_tee_shirt;
    liquidite_petit_modele = _provider.liquidite_petit_modele;
    liquidite_grand_modele = _provider.liquidite_grand_modele;
    approvisionnement_credit = _provider.approvisionnement_credit;
    approvisionnement_produit = _provider.approvisionnement_produit;
    approvisionnement_tee_shirt = _provider.approvisionnement_tee_shirt;
    approvisionnement_petit_modele = _provider.approvisionnement_petit_modele;
    approvisionnement_grand_modele = _provider.approvisionnement_grand_modele;
    list_credits = _provider.liste_credits;
    list_petit_modele = _provider.list_petit_modele;
    list_grand_modele = _provider.list_grand_modele;
    list_produit = _provider.list_produits;
    list_tee_shirt = _provider.list_tee_shirt;
    nouveau_credit = _provider.nouveau_credit;
    nouveau_produit = _provider.nouveau_produit;
    nouvelle_bierre = _provider.nouveau_bierre;
    depense_bar = _provider.depense_bar;
    depenses_centre = _provider.depense_centre;
    vente_bar = _provider.vente_bar;
    vente_centre = _provider.vente_centre;
    deconnexion = _provider.deconnexion;
    rubrique_bar = _provider.rubrique_bar;
    rubrique_centre = _provider.rubrique_centre;
    enregister_pertes = _provider.enregistrer_perte;
    enregistrer_depense = _provider.enregistrer_depense;
    enregistrer_probleme = _provider.enregistrer_probleme;
    problemes = _provider.problemes;
    depenses = _provider.depenses;
    pertes = _provider.pertes;
    pertes_bar = _provider.pertes_bar;
    pertes_centre = _provider.pertes_centre;
    enregistrer_materiel_centre = _provider.enregistrer_materiel_centre;
    enregistrer_materiel_bar = _provider.enregistrer_materiel_bar;
    signaler_materiel_bar = _provider.signaler_materiel_bar;
    signaler_materiel_centre = _provider.signaler_materiel_centre;
    recharger_materiel_bar = _provider.recharger_materiel_bar;
    recharger_materiel_centre = _provider.recharger_materiel_centre;
    list_materiel_centre = _provider.list_materiel_centre;
    list_materiel_bar = _provider.list_materiel_bar;
    vente_credit = _provider.vente_credit;
    vente_produit = _provider.vente_produit;
    vente_tee_shirt = _provider.vente_tee_shirt;
    vente_petit_modele = _provider.vente_petit_modele;
    vente_grand_modele = _provider.vente_grand_modele;
    ventes_bar = _provider.ventes_bar;
    ventes_centre = _provider.ventes_centre;
    enregistrer_vente_a_credit = _provider.enregistrer_vente_a_credit;
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
                                _donnesUtilisateur.nom.toUpperCase().toString(),
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
                tileColor: rubrique_bar ? Colors.lightBlue.shade900 : null,
                textColor: rubrique_bar ? Colors.white : null,
                title: Text(
                  "Home",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_rubrique_bar_true();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => AccueilGerant())));
                },
              ),
              ListTile(
                tileColor: rubrique_centre ? Colors.lightBlue.shade900 : null,
                textColor: rubrique_centre ? Colors.white : null,
                title: Text(
                  "Centre informatique",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_rubrique_centre_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CentreInformatiqueGerant())));
                },
              ),
              ListTile(
                tileColor: enregister_pertes ? Colors.lightBlue.shade900 : null,
                textColor: enregister_pertes ? Colors.white : null,
                title: Text(
                  "Restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_enregistrer_pertes();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => RestaurantGerant())));
                },
              ),
              ListTile(
                tileColor: ventes_centre ? Colors.lightBlue.shade900 : null,
                textColor: ventes_centre ? Colors.white : null,
                title: Text(
                  "Recherche sur les ventes du centre",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.Ventes_centre();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => VentesCentreGerant())));
                },
              ),
              ListTile(
                tileColor: ventes_bar ? Colors.lightBlue.shade900 : null,
                textColor: ventes_bar ? Colors.white : null,
                title: Text(
                  "Recherche sur les ventes du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.Ventes_bar();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => VentesBarGerant())));
                },
              ),
              ListTile(
                tileColor: nouvelle_bierre ? Colors.lightBlue.shade900 : null,
                textColor: nouvelle_bierre ? Colors.white : null,
                title: Text(
                  "Ventes de produits de le photocopie",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_nouveau_bierre_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              VentesDesProduitsPhotocopiesAdmin())));
                },
              ),
              ListTile(
                tileColor: vente_produit ? Colors.lightBlue.shade900 : null,
                textColor: vente_produit ? Colors.white : null,
                title: Text(
                  "Ventes de produits du centre",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_vente_produit();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => VentesDesProduitsAdmin())));
                },
              ),
              ListTile(
                tileColor: vente_credit ? Colors.lightBlue.shade900 : null,
                textColor: vente_credit ? Colors.white : null,
                title: Text(
                  "Ventes de crédits",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_vente_credit();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => VentesDesCreditsAdmin())));
                },
              ),
              ListTile(
                tileColor: vente_tee_shirt ? Colors.lightBlue.shade900 : null,
                textColor: vente_tee_shirt ? Colors.white : null,
                title: Text(
                  "Ventes de tee shirts",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_vente_tee_shirt();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => VentesDesTeeShirtsAdmin())));
                },
              ),
              ListTile(
                tileColor:
                    vente_petit_modele ? Colors.lightBlue.shade900 : null,
                textColor: vente_petit_modele ? Colors.white : null,
                title: Text(
                  "Ventes de pétits modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_vente_petit_modele();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              VentesDesPetitsModeleAdmin())));
                },
              ),
              ListTile(
                tileColor:
                    vente_grand_modele ? Colors.lightBlue.shade900 : null,
                textColor: vente_grand_modele ? Colors.white : null,
                title: Text(
                  "Ventes de grands modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_vente_grand_modele();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => VentesDesGrandModeleAdmin())));
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
                              CentreApprovisionnerListReseauxCreditGerant())));
                },
              ),
              ListTile(
                tileColor: nouveau_produit ? Colors.lightBlue.shade900 : null,
                textColor: nouveau_produit ? Colors.white : null,
                title: Text(
                  "Approvisionnement de produits de photocopies",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_nouveau_produit_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreApprovisionnerListProduitsPhotocopiesGerant())));
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
                              CentreApprovisionnerListProduitsGerant())));
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
                              CentreRechargementListTeeShirtGerant())));
                },
              ),
              ListTile(
                tileColor: approvisionnement_petit_modele
                    ? Colors.lightBlue.shade900
                    : null,
                textColor: approvisionnement_petit_modele ? Colors.white : null,
                title: Text(
                  "Approvisionnement de pétits modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_approvisionnement_petit_modele_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              ApprovisionnerListPetitModeleGerant())));
                },
              ),
              ListTile(
                tileColor: approvisionnement_grand_modele
                    ? Colors.lightBlue.shade900
                    : null,
                textColor: approvisionnement_grand_modele ? Colors.white : null,
                title: Text(
                  "Approvisionnement de grands modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_approvisionnement_grand_modele_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              ApprovisionnerListGrandModeleGerant())));
                },
              ),
              ListTile(
                tileColor: liquidite_credit ? Colors.lightBlue.shade900 : null,
                textColor: liquidite_credit ? Colors.white : null,
                title: Text(
                  "Liquidité des crédit",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_liquidite_credit_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreLiquiditeListCreditsGerant())));
                },
              ),
              ListTile(
                tileColor: nouveau_credit ? Colors.lightBlue.shade900 : null,
                textColor: nouveau_credit ? Colors.white : null,
                title: Text(
                  "Liquidité des produits de photocopies",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_nouveau_credit_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreStockPhysiqueListProduitsPhotocopiesGerant())));
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
                              CentreStockPhysiqueListProduitsGerant())));
                },
              ),
              ListTile(
                tileColor:
                    liquidite_tee_shirt ? Colors.lightBlue.shade900 : null,
                textColor: liquidite_tee_shirt ? Colors.white : null,
                title: Text(
                  "Liquidité des tee shirts",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_liquidite_tee_shirt_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreLiquiditeSerigraphieGerant())));
                },
              ),
              ListTile(
                tileColor:
                    liquidite_petit_modele ? Colors.lightBlue.shade900 : null,
                textColor: liquidite_petit_modele ? Colors.white : null,
                title: Text(
                  "Liquidité des pétits modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_liquidite_petit_modele_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              LiquiditeListPetitModeleGerant())));
                },
              ),
              ListTile(
                tileColor:
                    liquidite_grand_modele ? Colors.lightBlue.shade900 : null,
                textColor: liquidite_grand_modele ? Colors.white : null,
                title: Text(
                  "Liquidité des grands modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_liquidite_grand_modele_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              LiquiditeListGrandModeleGerant())));
                },
              ),
              ListTile(
                tileColor: recharger_materiel_centre
                    ? Colors.lightBlue.shade900
                    : null,
                textColor: recharger_materiel_centre ? Colors.white : null,
                title: Text(
                  "Récharger le stock des materiaux du centre informatique",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_recharger_materiel_centre();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreRechargementListMaterielGerant())));
                },
              ),
              ListTile(
                tileColor:
                    recharger_materiel_bar ? Colors.lightBlue.shade900 : null,
                textColor: recharger_materiel_bar ? Colors.white : null,
                title: Text(
                  "Récharger le stock des materiaux du  restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_recharger_materiel_bar();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              BarRechargementListMaterielGerant())));
                },
              ),
              ListTile(
                tileColor:
                    signaler_materiel_centre ? Colors.lightBlue.shade900 : null,
                textColor: signaler_materiel_centre ? Colors.white : null,
                title: Text(
                  "Signaler un materiel cassé du centre informatique",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_signaler_materiel_centre();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreSignalerListMaterieGerant())));
                },
              ),
              ListTile(
                tileColor:
                    signaler_materiel_bar ? Colors.lightBlue.shade900 : null,
                textColor: signaler_materiel_bar ? Colors.white : null,
                title: Text(
                  "Signaler un matériel cassé du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_signaler_materiel_bar();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              BarSignalerListMaterieGerant())));
                },
              ),
              ListTile(
                tileColor: depense_bar ? Colors.lightBlue.shade900 : null,
                textColor: depense_bar ? Colors.white : null,
                title: Text(
                  "Liste des produits de photocopies",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_depense_bar_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              CentreListProduitsPhotocopiesGerant())));
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
                  _provider.put_list_produits_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CentreListProduitsGerant())));
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
                  _provider.put_list_credits_true_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CentreListCreditsGerant())));
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
                          builder: ((context) => CentreListTeeShirtGerant())));
                },
              ),
              ListTile(
                tileColor: list_petit_modele ? Colors.lightBlue.shade900 : null,
                textColor: list_petit_modele ? Colors.white : null,
                title: Text(
                  "Liste des pétits modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_petit_modele_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ListPetitModeleGerant())));
                },
              ),
              ListTile(
                tileColor: list_grand_modele ? Colors.lightBlue.shade900 : null,
                textColor: list_grand_modele ? Colors.white : null,
                title: Text(
                  "Liste des grands modèles",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_grand_modele_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ListGrandModeleGerant())));
                },
              ),
              ListTile(
                tileColor:
                    list_materiel_centre ? Colors.lightBlue.shade900 : null,
                textColor: list_materiel_centre ? Colors.white : null,
                title: Text(
                  "Liste des matériaux du centre informatique",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_materiel_centre();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CentreListMateriauxGerant())));
                },
              ),
              ListTile(
                tileColor: list_materiel_bar ? Colors.lightBlue.shade900 : null,
                textColor: list_materiel_bar ? Colors.white : null,
                title: Text(
                  "Liste des materiaux du restaurant",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _provider.put_list_materiel_bar();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => BarListMateriauxGerant())));
                },
              ),
              ListTile(
                title: Text(
                  "Deconnexion".toUpperCase(),
                  style: GoogleFonts.lato(color: Colors.redAccent),
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

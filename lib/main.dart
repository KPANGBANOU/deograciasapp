// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_const_constructors_in_immutables, must_be_immutable, unused_local_variable, non_constant_identifier_names, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, deprecated_member_use, unused_import
import 'package:deogracias/interface/Bar_restaurant/provider_profil.dart';
import 'package:deogracias/modele/photocopie.dart';
import 'package:deogracias/modele/vente_photocopie.dart';
import 'package:deogracias/provider/provider_affiche.dart';
import 'package:deogracias/provider/provider_ajouter_photocpie.dart';
import 'package:deogracias/provider/provider_new_password.dart';
import 'package:deogracias/provider/provider_nouveau_credit.dart';
import 'package:deogracias/provider/provider_nouveau_produit.dart';
import 'package:deogracias/provider/provider_nouvelle_bierre.dart';
import 'package:deogracias/provider/provider_perte.dart';
import 'package:deogracias/provider/provider_vente_a_credit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: import_of_legacy_library_into_null_safe

import 'base_donne/servicebasededonnees.dart';
import 'interface/Bar_restaurant/accueil_servant_bar.dart';
import 'interface/Bar_restaurant/bar_signaler_probleme.dart';
import 'interface/Bar_restaurant/enregistrer_depense.dart';
import 'interface/Bar_restaurant/enregistrer_nouvel_bierre.dart';
import 'interface/Bar_restaurant/liste_des_grands_modele.dart';
import 'interface/Bar_restaurant/liste_petits_modele.dart';
import 'interface/Bar_restaurant/my_splas.dart';
import 'interface/accueil.dart';
import 'interface/centre_informatique/centre_approvisionner_list_produits.dart';
import 'interface/centre_informatique/centre_enregistrer_depense.dart';
import 'interface/centre_informatique/centre_enregistrer_nouveau_produit.dart';
import 'interface/centre_informatique/centre_enregistrer_nouveau_reseau_credit.dart';
import 'interface/centre_informatique/centre_approvisionnement.dart';
import 'interface/centre_informatique/centre_liquidite_credit.dart';
import 'interface/centre_informatique/centre_liquidite_list_credits.dart';
import 'interface/centre_informatique/centre_produits.dart';
import 'interface/centre_informatique/centre_stock_physique.dart';
import 'interface/centre_informatique/centre_vente_list_credits.dart';
import 'interface/centre_informatique/centre_vente_list_produits.dart';
import 'interface/connexion.dart';
import 'interface/creer_compte.dart';
import 'interface/home.dart';
import 'interface/listes_utilisateurs.dart';
import 'interface/suppression_compte.dart';
import 'interface/wrapper.dart';
import 'modele/bieere_petit_model.dart';
import 'modele/bierre_grand_model.dart';
import 'modele/budgetBar.dart';
import 'modele/budget_centre.dart';
import 'modele/centre_vente.dart';
import 'modele/credit.dart';
import 'modele/credits_servants.dart';
import 'modele/credits_vente.dart';
import 'modele/depense.dart';
import 'modele/depense_centre.dart';
import 'modele/donnesservants.dart';
import 'modele/materiel_bar.dart';
import 'modele/matriel_centre.dart';
import 'modele/pertes_centre.dart';
import 'modele/pertes_restaurant.dart';
import 'modele/probleme.dart';
import 'modele/probleme_centre.dart';
import 'modele/produit.dart';
import 'modele/rapport.dart';
import 'modele/serigraphie.dart';
import 'modele/vente_credit.dart';
import 'modele/vente_grand_modele.dart';
import 'modele/vente_petit_modele.dart';
import 'modele/vente_tee_shirts.dart';
import 'provider/delete_credit.dart';
import 'provider/gerant_drawer_provider.dart';
import 'provider/pr_ovider_gestion_gerant.dart';
import 'provider/privileges.dart';
import 'provider/provider_admin_centre.dart';
import 'provider/provider_change_date.dart';
import 'provider/provider_creer_compte.dart';
import 'provider/provider_drawer_admin_bar.dart';
import 'provider/provider_drawer_admin_centre.dart';
import 'provider/provider_drawer_home_admin.dart';
import 'provider/provider_generer_pdf.dart';
import 'provider/provider_servant_bar.dart';
import 'provider/provider_servant_centre.dart';
import 'provider/serac.dart';
import 'services/change_admin_page.dart';
import 'services/change_page.dart';
import 'services/change_servant_page.dart';
import 'services/provider_recuperation_bierre_id.dart';
import 'services/registration.dart';
import 'services/user.dart';
import 'services/user_centre.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({key}) : super(key: key);
  String uid = "";

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return MultiProvider(
      providers: [
        Provider<firebaseAuth>(
          create: (_) => firebaseAuth(),
        ),
        StreamProvider(
            create: (context) => context.read<firebaseAuth>().utilisateur,
            initialData: null),

        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: ((context) => context.read<serviceBD>().servantBar),
            initialData: <donnesServants>[]),
        StreamProvider(
            create: ((context) => context.read<serviceBD>().donnes_rapport),
            initialData: rapport(
                update_date: "",
                user_nom: "",
                user_prenom: "",
                user_uid: "",
                email_rapport: "",
                numero_rapport: 0,
                uid: "")),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().toutes_les_pertes_du_bar),
            initialData: <pertesbar>[]),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().toutes_les_pertes_du_centre),
            initialData: <pertesCentre>[]),
        StreamProvider(
            create: ((context) => context.read<serviceBD>().currentuserdata),
            /* catchError: ((context, error) {
              print(error.toString());
            })*/
            initialData: donnesUtilisateur(
                deleted: false,
                date_inscription: "",
                mdp: "",
                uid: "",
                nom: "",
                prenom: "",
                email: "",
                telephone: "",
                role: "",
                sexe: "",
                date_naissance: "",
                domaine: "",
                photo_url: "",
                admin: false,
                is_active: true)),
        StreamProvider(
            create: ((context) => context.read<serviceBD>().list_seravants_bar),
            initialData: <donnesServants>[]),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().list_seravants_centre),
            initialData: <userCentre>[]),

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().tous_les_vente_tee_shirts),
            initialData: <venteteeshirts>[]),

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().list_credits_vente_centre),
            initialData: <VenteACreditsCentre>[]),

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().tous_les_ventes_credits),
            initialData: <venteCredit>[]),

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().tous_les_ventes_grand_modeles),
            initialData: <venteGrandModele>[]),

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().tous_les_ventes_petit_modeles),
            initialData: <ventePetitModele>[]),

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().tous_les_ventes_produits),
            initialData: <centreVente>[]),

        StreamProvider(
            create: ((context) => context.read<serviceBD>().budgetBardata),
            initialData: BudgetBar(
                pertes: 0, benefice: 0, solde_total: 0, depense: 0, uid: "")),
        StreamProvider(
            create: (context) => context.read<serviceBD>().budgetcentredata,
            initialData: budgetCentre(
                pertes: 0, benefice: 0, solde_total: 0, depense: 0, uid: "")),
        // list ge grand modeles de bierres
        StreamProvider(
            create: ((context) => context.read<serviceBD>().lisBiarGrandModel),
            initialData: const <donnesBierresGrandModel>[]),
        // list de petit model de bierres

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().listDonnesBierresPetitModele),
            initialData: const <donneesBieerePetitModele>[]),

        StreamProvider(
            create: ((context) => context.read<serviceBD>().list_tee_shirts),
            initialData: <serigraphie>[]),

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().list_materiel_centre),
            initialData: <materielCentre>[]),
        StreamProvider(
            create: ((context) => context.read<serviceBD>().list_materiel_bar),
            initialData: <materielBar>[]),

        // list de vente

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().tous_les_depense_centre),
            initialData: const <DepenseCentre>[]),

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().tous_les_depenses_bar),
            initialData: <donnesDepense>[]),

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().tous_les_problemes_bar),
            initialData: <probleme>[]),

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().tous_les_problemes_centre),
            initialData: <problemeCentre>[]),

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().list_credits_vente_bar),
            initialData: <VenteACreditBars>[]),

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().list_produits_centre),
            initialData: <products>[]),
        // list of user

        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().list_reseaux_credits),
            initialData: <credit>[]),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().list_produits_centre),
            initialData: <products>[]),

        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().listDonnesUtilisateur,
            initialData: const <donnesUtilisateur>[]),

        StreamProvider(
            create: (context) => context.read<serviceBD>().list_des_pjotocopies,
            initialData: <Photocopies>[]),

        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_des_ventes_de_photocopies,
            initialData: <VentePhotocopies>[]),

        ChangeNotifierProvider(create: (context) => changingPage()),
        ChangeNotifierProvider(create: (context) => changingServantPage()),
        ChangeNotifierProvider(create: (context) => changingAdminPage()),
        ChangeNotifierProvider(create: ((context) => changbierreid())),
        ChangeNotifierProvider(create: ((context) => Search())),
        ChangeNotifierProvider(create: ((context) => privileges())),
        ChangeNotifierProvider(
            create: ((context) => providerAdminDrawerHome())),
        ChangeNotifierProvider(create: ((context) => providerDrawerAdminBar())),
        ChangeNotifierProvider(
            create: ((context) => providerDrawerAdminCenter())),
        ChangeNotifierProvider(create: ((context) => providerServantBar())),
        ChangeNotifierProvider(create: ((context) => providerServantCentre())),
        ChangeNotifierProvider(create: ((context) => providerCreerCompte())),
        ChangeNotifierProvider(create: ((context) => GerantDrawerProvider())),
        ChangeNotifierProvider(create: ((context) => changeDateProvider())),
        ChangeNotifierProvider(create: ((context) => ProviderAdminCentre())),
        ChangeNotifierProvider(create: ((context) => ProviderGestionGerant())),
        ChangeNotifierProvider(create: ((context) => DeleteCredit())),
        ChangeNotifierProvider(create: ((context) => GenererPdf())),
        ChangeNotifierProvider(
          create: (context) => ProviderAjoutPhotocopie(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderNouveauProduit(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderNouveauCredit(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderNouvelleBierre(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderAffiche(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderNewPassword(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderVenteACredit(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderPerte(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderProfil(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/wrapper": (context) => Wrapper(),
          "/accueil": (context) => Accueil(),
          "/accueilservant": (context) => AccueilServantBar(),
          "/creercompte": (context) => RegisterPage(),
          "/listeEmployes": (context) => ListeUtilisateurs(),
          "/home": (context) => HomePage(),
          "/login": (context) => LoginPage(),
          "/barsavanewproduct": (context) => EnregistrerNouvelBierreFormPage(),
          "/barenregistrerdepense": (context) => BarEnregistrerDepense(),
          "/barsignalerprobleme": (context) => BarSignalerProbleme(),
          "/listedesgrandsmodeles": (context) => ListeDesGrandModel(),
          "/listedespetitsmodeles": (context) => ListeDesPetitsModel(),
          "/supprimercompte": (context) => SuppressionCompte(),
          "/centreproduits": (context) => CentreListProduits(),
          "/centreventelistproduit": (context) => CentreVenteListProduits(),
          "/centreventelistcredits": (context) => CentreVenteListCredits(),
          "/centreliquiditecredit": (context) => CentreLiquiditeCredit(),
          "/centreliquiditelistcredit": (context) =>
              CentreLiquiditeListCredits(),
          "/centreenregistrerdepense": (context) => CentreEnregistrerDepense(),
          "/centreenregistrernouveauproduit": (context) =>
              CentreEnregistrerNouveauProduit(),
          "/centreenregistrernouveaureseaucredit": (context) =>
              CentreEnregistrerNouveauReseauCredit(),
          "/centrestockphysique": (context) =>
              CentreStockPhysiqueListProduits(),
          "/centreapprovisionnement": (context) => CentreApprovisionnement(),
          "/centreapprovisionnementlistproduits": (context) =>
              CentreApprovisionnerListProduits(),
        },
        home: Splash(),
      ),
    );
  }
}

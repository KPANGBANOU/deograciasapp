// ignore_for_file: camel_case_types, dead_code, prefer_final_fields, prefer_typing_uninitialized_variables, empty_constructor_bodies, non_constant_identifier_names, unused_local_variable, unused_element, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

import '../modele/bieere_petit_model.dart';
import '../modele/bierre_grand_model.dart';
import '../modele/budgetBar.dart';
import '../modele/budget_centre.dart';
import '../modele/centre_vente.dart';
import '../modele/credit.dart';
import '../modele/credits_servants.dart';
import '../modele/credits_vente.dart';
import '../modele/depense.dart';
import '../modele/depense_centre.dart';
import '../modele/donnesservants.dart';
import '../modele/materiel_bar.dart';
import '../modele/matriel_centre.dart';
import '../modele/pertes_centre.dart';
import '../modele/pertes_restaurant.dart';
import '../modele/photocopie.dart';
import '../modele/probleme.dart';
import '../modele/probleme_centre.dart';
import '../modele/produit.dart';
import '../modele/rapport.dart';
import '../modele/serigraphie.dart';
import '../modele/vente_credit.dart';
import '../modele/vente_grand_modele.dart';
import '../modele/vente_petit_modele.dart';
import '../modele/vente_photocopie.dart';
import '../modele/vente_tee_shirts.dart';
import '../services/user.dart';
import '../services/user_centre.dart';

class serviceBD {
  final FirebaseFirestore _Ref = FirebaseFirestore.instance;
// user data
  Stream<donnesUtilisateur> donnes(String user_uid) {
    return _Ref.collection("users")
        .doc(user_uid)
        .snapshots()
        .map((snap) => donnesUtilisateur.fromFiresotre(snap));
  }

  Stream<List<pertesCentre>> get toutes_les_pertes_du_centre {
    return _Ref.collection("pertes_centre")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => pertesCentre.fromFirestore(e)).toList());
  }

  Stream<List<pertesCentre>> list_pertes_centre(String user_uid) {
    return _Ref.collection("pertes_centre")
        .where("user_uid", isEqualTo: user_uid)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => pertesCentre.fromFirestore(e)).toList());
  }

  Stream<pertesCentre> pertes_du_centre(String perte_uid) {
    return _Ref.collection("pertes_centre")
        .doc(perte_uid)
        .snapshots()
        .map((event) => pertesCentre.fromFirestore(event));
  }

  Stream<List<pertesbar>> get toutes_les_pertes_du_bar {
    return _Ref.collection("pertes_bar")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => pertesbar.fromFirestore(e)).toList());
  }

  Stream<List<pertesbar>> list_pertes_bar(String user_uid) {
    return _Ref.collection("pertes_bar")
        .where("user_uid", isEqualTo: user_uid)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => pertesbar.fromFirestore(e)).toList());
  }

  Stream<pertesbar> pertes_du_bar(String perte_uid) {
    return _Ref.collection("pertes_bar")
        .doc(perte_uid)
        .snapshots()
        .map((event) => pertesbar.fromFirestore(event));
  }

  Stream<List<materielCentre>> get list_materiel_centre {
    return _Ref.collection("materiaux_centre")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => materielCentre.FromFirestore(e)).toList());
  }

  Stream<materielCentre> matriel_centre(String materiel_uid) {
    return _Ref.collection("materiaux_centre")
        .doc(materiel_uid)
        .snapshots()
        .map((event) => materielCentre.FromFirestore(event));
  }

  Stream<List<materielBar>> get list_materiel_bar {
    return _Ref.collection("materiaux_bar")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => materielBar.FromFirestore(e)).toList());
  }

  Stream<materielBar> matriel_bar(String materiel_uid) {
    return _Ref.collection("materiaux_bar")
        .doc(materiel_uid)
        .snapshots()
        .map((event) => materielBar.FromFirestore(event));
  }

  Stream<rapport> get donnes_rapport {
    return _Ref.collection("rapports")
        .doc("rapport")
        .snapshots()
        .map((event) => rapport.fromfirestore(event));
  }

  Stream<List<VenteACreditsCentre>> vente_a_credit_servant_centre(
      String servant_uid) {
    return _Ref.collection("vente_a_credit_centre")
        .where("user_uid", isEqualTo: servant_uid)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) => event.docs
            .map((e) => VenteACreditsCentre.FromFirestore(e))
            .toList());
  }

  Stream<VenteACreditsCentre> vente_a_credit_centre(String credit_uid) {
    return _Ref.collection("vente_a_credit_centre")
        .doc(credit_uid)
        .snapshots()
        .map((event) => VenteACreditsCentre.FromFirestore(event));
  }

  Stream<List<VenteACreditsCentre>> get list_credits_vente_centre {
    return _Ref.collection("vente_a_credit_centre")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) => event.docs
            .map((e) => VenteACreditsCentre.FromFirestore(e))
            .toList());
  }

  Stream<List<VenteACreditBars>> vente_a_credits_servant_bar(
      String servant_uid) {
    return _Ref.collection("vente_a_credit_bar")
        .where("user_uid", isEqualTo: servant_uid)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => VenteACreditBars.fromFirestore(e)).toList());
  }

  Stream<VenteACreditBars> vente_a_credit_servant_bar(String credit_uid) {
    return _Ref.collection("vente_a_credit_bar")
        .doc(credit_uid)
        .snapshots()
        .map((event) => VenteACreditBars.fromFirestore(event));
  }

  Stream<List<VenteACreditBars>> get list_credits_vente_bar {
    return _Ref.collection("vente_a_credit_bar")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => VenteACreditBars.fromFirestore(e)).toList());
  }

  Stream<donnesUtilisateur> get currentuserdata {
    return _Ref.collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .map((event) => donnesUtilisateur.fromFiresotre(event));
  }

  Future<String> addUser(String uid, String nom, String prenom, String sexe,
      String telephone, String date_naissance, String email) async {
    try {
      await _Ref.collection("users").doc(uid).set({
        "nom": nom,
        "prenom": prenom,
        "sexe": sexe,
        "date_naissance": date_naissance,
        "telephone": telephone,
        "email": email,
        "timestamp": DateTime.now(),
        "admin": false,
        "is_active": true,
      }).then((value) {
        return "Compte créeé avec succès";
      });
    } catch (e) {
      return "Echec";
    }
    return "Echec";
  }

  Stream<List<serigraphie>> get list_tee_shirts {
    return _Ref.collection("tee_shirts").snapshots().map((event) =>
        event.docs.map((e) => serigraphie.fromfirestore(e)).toList());
  }

  Stream<serigraphie> tee_shirt(String tee_shirt_uid) {
    return _Ref.collection("tee_shirts")
        .doc(tee_shirt_uid)
        .snapshots()
        .map((event) => serigraphie.fromfirestore(event));
  }

  Stream<List<venteteeshirts>> get les_ventes_de_tee_shirts {
    return _Ref.collection("vente_tee_shirts").snapshots().map((event) =>
        event.docs.map((e) => venteteeshirts.fromfirestore(e)).toList());
  }

  Stream<List<venteteeshirts>> list_vente_tee_shirt(String user_uid) {
    return _Ref.collection("vente_tee_shirts")
        .where("user_uid", isEqualTo: user_uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => venteteeshirts.fromfirestore(e)).toList());
  }

  Stream<List<venteteeshirts>> get tous_les_vente_tee_shirts {
    return _Ref.collection("vente_tee_shirts").snapshots().map((event) =>
        event.docs.map((e) => venteteeshirts.fromfirestore(e)).toList());
  }

  Stream<List<centreVente>> get tous_les_ventes_produits {
    return _Ref.collection("centre_vente_produits").snapshots().map((event) =>
        event.docs.map((e) => centreVente.fromfirestore(e)).toList());
  }

  Stream<venteteeshirts> vente_tee_shirt(String vente_tee_shirt_uid) {
    return _Ref.collection('vente_tee_shirts')
        .doc(vente_tee_shirt_uid)
        .snapshots()
        .map((event) => venteteeshirts.fromfirestore(event));
  }

  // liste de produits

  Stream<List<products>> get list_produits_centre {
    return _Ref.collection("produits_centre")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => products.fromFirestore(e)).toList());
  }

  Stream<List<venteGrandModele>> get tous_les_ventes_grand_modeles {
    return _Ref.collection("ventes_grand_modele").snapshots().map((event) =>
        event.docs.map((e) => venteGrandModele.fromFirestore(e)).toList());
  }

  Stream<List<ventePetitModele>> get tous_les_ventes_petit_modeles {
    return _Ref.collection("ventes_petit_modele").snapshots().map((event) =>
        event.docs.map((e) => ventePetitModele.fromFirestore(e)).toList());
  }

  Stream<List<venteCredit>> get tous_les_ventes_credits {
    return _Ref.collection("vente_credits").snapshots().map((event) =>
        event.docs.map((e) => venteCredit.fromFirestore(e)).toList());
  }

  // produit du centre

  Stream<products> produit_centre(String produit_uid) {
    return _Ref.collection("produits_centre")
        .doc(produit_uid)
        .snapshots()
        .map((event) => products.fromFirestore(event));
  }

  // list de vente de credits

  Stream<List<centreVente>> centre_list_vente_produits(String employe_uid) {
    return _Ref.collection("centre_vente_produits")
        .where("user_uid", isEqualTo: employe_uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => centreVente.fromfirestore(e)).toList());
  }

  Stream<List<ventePetitModele>> list_vente_petit_modele(String employe_uid) {
    return _Ref.collection("ventes_petit_modele")
        .where("user_uid", isEqualTo: employe_uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ventePetitModele.fromFirestore(e)).toList());
  }

  Stream<ventePetitModele> vente_petit_modele(String vente_uid) {
    return _Ref.collection("ventes_petit_modele")
        .doc(vente_uid)
        .snapshots()
        .map((event) => ventePetitModele.fromFirestore(event));
  }

  Stream<List<venteGrandModele>> list_vente_grand_modele(String employe_uid) {
    return _Ref.collection("ventes_grand_modele")
        .where("user_uid", isEqualTo: employe_uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => venteGrandModele.fromFirestore(e)).toList());
  }

  Stream<venteGrandModele> vente_grand_modele(String vente_uid) {
    return _Ref.collection("ventes_grand_modele")
        .doc(vente_uid)
        .snapshots()
        .map((event) => venteGrandModele.fromFirestore(event));
  }

  // ventre centre

  Stream<centreVente> centre_vente_produit(String vente_uid) {
    return _Ref.collection("centre_vente_produits")
        .doc(vente_uid)
        .snapshots()
        .map((event) => centreVente.fromfirestore(event));
  }

  Stream<List<venteCredit>> list_vente_credits(String employe_uid) {
    return _Ref.collection("vente_credits")
        .where("user_uid", isEqualTo: employe_uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => venteCredit.fromFirestore(e)).toList());
  }

  Stream<venteCredit> vente_credit(String vente_credit_uid) {
    return _Ref.collection("vente_credits")
        .doc(vente_credit_uid)
        .snapshots()
        .map((event) => venteCredit.fromFirestore(event));
  }

  Stream<List<donnesServants>> get list_seravants_bar {
    return _Ref.collection("users")
        .where('domaine', isEqualTo: "Bar restaurant")
        .where("deleted", isEqualTo: false)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => donnesServants.fromFiresotre(e)).toList());
  }

  Stream<List<userCentre>> get list_seravants_centre {
    return _Ref.collection("users")
        .where('domaine', isEqualTo: "Centre informatique")
        .where("deleted", isEqualTo: false)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => userCentre.fromFirestore(e)).toList());
  }

  Stream<donnesServants> servant_data(String servant_uid) {
    return _Ref.collection("users")
        .doc(servant_uid)
        .snapshots()
        .map((event) => donnesServants.fromFiresotre(event));
  }

  Stream<userCentre> servant_data_centre(String servant_uid) {
    return _Ref.collection("users")
        .doc(servant_uid)
        .snapshots()
        .map((event) => userCentre.fromFirestore(event));
  }

  // list de reseaux credits

  Stream<List<credit>> get list_reseaux_credits {
    return _Ref.collection("reseaux_communication")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map(
            (event) => event.docs.map((e) => credit.fromfirestore(e)).toList());
  }

  // credit stream
  Stream<credit> reseau_credit(String credit_uid) {
    return _Ref.collection("reseaux_communication")
        .doc(credit_uid)
        .snapshots()
        .map((event) => credit.fromfirestore(event));
  }

  // accoder droits donnesUtilisateurs

  Stream<List<donnesUtilisateur>> infoEmploye(String email) {
    return _Ref.collection("users")
        .where('email', isEqualTo: email)
        .limit(1)
        .snapshots()
        .map((snap) =>
            snap.docs.map((e) => donnesUtilisateur.fromFiresotre(e)).toList());
  }

  // list of users
  Stream<List<donnesUtilisateur>> get listDonnesUtilisateur {
    return _Ref.collection("users")
        .where("deleted", isEqualTo: false)
        .snapshots()
        .map((documents) => documents.docs
            .map((snap) => donnesUtilisateur.fromFiresotre(snap))
            .toList());
  }

// bierre petit modele data
  Stream<donneesBieerePetitModele> bierreData(String bierreId) {
    return _Ref.collection("bierres_petit_modele")
        .doc(bierreId)
        .snapshots()
        .map((snap) => donneesBieerePetitModele.fromFirestore(snap));
  }

// list of small modal of biar
  Stream<List<donneesBieerePetitModele>> get listDonnesBierresPetitModele {
    return _Ref.collection("bierres_petit_modele")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((documents) => documents.docs
            .map((snap) => donneesBieerePetitModele.fromFirestore(snap))
            .toList());
  }

  // list des depenses de l'employé connecté maintenant
  Stream<List<donnesDepense>> list_depenses_bar(String user_uid) {
    return _Ref.collection("depenses")
        .where("user_uid", isEqualTo: user_uid)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((e) => donnesDepense.fromFirestore(e)).toList());
  }

  Stream<donnesDepense> depenses_bar(String depense_uid) {
    return _Ref.collection("depenses")
        .doc(depense_uid)
        .snapshots()
        .map((snap) => donnesDepense.fromFirestore(snap));
  }

  Stream<List<donnesDepense>> get tous_les_depenses_bar {
    return _Ref.collection("depenses")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((e) => donnesDepense.fromFirestore(e)).toList());
  }

  // list of depense par employé

  Stream<List<DepenseCentre>> list_depense_centre(String user_id) {
    return _Ref.collection("depenses_centre")
        .where("user_uid", isEqualTo: user_id)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((documents) => documents.docs
            .map((snap) => DepenseCentre.fromFirestore(snap))
            .toList());
  }

  Stream<DepenseCentre> depense_centre(String depense_id) {
    return _Ref.collection("depenses_centre")
        .doc(depense_id)
        .snapshots()
        .map((documents) => DepenseCentre.fromFirestore(documents));
  }

  Stream<List<DepenseCentre>> get tous_les_depense_centre {
    return _Ref.collection("depenses_centre")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((documents) => documents.docs
            .map((snap) => DepenseCentre.fromFirestore(snap))
            .toList());
  }

  // biar big modal data

  Stream<donnesBierresGrandModel> bierreGrandModele(String uid) {
    return _Ref.collection("bierres_grand_modele")
        .doc(uid)
        .snapshots()
        .map((snap) => donnesBierresGrandModel.fromFirestore(snap));
  }

  // list of big modal biar

  Stream<List<donnesBierresGrandModel>> get lisBiarGrandModel {
    return _Ref.collection("bierres_grand_modele")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((documents) => documents.docs
            .map((snap) => donnesBierresGrandModel.fromFirestore(snap))
            .toList());
  }

  // list des servants du bar

  Stream<List<donnesServants>> get servantBar {
    return _Ref.collection("users")
        .where("deleted", isEqualTo: false)
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => donnesServants.fromFiresotre(e)).toList());
  }

  // budget bar data

  Stream<BudgetBar> get budgetBardata {
    return _Ref.collection('budget')
        .doc("budgetbar")
        .snapshots()
        .map((snap) => BudgetBar.fromFirestore(snap));
  }

  // budget centre informatique data

  Stream<budgetCentre> get budgetcentredata {
    return _Ref.collection('budget')
        .doc("budget")
        .snapshots()
        .map((snap) => budgetCentre.fromFirestore(snap));
  }
  // probleme data

  Stream<probleme> probleme_bar(String probleme_uid) {
    return _Ref.collection("problemes")
        .doc(probleme_uid)
        .snapshots()
        .map((event) => probleme.fromFirestore(event));
  }

  // list of problemes

  Stream<List<probleme>> list_probleme_bar(String user_uid) {
    return _Ref.collection("problemes")
        .where("user_uid", isEqualTo: user_uid)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => probleme.fromFirestore(e)).toList());
  }

  Stream<problemeCentre> probleme_centre(String probleme_uid) {
    return _Ref.collection("problemes_centre")
        .doc(probleme_uid)
        .snapshots()
        .map((event) => problemeCentre.fromFirestore(event));
  }

  // list of problemes

  Stream<List<problemeCentre>> list_probleme_centre(String user_uid) {
    return _Ref.collection("problemes_centre")
        .where("user_uid", isEqualTo: user_uid)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => problemeCentre.fromFirestore(e)).toList());
  }

  Stream<List<probleme>> get tous_les_problemes_bar {
    return _Ref.collection("problemes")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => probleme.fromFirestore(e)).toList());
  }

  Stream<List<problemeCentre>> get tous_les_problemes_centre {
    return _Ref.collection("problemes_centre")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => problemeCentre.fromFirestore(e)).toList());
  }

  Stream<List<Photocopies>> get list_des_pjotocopies {
    return _Ref.collection("photocopies").snapshots().map((event) =>
        event.docs.map((e) => Photocopies.FromFirestore(e)).toList());
  }

  Stream<Photocopies> photocopie(String photocopie_uid) {
    return _Ref.collection("photocopies")
        .doc(photocopie_uid)
        .snapshots()
        .map((event) => Photocopies.FromFirestore(event));
  }

  Stream<List<VentePhotocopies>> get list_des_ventes_de_photocopies {
    return _Ref.collection("vente_photocopies").snapshots().map((event) =>
        event.docs.map((e) => VentePhotocopies.FromFirestore(e)).toList());
  }
}

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: camel_case_types

class serigraphie {
  final String tee_shirt_nom;
  final String uid;
  final String qualite;
  final int prix_unitaire_vente;
  final int prix_unitaire_achat;
  final int montant_vendu;
  final int montant_vendu_cumule;
  final int quantite_initial;
  final int quantite_initial_cumule;
  final int quantite_physique;
  final int quantite_physique_cumule;
  final int seuil_approvisionnement;
  final int benefice;
  final int benefice_cumule;
  final bool approvisionne;
  serigraphie({
    required this.tee_shirt_nom,
    required this.uid,
    required this.qualite,
    required this.prix_unitaire_vente,
    required this.prix_unitaire_achat,
    required this.montant_vendu,
    required this.montant_vendu_cumule,
    required this.quantite_initial,
    required this.quantite_initial_cumule,
    required this.quantite_physique,
    required this.quantite_physique_cumule,
    required this.seuil_approvisionnement,
    required this.benefice,
    required this.benefice_cumule,
    required this.approvisionne,
  });

  factory serigraphie.fromfirestore(DocumentSnapshot document) {
    return serigraphie(
      approvisionne: (document.data() as Map)['approvisionne'],
      benefice: (document.data() as Map)['benefice'],
      benefice_cumule: (document.data() as Map)['benefice_cumule'],
      tee_shirt_nom: (document.data() as Map<String, dynamic>)['nom_tee_shirt'],
      uid: document.id,
      qualite: (document.data() as Map<String, dynamic>)['qualite'],
      prix_unitaire_vente: (document.data() as Map)['prix_unitaire'],
      prix_unitaire_achat: (document.data() as Map)['prix_unitaire_achat'],
      montant_vendu: (document.data() as Map)['montant_vendu'],
      montant_vendu_cumule: (document.data() as Map)['montant_vendu_cumule'],
      quantite_initial: (document.data() as Map)['quantite_initial'],
      quantite_initial_cumule:
          (document.data() as Map)['quantite_initial_cumule'],
      quantite_physique: (document.data() as Map)['quantite_physique'],
      quantite_physique_cumule:
          (document.data() as Map)['quantite_physique_cumule'],
      seuil_approvisionnement:
          (document.data() as Map)['seuil_approvisionnement'],
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'tee_shirt_nom': tee_shirt_nom});
    result.addAll({'uid': uid});
    result.addAll({'qualite': qualite});
    result.addAll({'prix_unitaire_vente': prix_unitaire_vente});
    result.addAll({'prix_unitaire_achat': prix_unitaire_achat});
    result.addAll({'montant_vendu': montant_vendu});
    result.addAll({'montant_vendu_cumule': montant_vendu_cumule});
    result.addAll({'quantite_initial': quantite_initial});
    result.addAll({'quantite_initial_cumule': quantite_initial_cumule});
    result.addAll({'quantite_physique': quantite_physique});
    result.addAll({'quantite_physique_cumule': quantite_physique_cumule});
    result.addAll({'seuil_approvisionnement': seuil_approvisionnement});
    result.addAll({'benefice': benefice});
    result.addAll({'benefice_cumule': benefice_cumule});
    result.addAll({'approvisionne': approvisionne});

    return result;
  }

  factory serigraphie.fromMap(Map<String, dynamic> map) {
    return serigraphie(
      tee_shirt_nom: map['tee_shirt_nom'] ?? '',
      uid: map['uid'] ?? '',
      qualite: map['qualite'] ?? '',
      prix_unitaire_vente: map['prix_unitaire_vente']?.toInt() ?? 0,
      prix_unitaire_achat: map['prix_unitaire_achat']?.toInt() ?? 0,
      montant_vendu: map['montant_vendu']?.toInt() ?? 0,
      montant_vendu_cumule: map['montant_vendu_cumule']?.toInt() ?? 0,
      quantite_initial: map['quantite_initial']?.toInt() ?? 0,
      quantite_initial_cumule: map['quantite_initial_cumule']?.toInt() ?? 0,
      quantite_physique: map['quantite_physique']?.toInt() ?? 0,
      quantite_physique_cumule: map['quantite_physique_cumule']?.toInt() ?? 0,
      seuil_approvisionnement: map['seuil_approvisionnement']?.toInt() ?? 0,
      benefice: map['benefice']?.toInt() ?? 0,
      benefice_cumule: map['benefice_cumule']?.toInt() ?? 0,
      approvisionne: map['approvisionne'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory serigraphie.fromJson(String source) =>
      serigraphie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'serigraphie(tee_shirt_nom: $tee_shirt_nom, uid: $uid, qualite: $qualite, prix_unitaire_vente: $prix_unitaire_vente, prix_unitaire_achat: $prix_unitaire_achat, montant_vendu: $montant_vendu, montant_vendu_cumule: $montant_vendu_cumule, quantite_initial: $quantite_initial, quantite_initial_cumule: $quantite_initial_cumule, quantite_physique: $quantite_physique, quantite_physique_cumule: $quantite_physique_cumule, seuil_approvisionnement: $seuil_approvisionnement, benefice: $benefice, benefice_cumule: $benefice_cumule, approvisionne: $approvisionne)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is serigraphie &&
        other.tee_shirt_nom == tee_shirt_nom &&
        other.uid == uid &&
        other.qualite == qualite &&
        other.prix_unitaire_vente == prix_unitaire_vente &&
        other.prix_unitaire_achat == prix_unitaire_achat &&
        other.montant_vendu == montant_vendu &&
        other.montant_vendu_cumule == montant_vendu_cumule &&
        other.quantite_initial == quantite_initial &&
        other.quantite_initial_cumule == quantite_initial_cumule &&
        other.quantite_physique == quantite_physique &&
        other.quantite_physique_cumule == quantite_physique_cumule &&
        other.seuil_approvisionnement == seuil_approvisionnement &&
        other.benefice == benefice &&
        other.benefice_cumule == benefice_cumule &&
        other.approvisionne == approvisionne;
  }

  @override
  int get hashCode {
    return tee_shirt_nom.hashCode ^
        uid.hashCode ^
        qualite.hashCode ^
        prix_unitaire_vente.hashCode ^
        prix_unitaire_achat.hashCode ^
        montant_vendu.hashCode ^
        montant_vendu_cumule.hashCode ^
        quantite_initial.hashCode ^
        quantite_initial_cumule.hashCode ^
        quantite_physique.hashCode ^
        quantite_physique_cumule.hashCode ^
        seuil_approvisionnement.hashCode ^
        benefice.hashCode ^
        benefice_cumule.hashCode ^
        approvisionne.hashCode;
  }
}

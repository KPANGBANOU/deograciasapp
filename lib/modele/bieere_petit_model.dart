import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types

class donneesBieerePetitModele {
  final int prix_unitaire;
  final int quantite_initial;
  final int quantite_initial_cumule;
  final int quantite_physique;
  final int quantite_physique_cumule;
  final int seuil_approvisionnement;
  final String nom;
  final String type;
  final String uid;
  final int benefice;
  final int benefice_cumule;
  final int prix_unitaire_achat;
  final int montant_vendu;
  final int montant_vendu_cumule;
  final bool approvisionne;
  donneesBieerePetitModele({
    required this.prix_unitaire,
    required this.quantite_initial,
    required this.quantite_initial_cumule,
    required this.quantite_physique,
    required this.quantite_physique_cumule,
    required this.seuil_approvisionnement,
    required this.nom,
    required this.type,
    required this.uid,
    required this.benefice,
    required this.benefice_cumule,
    required this.prix_unitaire_achat,
    required this.montant_vendu,
    required this.montant_vendu_cumule,
    required this.approvisionne,
  });

  factory donneesBieerePetitModele.fromFirestore(DocumentSnapshot document) {
    return donneesBieerePetitModele(
        quantite_initial_cumule:
            (document.data() as Map)['quantite_initial_cumule'],
        approvisionne: (document.data() as Map)['approvisionne'],
        montant_vendu: (document.data() as Map)['montant_vendu'],
        montant_vendu_cumule: (document.data() as Map)['montant_vendu_cumule'],
        benefice: (document.data() as Map)['benefice'],
        benefice_cumule: (document.data() as Map)['benefice_cumule'],
        prix_unitaire: (document.data() as Map)['prix_unitaire'],
        quantite_initial: (document.data() as Map)['quantite_initial'],
        quantite_physique: (document.data() as Map)['quantite_physique'],
        quantite_physique_cumule:
            (document.data() as Map)['quantite_physique_cumule'],
        seuil_approvisionnement:
            (document.data() as Map)['seuil_approvisionnement'],
        nom: (document.data() as Map<String, dynamic>)['nom'],
        type: (document.data() as Map<String, dynamic>)['type'],
        uid: (document.id),
        prix_unitaire_achat: (document.data() as Map)['prix_unitaire_achat']);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'prix_unitaire': prix_unitaire});
    result.addAll({'quantite_initial': quantite_initial});
    result.addAll({'quantite_initial_cumule': quantite_initial_cumule});
    result.addAll({'quantite_physique': quantite_physique});
    result.addAll({'quantite_physique_cumule': quantite_physique_cumule});
    result.addAll({'seuil_approvisionnement': seuil_approvisionnement});
    result.addAll({'nom': nom});
    result.addAll({'type': type});
    result.addAll({'uid': uid});
    result.addAll({'benefice': benefice});
    result.addAll({'benefice_cumule': benefice_cumule});
    result.addAll({'prix_unitaire_achat': prix_unitaire_achat});
    result.addAll({'montant_vendu': montant_vendu});
    result.addAll({'montant_vendu_cumule': montant_vendu_cumule});
    result.addAll({'approvisionne': approvisionne});

    return result;
  }

  factory donneesBieerePetitModele.fromMap(Map<String, dynamic> map) {
    return donneesBieerePetitModele(
      prix_unitaire: map['prix_unitaire']?.toInt() ?? 0,
      quantite_initial: map['quantite_initial']?.toInt() ?? 0,
      quantite_initial_cumule: map['quantite_initial_cumule']?.toInt() ?? 0,
      quantite_physique: map['quantite_physique']?.toInt() ?? 0,
      quantite_physique_cumule: map['quantite_physique_cumule']?.toInt() ?? 0,
      seuil_approvisionnement: map['seuil_approvisionnement']?.toInt() ?? 0,
      nom: map['nom'] ?? '',
      type: map['type'] ?? '',
      uid: map['uid'] ?? '',
      benefice: map['benefice']?.toInt() ?? 0,
      benefice_cumule: map['benefice_cumule']?.toInt() ?? 0,
      prix_unitaire_achat: map['prix_unitaire_achat']?.toInt() ?? 0,
      montant_vendu: map['montant_vendu']?.toInt() ?? 0,
      montant_vendu_cumule: map['montant_vendu_cumule']?.toInt() ?? 0,
      approvisionne: map['approvisionne'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory donneesBieerePetitModele.fromJson(String source) =>
      donneesBieerePetitModele.fromMap(json.decode(source));

  @override
  String toString() {
    return 'donneesBieerePetitModele(prix_unitaire: $prix_unitaire, quantite_initial: $quantite_initial, quantite_initial_cumule: $quantite_initial_cumule, quantite_physique: $quantite_physique, quantite_physique_cumule: $quantite_physique_cumule, seuil_approvisionnement: $seuil_approvisionnement, nom: $nom, type: $type, uid: $uid, benefice: $benefice, benefice_cumule: $benefice_cumule, prix_unitaire_achat: $prix_unitaire_achat, montant_vendu: $montant_vendu, montant_vendu_cumule: $montant_vendu_cumule, approvisionne: $approvisionne)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is donneesBieerePetitModele &&
        other.prix_unitaire == prix_unitaire &&
        other.quantite_initial == quantite_initial &&
        other.quantite_initial_cumule == quantite_initial_cumule &&
        other.quantite_physique == quantite_physique &&
        other.quantite_physique_cumule == quantite_physique_cumule &&
        other.seuil_approvisionnement == seuil_approvisionnement &&
        other.nom == nom &&
        other.type == type &&
        other.uid == uid &&
        other.benefice == benefice &&
        other.benefice_cumule == benefice_cumule &&
        other.prix_unitaire_achat == prix_unitaire_achat &&
        other.montant_vendu == montant_vendu &&
        other.montant_vendu_cumule == montant_vendu_cumule &&
        other.approvisionne == approvisionne;
  }

  @override
  int get hashCode {
    return prix_unitaire.hashCode ^
        quantite_initial.hashCode ^
        quantite_initial_cumule.hashCode ^
        quantite_physique.hashCode ^
        quantite_physique_cumule.hashCode ^
        seuil_approvisionnement.hashCode ^
        nom.hashCode ^
        type.hashCode ^
        uid.hashCode ^
        benefice.hashCode ^
        benefice_cumule.hashCode ^
        prix_unitaire_achat.hashCode ^
        montant_vendu.hashCode ^
        montant_vendu_cumule.hashCode ^
        approvisionne.hashCode;
  }

  donneesBieerePetitModele copyWith({
    int? prix_unitaire,
    int? quantite_initial,
    int? quantite_initial_cumule,
    int? quantite_physique,
    int? quantite_physique_cumule,
    int? seuil_approvisionnement,
    String? nom,
    String? type,
    String? uid,
    int? benefice,
    int? benefice_cumule,
    int? prix_unitaire_achat,
    int? montant_vendu,
    int? montant_vendu_cumule,
    bool? approvisionne,
  }) {
    return donneesBieerePetitModele(
      prix_unitaire: prix_unitaire ?? this.prix_unitaire,
      quantite_initial: quantite_initial ?? this.quantite_initial,
      quantite_initial_cumule:
          quantite_initial_cumule ?? this.quantite_initial_cumule,
      quantite_physique: quantite_physique ?? this.quantite_physique,
      quantite_physique_cumule:
          quantite_physique_cumule ?? this.quantite_physique_cumule,
      seuil_approvisionnement:
          seuil_approvisionnement ?? this.seuil_approvisionnement,
      nom: nom ?? this.nom,
      type: type ?? this.type,
      uid: uid ?? this.uid,
      benefice: benefice ?? this.benefice,
      benefice_cumule: benefice_cumule ?? this.benefice_cumule,
      prix_unitaire_achat: prix_unitaire_achat ?? this.prix_unitaire_achat,
      montant_vendu: montant_vendu ?? this.montant_vendu,
      montant_vendu_cumule: montant_vendu_cumule ?? this.montant_vendu_cumule,
      approvisionne: approvisionne ?? this.approvisionne,
    );
  }
}

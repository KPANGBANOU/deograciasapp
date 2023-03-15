// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: camel_case_types

class credit {
  final String uid;
  final String nom;
  final double benefice;
  final double benefice_cumule;
  final int montant_initial;
  final int montant_initial_cumule;
  final int montant_disponible;
  final int montant_disponible_cumule;
  final int seuil_approvisionnement;
  final int benefice_sur_5000;
  final bool approvisionne;
  credit({
    required this.uid,
    required this.nom,
    required this.benefice,
    required this.benefice_cumule,
    required this.montant_initial,
    required this.montant_initial_cumule,
    required this.montant_disponible,
    required this.montant_disponible_cumule,
    required this.seuil_approvisionnement,
    required this.benefice_sur_5000,
    required this.approvisionne,
  });

  factory credit.fromfirestore(DocumentSnapshot document) {
    return credit(
        approvisionne: (document.data() as Map)['approvisionne'],
        benefice_sur_5000: (document.data() as Map)['benefice_sur_5000'],
        benefice: (document.data() as Map)['benefice'],
        benefice_cumule: ((document.data() as Map)['benefice_cumule']),
        uid: document.id,
        nom: (document.data() as Map<String, dynamic>)['nom'],
        montant_initial: (document.data() as Map)['montant_initial'],
        montant_initial_cumule:
            (document.data() as Map)['montant_initial_cumule'],
        montant_disponible: (document.data() as Map)['montant_disponible'],
        montant_disponible_cumule:
            (document.data() as Map)['montant_disponible_cumule'],
        seuil_approvisionnement:
            (document.data() as Map)['seuil_approvisionnement']);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'benefice': benefice});
    result.addAll({'benefice_cumule': benefice_cumule});
    result.addAll({'montant_initial': montant_initial});
    result.addAll({'montant_initial_cumule': montant_initial_cumule});
    result.addAll({'montant_disponible': montant_disponible});
    result.addAll({'montant_disponible_cumule': montant_disponible_cumule});
    result.addAll({'seuil_approvisionnement': seuil_approvisionnement});
    result.addAll({'benefice_sur_5000': benefice_sur_5000});
    result.addAll({'approvisionne': approvisionne});

    return result;
  }

  factory credit.fromMap(Map<String, dynamic> map) {
    return credit(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      benefice: map['benefice']?.toDouble() ?? 0.0,
      benefice_cumule: map['benefice_cumule']?.toDouble() ?? 0.0,
      montant_initial: map['montant_initial']?.toInt() ?? 0,
      montant_initial_cumule: map['montant_initial_cumule']?.toInt() ?? 0,
      montant_disponible: map['montant_disponible']?.toInt() ?? 0,
      montant_disponible_cumule: map['montant_disponible_cumule']?.toInt() ?? 0,
      seuil_approvisionnement: map['seuil_approvisionnement']?.toInt() ?? 0,
      benefice_sur_5000: map['benefice_sur_5000']?.toInt() ?? 0,
      approvisionne: map['approvisionne'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory credit.fromJson(String source) => credit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'credit(uid: $uid, nom: $nom, benefice: $benefice, benefice_cumule: $benefice_cumule, montant_initial: $montant_initial, montant_initial_cumule: $montant_initial_cumule, montant_disponible: $montant_disponible, montant_disponible_cumule: $montant_disponible_cumule, seuil_approvisionnement: $seuil_approvisionnement, benefice_sur_5000: $benefice_sur_5000, approvisionne: $approvisionne)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is credit &&
        other.uid == uid &&
        other.nom == nom &&
        other.benefice == benefice &&
        other.benefice_cumule == benefice_cumule &&
        other.montant_initial == montant_initial &&
        other.montant_initial_cumule == montant_initial_cumule &&
        other.montant_disponible == montant_disponible &&
        other.montant_disponible_cumule == montant_disponible_cumule &&
        other.seuil_approvisionnement == seuil_approvisionnement &&
        other.benefice_sur_5000 == benefice_sur_5000 &&
        other.approvisionne == approvisionne;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        benefice.hashCode ^
        benefice_cumule.hashCode ^
        montant_initial.hashCode ^
        montant_initial_cumule.hashCode ^
        montant_disponible.hashCode ^
        montant_disponible_cumule.hashCode ^
        seuil_approvisionnement.hashCode ^
        benefice_sur_5000.hashCode ^
        approvisionne.hashCode;
  }
}

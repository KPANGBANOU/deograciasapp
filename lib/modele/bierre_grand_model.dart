// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: camel_case_types

class donnesBierresGrandModel {
  final int prix_unitaire;
  final int quantite_initial;
  final int quantite_initial_cumule;
  final int quantite_physique;
  final int quantite_physique_cumule;
  final int seuil_approvisionnement;
  final String nom;
  final String type;
  final String uid;
  final int prix_unitaire_achat;
  final int benefice;
  final int benefice_cumule;
  final int montant_vendu;
  final int montant_cumule;
  final bool approvisionne;
  donnesBierresGrandModel({
    required this.prix_unitaire,
    required this.quantite_initial,
    required this.quantite_initial_cumule,
    required this.quantite_physique,
    required this.quantite_physique_cumule,
    required this.seuil_approvisionnement,
    required this.nom,
    required this.type,
    required this.uid,
    required this.prix_unitaire_achat,
    required this.benefice,
    required this.benefice_cumule,
    required this.montant_vendu,
    required this.montant_cumule,
    required this.approvisionne,
  });

  factory donnesBierresGrandModel.fromFirestore(DocumentSnapshot document) {
    return donnesBierresGrandModel(
        approvisionne: (document.data() as Map)['approvisionne'],
        montant_vendu: (document.data() as Map)['montant_vendu'],
        montant_cumule: (document.data() as Map)['montant_vendu_cumule'],
        benefice: (document.data() as Map)['benefice'],
        benefice_cumule: (document.data() as Map)['benefice_cumule'],
        prix_unitaire_achat: (document.data() as Map)["prix_unitaire_achat"],
        prix_unitaire: (document.data() as Map)["prix_unitaire"],
        quantite_initial: (document.data() as Map)["quantite_initial"],
        quantite_initial_cumule:
            (document.data() as Map)["quantite_initial_cumule"],
        quantite_physique: (document.data() as Map)["quantite_physique"],
        quantite_physique_cumule:
            (document.data() as Map)["quantite_physique_cumule"],
        seuil_approvisionnement:
            (document.data() as Map)["seuil_approvisionnement"],
        nom: (document.data() as Map<String, dynamic>)["nom"],
        type: (document.data() as Map<String, dynamic>)["type"],
        uid: (document.id));
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
    result.addAll({'prix_unitaire_achat': prix_unitaire_achat});
    result.addAll({'benefice': benefice});
    result.addAll({'benefice_cumule': benefice_cumule});
    result.addAll({'montant_vendu': montant_vendu});
    result.addAll({'montant_cumule': montant_cumule});
    result.addAll({'approvisionne': approvisionne});

    return result;
  }

  factory donnesBierresGrandModel.fromMap(Map<String, dynamic> map) {
    return donnesBierresGrandModel(
      prix_unitaire: map['prix_unitaire']?.toInt() ?? 0,
      quantite_initial: map['quantite_initial']?.toInt() ?? 0,
      quantite_initial_cumule: map['quantite_initial_cumule']?.toInt() ?? 0,
      quantite_physique: map['quantite_physique']?.toInt() ?? 0,
      quantite_physique_cumule: map['quantite_physique_cumule']?.toInt() ?? 0,
      seuil_approvisionnement: map['seuil_approvisionnement']?.toInt() ?? 0,
      nom: map['nom'] ?? '',
      type: map['type'] ?? '',
      uid: map['uid'] ?? '',
      prix_unitaire_achat: map['prix_unitaire_achat']?.toInt() ?? 0,
      benefice: map['benefice']?.toInt() ?? 0,
      benefice_cumule: map['benefice_cumule']?.toInt() ?? 0,
      montant_vendu: map['montant_vendu']?.toInt() ?? 0,
      montant_cumule: map['montant_cumule']?.toInt() ?? 0,
      approvisionne: map['approvisionne'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory donnesBierresGrandModel.fromJson(String source) =>
      donnesBierresGrandModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'donnesBierresGrandModel(prix_unitaire: $prix_unitaire, quantite_initial: $quantite_initial, quantite_initial_cumule: $quantite_initial_cumule, quantite_physique: $quantite_physique, quantite_physique_cumule: $quantite_physique_cumule, seuil_approvisionnement: $seuil_approvisionnement, nom: $nom, type: $type, uid: $uid, prix_unitaire_achat: $prix_unitaire_achat, benefice: $benefice, benefice_cumule: $benefice_cumule, montant_vendu: $montant_vendu, montant_cumule: $montant_cumule, approvisionne: $approvisionne)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is donnesBierresGrandModel &&
        other.prix_unitaire == prix_unitaire &&
        other.quantite_initial == quantite_initial &&
        other.quantite_initial_cumule == quantite_initial_cumule &&
        other.quantite_physique == quantite_physique &&
        other.quantite_physique_cumule == quantite_physique_cumule &&
        other.seuil_approvisionnement == seuil_approvisionnement &&
        other.nom == nom &&
        other.type == type &&
        other.uid == uid &&
        other.prix_unitaire_achat == prix_unitaire_achat &&
        other.benefice == benefice &&
        other.benefice_cumule == benefice_cumule &&
        other.montant_vendu == montant_vendu &&
        other.montant_cumule == montant_cumule &&
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
        prix_unitaire_achat.hashCode ^
        benefice.hashCode ^
        benefice_cumule.hashCode ^
        montant_vendu.hashCode ^
        montant_cumule.hashCode ^
        approvisionne.hashCode;
  }

  donnesBierresGrandModel copyWith({
    int? prix_unitaire,
    int? quantite_initial,
    int? quantite_initial_cumule,
    int? quantite_physique,
    int? quantite_physique_cumule,
    int? seuil_approvisionnement,
    String? nom,
    String? type,
    String? uid,
    int? prix_unitaire_achat,
    int? benefice,
    int? benefice_cumule,
    int? montant_vendu,
    int? montant_cumule,
    bool? approvisionne,
  }) {
    return donnesBierresGrandModel(
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
      prix_unitaire_achat: prix_unitaire_achat ?? this.prix_unitaire_achat,
      benefice: benefice ?? this.benefice,
      benefice_cumule: benefice_cumule ?? this.benefice_cumule,
      montant_vendu: montant_vendu ?? this.montant_vendu,
      montant_cumule: montant_cumule ?? this.montant_cumule,
      approvisionne: approvisionne ?? this.approvisionne,
    );
  }
}

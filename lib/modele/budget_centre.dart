// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: camel_case_types

class budgetCentre {
  final int solde_total;
  final int depense;
  final String uid;
  final double benefice;
  final int pertes;
  budgetCentre({
    required this.solde_total,
    required this.depense,
    required this.uid,
    required this.benefice,
    required this.pertes,
  });

  factory budgetCentre.fromFirestore(DocumentSnapshot document) {
    return budgetCentre(
      pertes: (document.data() as Map)['perte'],
      benefice: (document.data() as Map)['benefice'],
      solde_total: (document.data() as Map)['solde_total'],
      depense: (document.data() as Map)['depense'],
      uid: document.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'solde_total': solde_total});
    result.addAll({'depense': depense});
    result.addAll({'uid': uid});
    result.addAll({'benefice': benefice});
    result.addAll({'pertes': pertes});

    return result;
  }

  factory budgetCentre.fromMap(Map<String, dynamic> map) {
    return budgetCentre(
      solde_total: map['solde_total']?.toInt() ?? 0,
      depense: map['depense']?.toInt() ?? 0,
      uid: map['uid'] ?? '',
      benefice: map['benefice']?.toDouble() ?? 0.0,
      pertes: map['pertes']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory budgetCentre.fromJson(String source) =>
      budgetCentre.fromMap(json.decode(source));

  @override
  String toString() {
    return 'budgetCentre(solde_total: $solde_total, depense: $depense, uid: $uid, benefice: $benefice, pertes: $pertes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is budgetCentre &&
        other.solde_total == solde_total &&
        other.depense == depense &&
        other.uid == uid &&
        other.benefice == benefice &&
        other.pertes == pertes;
  }

  @override
  int get hashCode {
    return solde_total.hashCode ^
        depense.hashCode ^
        uid.hashCode ^
        benefice.hashCode ^
        pertes.hashCode;
  }

  budgetCentre copyWith({
    int? solde_total,
    int? depense,
    String? uid,
    double? benefice,
    int? pertes,
  }) {
    return budgetCentre(
      solde_total: solde_total ?? this.solde_total,
      depense: depense ?? this.depense,
      uid: uid ?? this.uid,
      benefice: benefice ?? this.benefice,
      pertes: pertes ?? this.pertes,
    );
  }
}

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// ignore_for_file: camel_case_types

class materielCentre {
  final String uid;
  final String nom;
  final int nombre_initial;
  final int nombre_bon_etat;
  final String created_at;
  materielCentre({
    required this.uid,
    required this.nom,
    required this.nombre_initial,
    required this.nombre_bon_etat,
    required this.created_at,
  });

  factory materielCentre.FromFirestore(DocumentSnapshot document) {
    Timestamp dt = (document.data() as Map)['created_at'];
    return materielCentre(
        uid: document.id,
        nom: (document.data() as Map<String, dynamic>)['nom'],
        nombre_initial: (document.data() as Map)['nombre_initial'],
        nombre_bon_etat: (document.data() as Map)['nombre_bon_etat'],
        created_at: DateFormat("dd-MM-yyyy").format(dt.toDate()));
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'nombre_initial': nombre_initial});
    result.addAll({'nombre_bon_etat': nombre_bon_etat});
    result.addAll({'created_at': created_at});

    return result;
  }

  factory materielCentre.fromMap(Map<String, dynamic> map) {
    return materielCentre(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      nombre_initial: map['nombre_initial']?.toInt() ?? 0,
      nombre_bon_etat: map['nombre_bon_etat']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory materielCentre.fromJson(String source) =>
      materielCentre.fromMap(json.decode(source));

  @override
  String toString() {
    return 'materielCentre(uid: $uid, nom: $nom, nombre_initial: $nombre_initial, nombre_bon_etat: $nombre_bon_etat, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is materielCentre &&
        other.uid == uid &&
        other.nom == nom &&
        other.nombre_initial == nombre_initial &&
        other.nombre_bon_etat == nombre_bon_etat &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        nombre_initial.hashCode ^
        nombre_bon_etat.hashCode ^
        created_at.hashCode;
  }
}

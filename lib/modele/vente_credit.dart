// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// ignore_for_file: camel_case_types

class venteCredit {
  final String uid;
  final String nom;
  final int montant;
  final String date_vente_day;
  final String date_vente_month;
  final String date_vente;
  final double benefice;
  final int during;
  final String date_vente_annee;
  final String user_uid;
  venteCredit({
    required this.uid,
    required this.nom,
    required this.montant,
    required this.date_vente_day,
    required this.date_vente_month,
    required this.date_vente,
    required this.benefice,
    required this.during,
    required this.date_vente_annee,
    required this.user_uid,
  });

  factory venteCredit.fromFirestore(DocumentSnapshot snap) {
    final Timestamp dte = (snap.data() as Map)['derniere_vente'];
    return venteCredit(
      user_uid: (snap.data() as Map<String, dynamic>)['user_uid'],
      date_vente_annee: DateFormat('yyyy').format(dte.toDate()),
      during: dte.millisecondsSinceEpoch,
      benefice: (snap.data() as Map)['benefice'],
      date_vente_day: DateFormat('dd').format(dte.toDate()),
      date_vente_month: DateFormat('yyyy-MM').format(dte.toDate()),
      date_vente: DateFormat('yyyy-MM-dd').format(dte.toDate()),
      uid: snap.id,
      nom: (snap.data() as Map<String, dynamic>)['nom'],
      montant: (snap.data() as Map)['montant'],
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'montant': montant});
    result.addAll({'date_vente_day': date_vente_day});
    result.addAll({'date_vente_month': date_vente_month});
    result.addAll({'date_vente': date_vente});
    result.addAll({'benefice': benefice});
    result.addAll({'during': during});
    result.addAll({'date_vente_annee': date_vente_annee});
    result.addAll({'user_uid': user_uid});

    return result;
  }

  factory venteCredit.fromMap(Map<String, dynamic> map) {
    return venteCredit(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      montant: map['montant']?.toInt() ?? 0,
      date_vente_day: map['date_vente_day'] ?? '',
      date_vente_month: map['date_vente_month'] ?? '',
      date_vente: map['date_vente'] ?? '',
      benefice: map['benefice']?.toDouble() ?? 0.0,
      during: map['during']?.toInt() ?? 0,
      date_vente_annee: map['date_vente_annee'] ?? '',
      user_uid: map['user_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory venteCredit.fromJson(String source) =>
      venteCredit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'venteCredit(uid: $uid, nom: $nom, montant: $montant, date_vente_day: $date_vente_day, date_vente_month: $date_vente_month, date_vente: $date_vente, benefice: $benefice, during: $during, date_vente_annee: $date_vente_annee, user_uid: $user_uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is venteCredit &&
        other.uid == uid &&
        other.nom == nom &&
        other.montant == montant &&
        other.date_vente_day == date_vente_day &&
        other.date_vente_month == date_vente_month &&
        other.date_vente == date_vente &&
        other.benefice == benefice &&
        other.during == during &&
        other.date_vente_annee == date_vente_annee &&
        other.user_uid == user_uid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        montant.hashCode ^
        date_vente_day.hashCode ^
        date_vente_month.hashCode ^
        date_vente.hashCode ^
        benefice.hashCode ^
        during.hashCode ^
        date_vente_annee.hashCode ^
        user_uid.hashCode;
  }
}

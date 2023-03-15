// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// ignore_for_file: camel_case_types

class venteteeshirts {
  final String uid;
  final int quantite;
  final int montant;
  final String nom_tee_shirts;
  final int during_date;
  final String date_vente;
  final String date_vente_day;
  final String date_vente_month;
  final int benefice;
  final String date_vente_annee;
  final String user_uid;
  venteteeshirts({
    required this.uid,
    required this.quantite,
    required this.montant,
    required this.nom_tee_shirts,
    required this.during_date,
    required this.date_vente,
    required this.date_vente_day,
    required this.date_vente_month,
    required this.benefice,
    required this.date_vente_annee,
    required this.user_uid,
  });

  factory venteteeshirts.fromfirestore(DocumentSnapshot document) {
    final Timestamp dte = (document.data() as Map)['derniere_vente'];
    return venteteeshirts(
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        date_vente_annee: DateFormat("yyyy").format(dte.toDate()),
        during_date: dte.millisecondsSinceEpoch,
        benefice: (document.data() as Map)['benefice'],
        date_vente: DateFormat('yyyy-MM-dd').format(dte.toDate()),
        date_vente_day: DateFormat('dd').format(dte.toDate()),
        date_vente_month: DateFormat('yyyy-MM').format(dte.toDate()),
        uid: document.id,
        nom_tee_shirts: (document.data() as Map<String, dynamic>)['nom'],
        quantite: (document.data() as Map)['quantite'],
        montant: (document.data() as Map)['montant']);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'quantite': quantite});
    result.addAll({'montant': montant});
    result.addAll({'nom_tee_shirts': nom_tee_shirts});
    result.addAll({'during_date': during_date});
    result.addAll({'date_vente': date_vente});
    result.addAll({'date_vente_day': date_vente_day});
    result.addAll({'date_vente_month': date_vente_month});
    result.addAll({'benefice': benefice});
    result.addAll({'date_vente_annee': date_vente_annee});
    result.addAll({'user_uid': user_uid});

    return result;
  }

  factory venteteeshirts.fromMap(Map<String, dynamic> map) {
    return venteteeshirts(
      uid: map['uid'] ?? '',
      quantite: map['quantite']?.toInt() ?? 0,
      montant: map['montant']?.toInt() ?? 0,
      nom_tee_shirts: map['nom_tee_shirts'] ?? '',
      during_date: map['during_date']?.toInt() ?? 0,
      date_vente: map['date_vente'] ?? '',
      date_vente_day: map['date_vente_day'] ?? '',
      date_vente_month: map['date_vente_month'] ?? '',
      benefice: map['benefice']?.toInt() ?? 0,
      date_vente_annee: map['date_vente_annee'] ?? '',
      user_uid: map['user_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory venteteeshirts.fromJson(String source) =>
      venteteeshirts.fromMap(json.decode(source));

  @override
  String toString() {
    return 'venteteeshirts(uid: $uid, quantite: $quantite, montant: $montant, nom_tee_shirts: $nom_tee_shirts, during_date: $during_date, date_vente: $date_vente, date_vente_day: $date_vente_day, date_vente_month: $date_vente_month, benefice: $benefice, date_vente_annee: $date_vente_annee, user_uid: $user_uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is venteteeshirts &&
        other.uid == uid &&
        other.quantite == quantite &&
        other.montant == montant &&
        other.nom_tee_shirts == nom_tee_shirts &&
        other.during_date == during_date &&
        other.date_vente == date_vente &&
        other.date_vente_day == date_vente_day &&
        other.date_vente_month == date_vente_month &&
        other.benefice == benefice &&
        other.date_vente_annee == date_vente_annee &&
        other.user_uid == user_uid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        quantite.hashCode ^
        montant.hashCode ^
        nom_tee_shirts.hashCode ^
        during_date.hashCode ^
        date_vente.hashCode ^
        date_vente_day.hashCode ^
        date_vente_month.hashCode ^
        benefice.hashCode ^
        date_vente_annee.hashCode ^
        user_uid.hashCode;
  }
}

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// ignore_for_file: camel_case_types

class ventePetitModele {
  final String uid;
  final int quantite;
  final int montant;
  final String nom_bierre;
  final String category;
  final int during;
  final String date_vente_day;
  final String date_vente;
  final String date_vente_month;
  final int benefice;
  final String date_vente_annee;
  final String user_uid;
  ventePetitModele({
    required this.uid,
    required this.quantite,
    required this.montant,
    required this.nom_bierre,
    required this.category,
    required this.during,
    required this.date_vente_day,
    required this.date_vente,
    required this.date_vente_month,
    required this.benefice,
    required this.date_vente_annee,
    required this.user_uid,
  });

  factory ventePetitModele.fromFirestore(DocumentSnapshot document) {
    final Timestamp dte = (document.data() as Map)['time'];
    return ventePetitModele(
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        date_vente_annee: DateFormat("yyyy").format(dte.toDate()),
        during: dte.millisecondsSinceEpoch,
        benefice: (document.data() as Map)['benefice'],
        date_vente_day: DateFormat('dd').format(dte.toDate()),
        date_vente_month: DateFormat('yyyy-MM').format(dte.toDate()),
        date_vente: DateFormat('yyyy-MM-dd').format(dte.toDate()),
        nom_bierre: (document.data() as Map)['nom_bierre'],
        category: (document.data() as Map)['type'],
        quantite: (document.data() as Map)['quantite'],
        montant: (document.data() as Map)['montant'],
        uid: document.id);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'quantite': quantite});
    result.addAll({'montant': montant});
    result.addAll({'nom_bierre': nom_bierre});
    result.addAll({'category': category});
    result.addAll({'during': during});
    result.addAll({'date_vente_day': date_vente_day});
    result.addAll({'date_vente': date_vente});
    result.addAll({'date_vente_month': date_vente_month});
    result.addAll({'benefice': benefice});
    result.addAll({'date_vente_annee': date_vente_annee});
    result.addAll({'user_uid': user_uid});

    return result;
  }

  factory ventePetitModele.fromMap(Map<String, dynamic> map) {
    return ventePetitModele(
      uid: map['uid'] ?? '',
      quantite: map['quantite']?.toInt() ?? 0,
      montant: map['montant']?.toInt() ?? 0,
      nom_bierre: map['nom_bierre'] ?? '',
      category: map['category'] ?? '',
      during: map['during']?.toInt() ?? 0,
      date_vente_day: map['date_vente_day'] ?? '',
      date_vente: map['date_vente'] ?? '',
      date_vente_month: map['date_vente_month'] ?? '',
      benefice: map['benefice']?.toInt() ?? 0,
      date_vente_annee: map['date_vente_annee'] ?? '',
      user_uid: map['user_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ventePetitModele.fromJson(String source) =>
      ventePetitModele.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ventePetitModele(uid: $uid, quantite: $quantite, montant: $montant, nom_bierre: $nom_bierre, category: $category, during: $during, date_vente_day: $date_vente_day, date_vente: $date_vente, date_vente_month: $date_vente_month, benefice: $benefice, date_vente_annee: $date_vente_annee, user_uid: $user_uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ventePetitModele &&
        other.uid == uid &&
        other.quantite == quantite &&
        other.montant == montant &&
        other.nom_bierre == nom_bierre &&
        other.category == category &&
        other.during == during &&
        other.date_vente_day == date_vente_day &&
        other.date_vente == date_vente &&
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
        nom_bierre.hashCode ^
        category.hashCode ^
        during.hashCode ^
        date_vente_day.hashCode ^
        date_vente.hashCode ^
        date_vente_month.hashCode ^
        benefice.hashCode ^
        date_vente_annee.hashCode ^
        user_uid.hashCode;
  }
}

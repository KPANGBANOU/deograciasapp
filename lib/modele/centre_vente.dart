// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// ignore_for_file: camel_case_types

class centreVente {
  final String uid;
  final String nom_produit;
  final int quantite;
  final int montant;
  final String date_vente;
  final String vente_day;
  final String vente_month;
  final int benefice;
  final int during_date;
  final String date_vente_annee;
  final String user_uid;
  centreVente({
    required this.uid,
    required this.nom_produit,
    required this.quantite,
    required this.montant,
    required this.date_vente,
    required this.vente_day,
    required this.vente_month,
    required this.benefice,
    required this.during_date,
    required this.date_vente_annee,
    required this.user_uid,
  });

  factory centreVente.fromfirestore(DocumentSnapshot doc) {
    final Timestamp dte = (doc.data() as Map)['derniere_vente'];
    return centreVente(
        user_uid: (doc.data() as Map<String, dynamic>)['user_uid'],
        date_vente_annee: DateFormat("yyyy").format(dte.toDate()),
        during_date: dte.millisecondsSinceEpoch,
        benefice: (doc.data() as Map)['benefice'],
        date_vente: DateFormat('yyyy-MM-dd').format(dte.toDate()),
        vente_day: DateFormat('dd').format(dte.toDate()),
        vente_month: DateFormat('yyyy-MM').format(dte.toDate()),
        uid: doc.id,
        nom_produit: (doc.data() as Map<String, dynamic>)['nom'],
        quantite: (doc.data() as Map)['quantite'],
        montant: (doc.data() as Map)['montant']);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom_produit': nom_produit});
    result.addAll({'quantite': quantite});
    result.addAll({'montant': montant});
    result.addAll({'date_vente': date_vente});
    result.addAll({'vente_day': vente_day});
    result.addAll({'vente_month': vente_month});
    result.addAll({'benefice': benefice});
    result.addAll({'during_date': during_date});
    result.addAll({'date_vente_annee': date_vente_annee});
    result.addAll({'user_uid': user_uid});

    return result;
  }

  factory centreVente.fromMap(Map<String, dynamic> map) {
    return centreVente(
      uid: map['uid'] ?? '',
      nom_produit: map['nom_produit'] ?? '',
      quantite: map['quantite']?.toInt() ?? 0,
      montant: map['montant']?.toInt() ?? 0,
      date_vente: map['date_vente'] ?? '',
      vente_day: map['vente_day'] ?? '',
      vente_month: map['vente_month'] ?? '',
      benefice: map['benefice']?.toInt() ?? 0,
      during_date: map['during_date']?.toInt() ?? 0,
      date_vente_annee: map['date_vente_annee'] ?? '',
      user_uid: map['user_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory centreVente.fromJson(String source) =>
      centreVente.fromMap(json.decode(source));

  @override
  String toString() {
    return 'centreVente(uid: $uid, nom_produit: $nom_produit, quantite: $quantite, montant: $montant, date_vente: $date_vente, vente_day: $vente_day, vente_month: $vente_month, benefice: $benefice, during_date: $during_date, date_vente_annee: $date_vente_annee, user_uid: $user_uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is centreVente &&
        other.uid == uid &&
        other.nom_produit == nom_produit &&
        other.quantite == quantite &&
        other.montant == montant &&
        other.date_vente == date_vente &&
        other.vente_day == vente_day &&
        other.vente_month == vente_month &&
        other.benefice == benefice &&
        other.during_date == during_date &&
        other.date_vente_annee == date_vente_annee &&
        other.user_uid == user_uid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom_produit.hashCode ^
        quantite.hashCode ^
        montant.hashCode ^
        date_vente.hashCode ^
        vente_day.hashCode ^
        vente_month.hashCode ^
        benefice.hashCode ^
        during_date.hashCode ^
        date_vente_annee.hashCode ^
        user_uid.hashCode;
  }

  centreVente copyWith({
    String? uid,
    String? nom_produit,
    int? quantite,
    int? montant,
    String? date_vente,
    String? vente_day,
    String? vente_month,
    int? benefice,
    int? during_date,
    String? date_vente_annee,
    String? user_uid,
  }) {
    return centreVente(
      uid: uid ?? this.uid,
      nom_produit: nom_produit ?? this.nom_produit,
      quantite: quantite ?? this.quantite,
      montant: montant ?? this.montant,
      date_vente: date_vente ?? this.date_vente,
      vente_day: vente_day ?? this.vente_day,
      vente_month: vente_month ?? this.vente_month,
      benefice: benefice ?? this.benefice,
      during_date: during_date ?? this.during_date,
      date_vente_annee: date_vente_annee ?? this.date_vente_annee,
      user_uid: user_uid ?? this.user_uid,
    );
  }
}

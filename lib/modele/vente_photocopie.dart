// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class VentePhotocopies {
  final String uid;
  final String user_uid;
  final String photocopie_uid;
  final String created_at;
  final String annee;
  final int crated_at_in_days;
  final int nombre;
  final int montant;
  final String date_vente_month;
  final int benefice;
  VentePhotocopies({
    required this.uid,
    required this.user_uid,
    required this.photocopie_uid,
    required this.created_at,
    required this.annee,
    required this.crated_at_in_days,
    required this.nombre,
    required this.montant,
    required this.date_vente_month,
    required this.benefice,
  });

  factory VentePhotocopies.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    return VentePhotocopies(
        benefice: (document.data() as Map)['benefice'],
        date_vente_month: DateFormat("yyyy-MM").format(created.toDate()),
        uid: document.id,
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        photocopie_uid:
            (document.data() as Map<String, dynamic>)['photocopie_uid'],
        created_at: DateFormat("yyyy-MM-dd").format(created.toDate()),
        annee: DateFormat("yyyy").format(created.toDate()),
        crated_at_in_days: created.millisecondsSinceEpoch,
        nombre: (document.data() as Map)['nombre'],
        montant: (document.data() as Map)['montant']);
  }

  VentePhotocopies copyWith({
    String? uid,
    String? user_uid,
    String? photocopie_uid,
    String? created_at,
    String? annee,
    int? crated_at_in_days,
    int? nombre,
    int? montant,
    String? date_vente_month,
    int? benefice,
  }) {
    return VentePhotocopies(
      uid: uid ?? this.uid,
      user_uid: user_uid ?? this.user_uid,
      photocopie_uid: photocopie_uid ?? this.photocopie_uid,
      created_at: created_at ?? this.created_at,
      annee: annee ?? this.annee,
      crated_at_in_days: crated_at_in_days ?? this.crated_at_in_days,
      nombre: nombre ?? this.nombre,
      montant: montant ?? this.montant,
      date_vente_month: date_vente_month ?? this.date_vente_month,
      benefice: benefice ?? this.benefice,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'photocopie_uid': photocopie_uid});
    result.addAll({'created_at': created_at});
    result.addAll({'annee': annee});
    result.addAll({'crated_at_in_days': crated_at_in_days});
    result.addAll({'nombre': nombre});
    result.addAll({'montant': montant});
    result.addAll({'date_vente_month': date_vente_month});
    result.addAll({'benefice': benefice});

    return result;
  }

  factory VentePhotocopies.fromMap(Map<String, dynamic> map) {
    return VentePhotocopies(
      uid: map['uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      photocopie_uid: map['photocopie_uid'] ?? '',
      created_at: map['created_at'] ?? '',
      annee: map['annee'] ?? '',
      crated_at_in_days: map['crated_at_in_days']?.toInt() ?? 0,
      nombre: map['nombre']?.toInt() ?? 0,
      montant: map['montant']?.toInt() ?? 0,
      date_vente_month: map['date_vente_month'] ?? '',
      benefice: map['benefice']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory VentePhotocopies.fromJson(String source) =>
      VentePhotocopies.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VentePhotocopies(uid: $uid, user_uid: $user_uid, photocopie_uid: $photocopie_uid, created_at: $created_at, annee: $annee, crated_at_in_days: $crated_at_in_days, nombre: $nombre, montant: $montant, date_vente_month: $date_vente_month, benefice: $benefice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VentePhotocopies &&
        other.uid == uid &&
        other.user_uid == user_uid &&
        other.photocopie_uid == photocopie_uid &&
        other.created_at == created_at &&
        other.annee == annee &&
        other.crated_at_in_days == crated_at_in_days &&
        other.nombre == nombre &&
        other.montant == montant &&
        other.date_vente_month == date_vente_month &&
        other.benefice == benefice;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        user_uid.hashCode ^
        photocopie_uid.hashCode ^
        created_at.hashCode ^
        annee.hashCode ^
        crated_at_in_days.hashCode ^
        nombre.hashCode ^
        montant.hashCode ^
        date_vente_month.hashCode ^
        benefice.hashCode;
  }
}

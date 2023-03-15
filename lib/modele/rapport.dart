// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// ignore_for_file: camel_case_types

class rapport {
  final String email_rapport;

  final String uid;
  final String user_nom;
  final String user_prenom;
  final String user_uid;
  final String update_date;
  final int numero_rapport;
  rapport({
    required this.email_rapport,
    required this.uid,
    required this.user_nom,
    required this.user_prenom,
    required this.user_uid,
    required this.update_date,
    required this.numero_rapport,
  });

  factory rapport.fromfirestore(DocumentSnapshot document) {
    final Timestamp dt = (document.data() as Map)['updated_at'];
    return rapport(
        update_date: DateFormat("dd-MM-yyyy").format(dt.toDate()),
        user_nom: (document.data() as Map<String, dynamic>)['user_nom'],
        user_prenom: (document.data() as Map)['user_prenom'],
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        email_rapport: (document.data() as Map<String, dynamic>)['email'],
        numero_rapport: (document.data() as Map)['numero'],
        uid: document.id);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email_rapport': email_rapport});
    result.addAll({'uid': uid});
    result.addAll({'user_nom': user_nom});
    result.addAll({'user_prenom': user_prenom});
    result.addAll({'user_uid': user_uid});
    result.addAll({'update_date': update_date});
    result.addAll({'numero_rapport': numero_rapport});

    return result;
  }

  factory rapport.fromMap(Map<String, dynamic> map) {
    return rapport(
      email_rapport: map['email_rapport'] ?? '',
      uid: map['uid'] ?? '',
      user_nom: map['user_nom'] ?? '',
      user_prenom: map['user_prenom'] ?? '',
      user_uid: map['user_uid'] ?? '',
      update_date: map['update_date'] ?? '',
      numero_rapport: map['numero_rapport']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory rapport.fromJson(String source) =>
      rapport.fromMap(json.decode(source));

  @override
  String toString() {
    return 'rapport(email_rapport: $email_rapport, uid: $uid, user_nom: $user_nom, user_prenom: $user_prenom, user_uid: $user_uid, update_date: $update_date, numero_rapport: $numero_rapport)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is rapport &&
        other.email_rapport == email_rapport &&
        other.uid == uid &&
        other.user_nom == user_nom &&
        other.user_prenom == user_prenom &&
        other.user_uid == user_uid &&
        other.update_date == update_date &&
        other.numero_rapport == numero_rapport;
  }

  @override
  int get hashCode {
    return email_rapport.hashCode ^
        uid.hashCode ^
        user_nom.hashCode ^
        user_prenom.hashCode ^
        user_uid.hashCode ^
        update_date.hashCode ^
        numero_rapport.hashCode;
  }
}

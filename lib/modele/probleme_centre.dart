// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// ignore_for_file: camel_case_types

class problemeCentre {
  final String uid;
  final String description;
  final String date;
  final String user_nom;
  final String user_prenom;
  final String user_uid;
  final String numero;
  final String numero_watsapp;
  problemeCentre({
    required this.uid,
    required this.description,
    required this.date,
    required this.user_nom,
    required this.user_prenom,
    required this.user_uid,
    required this.numero,
    required this.numero_watsapp,
  });

  factory problemeCentre.fromFirestore(DocumentSnapshot document) {
    final Timestamp dte = (document.data() as Map)['created_at'];
    return problemeCentre(
      numero: (document.data() as Map<String, dynamic>)['numero'],
      numero_watsapp:
          (document.data() as Map<String, dynamic>)['numero_watsapp'],
      user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
      date: DateFormat('yyyy-MM-dd').format(dte.toDate()),
      user_nom: (document.data() as Map<String, dynamic>)['user_nom'],
      user_prenom: (document.data() as Map<String, dynamic>)['user_prenom'],
      uid: document.id,
      description: (document.data() as Map<String, dynamic>)['description'],
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'description': description});
    result.addAll({'date': date});
    result.addAll({'user_nom': user_nom});
    result.addAll({'user_prenom': user_prenom});
    result.addAll({'user_uid': user_uid});
    result.addAll({'numero': numero});
    result.addAll({'numero_watsapp': numero_watsapp});

    return result;
  }

  factory problemeCentre.fromMap(Map<String, dynamic> map) {
    return problemeCentre(
      uid: map['uid'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      user_nom: map['user_nom'] ?? '',
      user_prenom: map['user_prenom'] ?? '',
      user_uid: map['user_uid'] ?? '',
      numero: map['numero'] ?? '',
      numero_watsapp: map['numero_watsapp'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory problemeCentre.fromJson(String source) =>
      problemeCentre.fromMap(json.decode(source));

  @override
  String toString() {
    return 'problemeCentre(uid: $uid, description: $description, date: $date, user_nom: $user_nom, user_prenom: $user_prenom, user_uid: $user_uid, numero: $numero, numero_watsapp: $numero_watsapp)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is problemeCentre &&
        other.uid == uid &&
        other.description == description &&
        other.date == date &&
        other.user_nom == user_nom &&
        other.user_prenom == user_prenom &&
        other.user_uid == user_uid &&
        other.numero == numero &&
        other.numero_watsapp == numero_watsapp;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        description.hashCode ^
        date.hashCode ^
        user_nom.hashCode ^
        user_prenom.hashCode ^
        user_uid.hashCode ^
        numero.hashCode ^
        numero_watsapp.hashCode;
  }
}

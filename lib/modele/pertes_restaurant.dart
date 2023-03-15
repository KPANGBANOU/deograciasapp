// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class pertesbar {
  String uid;
  String user_uid;
  String created_at;
  String created_at_heure;
  String description;
  int montant;
  pertesbar({
    required this.uid,
    required this.user_uid,
    required this.created_at,
    required this.created_at_heure,
    required this.description,
    required this.montant,
  });

  factory pertesbar.fromFirestore(DocumentSnapshot document) {
    Timestamp dt = (document.data() as Map)['created_at'];
    return pertesbar(
      user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
      uid: document.id,
      description: (document.data() as Map<String, dynamic>)['description'],
      montant: (document.data() as Map)['montant'],
      created_at: DateFormat("dd-MM-yyyy").format(dt.toDate()),
      created_at_heure: DateFormat("HH:mm:ss").format(dt.toDate()),
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'created_at': created_at});
    result.addAll({'created_at_heure': created_at_heure});
    result.addAll({'description': description});
    result.addAll({'montant': montant});

    return result;
  }

  factory pertesbar.fromMap(Map<String, dynamic> map) {
    return pertesbar(
      uid: map['uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      created_at: map['created_at'] ?? '',
      created_at_heure: map['created_at_heure'] ?? '',
      description: map['description'] ?? '',
      montant: map['montant']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory pertesbar.fromJson(String source) =>
      pertesbar.fromMap(json.decode(source));

  @override
  String toString() {
    return 'pertesbar(uid: $uid, user_uid: $user_uid, created_at: $created_at, created_at_heure: $created_at_heure, description: $description, montant: $montant)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is pertesbar &&
        other.uid == uid &&
        other.user_uid == user_uid &&
        other.created_at == created_at &&
        other.created_at_heure == created_at_heure &&
        other.description == description &&
        other.montant == montant;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        user_uid.hashCode ^
        created_at.hashCode ^
        created_at_heure.hashCode ^
        description.hashCode ^
        montant.hashCode;
  }

  pertesbar copyWith({
    String? uid,
    String? user_uid,
    String? created_at,
    String? created_at_heure,
    String? description,
    int? montant,
  }) {
    return pertesbar(
      uid: uid ?? this.uid,
      user_uid: user_uid ?? this.user_uid,
      created_at: created_at ?? this.created_at,
      created_at_heure: created_at_heure ?? this.created_at_heure,
      description: description ?? this.description,
      montant: montant ?? this.montant,
    );
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../modele/pertes_restaurant.dart';
import 'perte_bar.dart';

class StreamPerteBar extends StatelessWidget {
  const StreamPerteBar({
    key,
    required this.perte_uid,
    required this.user_uid,
  }) : super(key: key);

  final String perte_uid;
  final String user_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().pertes_du_bar(perte_uid)),
            initialData: pertesbar(
                uid: "",
                user_uid: user_uid,
                created_at: "",
                created_at_heure: "",
                description: "",
                montant: 0)),
        StreamProvider(
            create: (context) => context.read<serviceBD>().donnes(user_uid),
            initialData: donnesUtilisateur(
                nom: "",
                prenom: "",
                email: "",
                telephone: "",
                role: "",
                sexe: "",
                date_naissance: "",
                uid: "",
                domaine: "",
                photo_url: "",
                admin: false,
                is_active: true,
                mdp: "",
                date_inscription: "",
                deleted: false))
      ],
      child: PerteBar(),
    );
  }
}

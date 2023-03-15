// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:deogracias/interface/centre_informatique/credit_employe_centre_gerant.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../modele/credits_vente.dart';

class StreamCreditEmployeCentreGerant extends StatelessWidget {
  StreamCreditEmployeCentreGerant({
    Key? key,
    required this.credit_uid,
    required this.user_uid,
  }) : super(key: key);

  final String credit_uid;
  final String user_uid;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().vente_a_credit_centre(credit_uid)),
            initialData: VenteACreditsCentre(
                uid: "",
                nom_client: "",
                achat_effectue: "",
                description: "",
                created_at: "",
                created_at_heure: "",
                updated_at: "",
                updated_at_heure: "",
                montant: 0,
                paye: false,
                user_uid: "")),
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
      child: CreditEmployeCentreGerant(),
    );
  }
}

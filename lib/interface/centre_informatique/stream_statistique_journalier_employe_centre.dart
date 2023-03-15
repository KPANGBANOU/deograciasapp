// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:deogracias/modele/vente_photocopie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../modele/centre_vente.dart';
import '../../modele/donnesservants.dart';
import '../../modele/vente_credit.dart';
import 'statistique_journalier_employe_centre.dart';
import 'vente_tee_shirt.dart';

class StreamStatistiqueJournalierEmployeCentre extends StatelessWidget {
  StreamStatistiqueJournalierEmployeCentre({
    Key? key,
    required this.uid,
  }) : super(key: key);

  final String uid;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: ((context) => context.read<serviceBD>().servant_data(uid)),
            initialData: donnesServants(
                deleted: false,
                nom: "",
                prenom: "",
                email: "",
                telephone: "",
                role: "",
                sexe: "",
                date_naissance: "",
                uid: uid,
                domaine: "",
                photo_url: "",
                admin: false,
                is_active: true,
                mdp: "",
                date_inscription: "")),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().list_vente_credits(uid)),
            initialData: <venteCredit>[]),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().centre_list_vente_produits(uid)),
            initialData: <centreVente>[]),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().list_vente_tee_shirt(uid)),
            initialData: <VenteTeeShirt>[]),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_des_ventes_de_photocopies,
            initialData: <VentePhotocopies>[])
      ],
      child: StatistiqueJournalierEmployeCentre(),
    );
  }
}

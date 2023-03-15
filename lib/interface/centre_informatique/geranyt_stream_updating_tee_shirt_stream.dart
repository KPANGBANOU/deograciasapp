// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../modele/serigraphie.dart';
import 'update_tee_shirt_gerant.dart';

class GerantUpdatingTeeShirtStream extends StatelessWidget {
  GerantUpdatingTeeShirtStream({
    Key? key,
    required this.tee_shirt_uid,
  }) : super(key: key);

  final String tee_shirt_uid;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().tee_shirt(tee_shirt_uid)),
            initialData: serigraphie(
                quantite_initial_cumule: 0,
                quantite_physique_cumule: 0,
                montant_vendu_cumule: 0,
                benefice_cumule: 0,
                approvisionne: true,
                qualite: "",
                montant_vendu: 0,
                prix_unitaire_achat: 0,
                benefice: 0,
                uid: tee_shirt_uid,
                tee_shirt_nom: "",
                quantite_initial: 0,
                quantite_physique: 0,
                seuil_approvisionnement: 0,
                prix_unitaire_vente: 0)),
      ],
      child: UpdateTeeShirtGerant(),
    );
  }
}

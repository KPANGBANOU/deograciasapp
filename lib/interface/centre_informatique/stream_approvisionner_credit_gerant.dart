// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../modele/credit.dart';
import 'centre_approvisionnement_credit_gerant.dart';

class StreamApprovisionnerCreditGerant extends StatelessWidget {
  StreamApprovisionnerCreditGerant({
    Key? key,
    required this.credit_uid,
  }) : super(key: key);

  final String credit_uid;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().reseau_credit(credit_uid)),
            initialData: credit(
                montant_disponible_cumule: 0,
                montant_initial_cumule: 0,
                benefice_cumule: 0,
                approvisionne: true,
                benefice_sur_5000: 0,
                benefice: 0,
                uid: credit_uid,
                nom: "",
                montant_initial: 0,
                montant_disponible: 0,
                seuil_approvisionnement: 0)),
      ],
      child: CentreApprovisionnementCreditGerant(),
    );
  }
}

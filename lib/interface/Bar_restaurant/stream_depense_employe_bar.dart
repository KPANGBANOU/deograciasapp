// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../modele/depense.dart';
import 'depense_employe_bar.dart';

class StreamDepenseEmployeBar extends StatelessWidget {
  StreamDepenseEmployeBar({
    Key? key,
    required this.depense_uid,
  }) : super(key: key);

  final String depense_uid;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().depenses_bar(depense_uid)),
            initialData: donnesDepense(
                numero: "",
                numero_watsapp: "",
                uid: depense_uid,
                description: "",
                montant: 0,
                date: "",
                user_nom: "",
                user_prenom: "",
                user_uid: "")),
      ],
      child: DepenseEmployeBar(),
    );
  }
}

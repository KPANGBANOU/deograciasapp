// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../modele/credits_vente.dart';
import 'centre_credit_client.dart';

class StreamCreditClient extends StatelessWidget {
  StreamCreditClient({
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
      ],
      child: CentreCreditClient(),
    );
  }
}

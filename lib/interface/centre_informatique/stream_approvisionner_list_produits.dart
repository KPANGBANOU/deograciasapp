// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../modele/produit.dart';
import 'centre_approvisionner_list_produits.dart';

class StreamApprovisionnerListProduits extends StatelessWidget {
  StreamApprovisionnerListProduits({
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().list_produits_centre),
            initialData: <products>[]),
      ],
      child: CentreApprovisionnerListProduits(),
    );
  }
}

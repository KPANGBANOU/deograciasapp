// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../modele/produit.dart';
import 'centre_stock_physique_produit_gerant.dart';

class StreamStockPhysiqueProduitGerant extends StatelessWidget {
  StreamStockPhysiqueProduitGerant({
    Key? key,
    required this.produit_uid,
  }) : super(key: key);

  final String produit_uid;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().produit_centre(produit_uid)),
            initialData: products(
                quantite_initial_cumule: 0,
                quantite_physique_cumule: 0,
                montant_vendu_cumule: 0,
                benefice_cumule: 0,
                approvisionne: true,
                montant_vendu: 0,
                prix_unitaire_achat: 0,
                benefice: 0,
                uid: produit_uid,
                prix_unitaire: 0,
                nom: "",
                quantite_initial: 0,
                quantite_physique: 0,
                seuil_approvisionnement: 0)),
      ],
      child: CentreStocjPhysiqueProduitGerant(),
    );
  }
}

// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, unnecessary_this, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../modele/bieere_petit_model.dart';
import 'vendre_petit_modele.dart';

class StreamVentePetitModele extends StatelessWidget {
  StreamVentePetitModele({
    Key? key,
    required this.uid,
    required this.quantite_disponible,
  }) : super(key: key);
  final String uid;
  final int quantite_disponible;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<serviceBD>(create: (_) => serviceBD()),
          StreamProvider(
              create: ((context) =>
                  context.read<serviceBD>().bierreData(this.uid)),
              initialData: donneesBieerePetitModele(
                  quantite_initial_cumule: 0,
                  quantite_physique_cumule: 0,
                  benefice_cumule: 0,
                  montant_vendu_cumule: 0,
                  approvisionne: true,
                  montant_vendu: 0,
                  benefice: 0,
                  prix_unitaire_achat: 0,
                  prix_unitaire: 0,
                  quantite_initial: 0,
                  quantite_physique: 0,
                  seuil_approvisionnement: 0,
                  nom: "",
                  type: "",
                  uid: this.uid))
        ],
        child: VentePetitModele(
          quantite_disponible: quantite_disponible,
        ));
  }
}

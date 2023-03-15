// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../modele/matriel_centre.dart';
import 'signaler_materiel_centre_gerant.dart';

class StreamSignalerMaterielCentreGerant extends StatelessWidget {
  StreamSignalerMaterielCentreGerant({
    Key? key,
    required this.materiel_uid,
  }) : super(key: key);

  final String materiel_uid;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_literals_to_create_immutables
    return MultiProvider(
      providers: [
        Provider(create: (_) => serviceBD()),
        StreamProvider(
            create: ((context) =>
                context.read<serviceBD>().matriel_centre(materiel_uid)),
            initialData: materielCentre(
                uid: materiel_uid,
                nom: "",
                nombre_initial: 0,
                nombre_bon_etat: 0,
                created_at: ""))
      ],
      child: SignalerMaterielCentreGerant(),
    );
  }
}

// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, unnecessary_this, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base_donne/servicebasededonnees.dart';
import '../modele/donnesservants.dart';
import 'accoder_droits_second_page.dart';

class StreamAccorderDroitsEmployes extends StatelessWidget {
  StreamAccorderDroitsEmployes({
    Key? key,
    required this.uid,
    required this.user_password,
  }) : super(key: key);

  final String uid;
  final String user_password;
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
      ],
      child: AccorderDroitsSecondPages(
        user_password: user_password,
      ),
    );
  }
}

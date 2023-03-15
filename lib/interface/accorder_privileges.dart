// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, must_be_immutable, unused_field, prefer_final_fields, import_of_legacy_library_into_null_safe, use_build_context_synchronously, unused_local_variable, no_leading_underscores_for_local_identifie, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, avoid_print
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/privileges.dart';
import '../provider/serac.dart';
import '../services/user.dart';
import 'drawer.dart';

class AccorderPrivileges extends StatelessWidget {
  AccorderPrivileges({
    Key? key,
    required this.user_uid,
    required this.nom_employe,
    required this.prenom_employe,
    required this.user_password,
  }) : super(key: key);
  final String user_uid;
  final String nom_employe;
  final String prenom_employe;
  final String user_password;
  String role = "";
  String domaine = "";
  TextEditingController _mot_de_passe = TextEditingController();
  String _password = "";
  bool affiche = false;
  bool afficher = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<privileges>(context);
    final _user = Provider.of<donnesUtilisateur>(context);
    final _affiche = Provider.of<Search>(context);
    affiche = _affiche.val;
    role = provider.role;
    domaine = provider.domaine;
    afficher = provider.affiche;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerHome(),
      appBar: AppBar(
        actions: [
          Image.asset(
            "images/icon.jpeg",
            height: 60,
            width: 60,
            scale: 2.5,
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Droits d'usage",
          style: GoogleFonts.alike(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("images/services.jpeg"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Droits d'usage de l'application",
              textAlign: TextAlign.center,
              style: GoogleFonts.alike(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  height: 15,
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Dans quel domaine de l'entreprise doit travailler " +
                    prenom_employe +
                    " " +
                    nom_employe +
                    " ?",
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RadioListTile(
              title: Text(
                "Centre informatique".toUpperCase(),
                style: GoogleFonts.alike(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              value: "Centre informatique",
              groupValue: domaine,
              onChanged: (value) {
                provider.changedomaine(value!);
              },
            ),
            SizedBox(
              height: 10,
            ),
            RadioListTile(
              title: Text(
                "Bar restaurant".toUpperCase(),
                style: GoogleFonts.alike(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              value: "Bar restaurant",
              groupValue: domaine,
              onChanged: (value) {
                provider.changedomaine(value!);
              },
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Quel est le rôle de " +
                    prenom_employe +
                    " " +
                    nom_employe +
                    " ?",
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RadioListTile(
              title: Text(
                "Gérant".toUpperCase(),
                style: GoogleFonts.alike(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              value: "Gerant",
              groupValue: role,
              onChanged: (value) {
                provider.changerole(value!);
              },
            ),
            SizedBox(
              height: 10,
            ),
            RadioListTile(
              title: Text(
                "Servant".toUpperCase(),
                style: GoogleFonts.alike(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              value: "Servant",
              groupValue: role,
              onChanged: (value) {
                provider.changerole(value!);
              },
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Votre mot de passe",
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15, top: 20, bottom: 0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  obscureText: !affiche,
                  controller: _mot_de_passe,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: (() {
                            _affiche.afficher();
                          }),
                          icon: Icon(
                            affiche ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          )),
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15,
              ),
              child: SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.shade800,
                        textStyle: TextStyle()),
                    onPressed: (() async {
                      try {
                        _password = _mot_de_passe.text.isNotEmpty
                            ? sha1
                                .convert(utf8.encode(_mot_de_passe.text.trim()))
                                .toString()
                            : "";
                        provider.affiche_true();
                        if (_password.isEmpty ||
                            domaine.isEmpty ||
                            role.isEmpty) {
                          provider.affiche_false();
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Vous n'avez pas renseigné tous les champs. Toutes ces informations sont obligatoires svp  !",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.8),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        } else if (!_user.admin) {
                          provider.affiche_false();
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Désolé ! Vous n'avez pas les privilèges d'effectuer cette opération car vous n'etes pas administrateur.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.8),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        } else if (_password != user_password) {
                          provider.affiche_false();
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Le mot de passe saisi ne correspond pas à votre mot de passe. Veuillez réessayez svp !",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.8),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        } else {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user_uid)
                              .update({'domaine': domaine, 'role': role});

                          _mot_de_passe.clear();
                          provider.affiche_false();

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Droits accordés avec succès.\n" +
                                      prenom_employe +
                                      " " +
                                      nom_employe +
                                      " a desormains les droits requis pour travailler sur cette application ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            backgroundColor: Colors.black87,
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        }

                        // ignore: empty_catches
                      } catch (e) {
                        provider.affiche_false();
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Une erreur inattendue s'est produite. Vérifiez votre connection internet et réessayez ! !",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          backgroundColor: Colors.redAccent.withOpacity(.8),
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snakbar);
                      }
                    }),
                    child: afficher
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Accorder de droits".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

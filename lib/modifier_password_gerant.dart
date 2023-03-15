// ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names, must_be_immutable, unred_type_equality_checks, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors, use_build_context_synchronously, depend_on_referenced_packages

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import 'interface/connexion.dart';
import 'interface/drawer_gerant.dart';
import 'provider/provider_creer_compte.dart';
import 'provider/serac.dart';
import 'services/user.dart';

class ModifierPasswordGerant extends StatelessWidget {
  ModifierPasswordGerant({key});

  TextEditingController password = TextEditingController();
  TextEditingController new_password = TextEditingController();

  String my_password = "";
  String mdp_crypt = "";
  String mdp = "Pawword";
  bool affiche = false;
  bool is_password = true;
  bool is_confirm = true;

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<Search>(context);
    final _validate = Provider.of<providerCreerCompte>(context);
    affiche = _provider.val;
    is_confirm = _validate.is_confirm;
    is_password = _validate.is_password;

    my_password = _user.mdp;

    var utilisateur = FirebaseAuth.instance.currentUser;

    return Scaffold(
      drawer: DrawerGerant(),
      backgroundColor: Colors.green.shade900,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Nouveau mot de passe",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "images/icon.jpeg",
                  height: 75,
                  width: 75,
                  scale: 2.5,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Déo Gracias",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Modification de mot de passe de connexion".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ancien mot de passe",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15,
              ),
              child: TextField(
                obscuringCharacter: '*',
                obscureText: is_password,
                controller: password,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: (() {
                        _validate.change_is_assword();
                      }),
                      icon: is_password
                          ? Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )),
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: GoogleFonts.lato(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nouveau mot de passe ***",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15,
              ),
              child: TextField(
                obscureText: is_confirm,
                controller: new_password,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: (() {
                        _validate.change_is_confirm();
                      }),
                      icon: is_confirm
                          ? Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: GoogleFonts.lato(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        textStyle: TextStyle()),
                    onPressed: (() async {
                      _provider.puttrue();
                      try {
                        if (password.text.isEmpty ||
                            new_password.text.isEmpty ||
                            password.text.length <= 7 ||
                            new_password.text.length <= 7) {
                          _provider.putfalse();
                          _speak(
                              "Tous les champs sont obligatoires s'il vous plait");
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Tous les champs n'ont pas été saisi ou les mots de passe renseignés sont incorrectes. Veuillez réessayez svp !",
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
                          if (_user.mdp !=
                              sha1
                                  .convert(utf8.encode(password.text.trim()))
                                  .toString()) {
                            _provider.putfalse();
                            _speak(
                                "Le mot de passe saisi ne correspond pas au votre. Veuillez réessayez. Merci");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Le mot de passe  saisi ne correspond pas à votre ancien mot de passe. Veuillez réessayez !",
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
                            await utilisateur
                                ?.updatePassword(new_password.text);
                            await FirebaseFirestore.instance
                                .collection("users")
                                .doc(_user.uid)
                                .update({
                              "mdp": sha1
                                  .convert(
                                      utf8.encode(new_password.text.trim()))
                                  .toString()
                            });
                            new_password.clear();
                            password.clear();
                            _provider.putfalse();
                            _speak(
                                "Votre mot de passe a été modifiée avec succès. vous serez déconnecté. Ensuite, vous allez saisir votre nouveau mot de passe pour vous réconnecter à l'application. Merci");

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Votre mot de passede connection a été modifié avec succès !",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              backgroundColor: Colors.indigo,
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(5),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                            FirebaseAuth.instance.signOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => LoginPage())));
                          }
                        }
                      } catch (e) {
                        _speak(
                            "Une erreur s'est produite. ce changement de mot de passe nécessite que vous vous déconnectez d'abord. C'est après vous avoir connecté à nouveau que vous pourriez changer le mot de passe. Merci de réessayez. ");
                        _provider.putfalse();
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
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: affiche
                          ? CircularProgressIndicator(
                              color: Colors.cyan,
                            )
                          : Text(
                              "Changer votre mot de passe".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future _speak(String text) async {
  final FlutterTts _flutter_tts = FlutterTts();
  _flutter_tts.setLanguage("Fr");
  _flutter_tts.setSpeechRate(0.5);
  _flutter_tts.setVolume(0.5);
  _flutter_tts.setPitch(1.0);
  _flutter_tts.speak(text);
}

// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, prefer_final_fields, must_be_immutable, no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously, unnecessary_null_comparison, avoid_types_as_parameter_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/serac.dart';
import '../services/registration.dart';
import 'connexion.dart';
import 'wrapper.dart';

class ValidateUserEmail extends StatelessWidget {
  ValidateUserEmail({
    Key? key,
    required this.email,
    required this.user_nom,
    required this.user_prenom,
    required this.user_telephone,
    required this.user_date_naissance,
    required this.sexe,
    required this.user_password,
    required this.code,
  }) : super(key: key);

  final String email;
  final String user_nom;
  final String user_prenom;
  final String user_telephone;
  final String user_date_naissance;
  final String sexe;
  final String user_password;

  final int code;
  bool affice = false;
  int _code = 0;

  TextEditingController _code_saisi = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  int leng = 0;

  @override
  Widget build(BuildContext context) {
    final firebase = Provider.of<firebaseAuth>(context);
    final _affiche = Provider.of<Search>(context);
    affice = _affiche.val;
    leng = email.length;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(170.0),
          child: Image.asset(
            "images/icon.jpeg",
            height: 1,
            width: 1,
            scale: 0.001,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Validation",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("images/informatique.jpg"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Validez votre adresse E-Mail !",
                textAlign: TextAlign.center,
                style: GoogleFonts.alike(color: Colors.white, fontSize: 19),
              ),
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
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Un code a été envoyé à l'email " +
                    email.substring(0, 3) +
                    "*************" +
                    email.substring(leng - 8, leng) +
                    "\n Veuillez saisir ce code",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Saisissez le code s'il vous plait !",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 2),
              child: TextField(
                controller: _code_saisi,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 5,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.black),
                  counterText: "",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87),
                    onPressed: (() async {
                      _affiche.puttrue();
                      _code = _code_saisi.text.isNotEmpty
                          ? int.parse(_code_saisi.text.trim())
                          : 0;
                      print(code);
                      print(_code);
                      try {
                        if (_code_saisi.text.isEmpty ||
                            _code_saisi.text.length != 5) {
                          _affiche.putfalse();

                          _speak(
                              "Le code saisi est vide ou incorrecte. Veuillez vérifier et réessayez. Merci");
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Le code saisi est vide ou incoorecte ! !",
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
                        } else if (_code == code) {
                          final _result =
                              await firebase.createUserWithEmailAndPassword(
                                  email, user_password);

                          if (_result != null) {
                            await FirebaseFirestore.instance
                                .collection("users")
                                .doc(auth.currentUser!.uid)
                                .set({
                              "deleted": false,
                              "nom": user_nom,
                              "prenom": user_prenom,
                              "sexe": sexe,
                              "role": "",
                              "date_naissance": user_date_naissance,
                              "telephone": user_telephone,
                              "email": email,
                              "timestamp": DateTime.now(),
                              "admin": false,
                              "is_active": true,
                              "domaine": "",
                              "photo_url": "",
                              "mdp": sha1
                                  .convert(utf8.encode(user_password.trim()))
                                  .toString(),
                            });

                            _speak("Votre compte a été créé avec succès");
                            _affiche.putfalse();

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Votre compte a été créé avec succès",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              backgroundColor: Colors.black87,
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(5),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Wrapper())));
                          } else {
                            _speak(
                                "L'email utilisé existe déjà ou le mot de passe que vous avez utilisé est moins sécurisé. Réessayez s'il vous plait");
                            _affiche.putfalse();
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "L'email utilisé existe dèjà ou le mot de passe utilisé est moins sécurisé. Veuillez réessayez svp !",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              backgroundColor: Colors.redAccent.withOpacity(.8),
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(5),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => LoginPage())));
                          }
                        } else {
                          _affiche.putfalse();
                          _speak(
                              "Le code saisi est incorrecte. Merci de réessayez");

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Le code saisi incoorecte ! !",
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
                      } catch (e) {
                        _affiche.putfalse();
                        _speak(
                            "Une erreur s'est produite. Vérifiez votre connection internet et réessayez. Merci");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                /* "Une erreur s'est produite. Merci de vérifiez votre connection internet et réessayez!"*/ e
                                    .toString(),
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
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: affice
                            ? CircularProgressIndicator(
                                color: Colors.cyanAccent,
                              )
                            : Text(
                                "Validez".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 80,
            )
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

// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, deprecated_member_use, sort_child_properties_last, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_print, use_build_context_synchronously, must_be_immutable, unused_field

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/provider_creer_compte.dart';
import '../provider/serac.dart';
import '../services/registration.dart';
import 'creer_compte.dart';
import 'reset_password.dart';
import 'wrapper.dart';

class LoginPage extends StatelessWidget {
  bool _obscureText = true;

  bool _isSubmitting = false;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<firebaseAuth>(context);
    final _provider_password = Provider.of<providerCreerCompte>(context);
    final _provider = Provider.of<Search>(context);
    _obscureText = _provider_password.is_password;
    _isSubmitting = _provider.val;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: (() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => RegisterPage())));
              }),
              child: Text(
                "Sign up",
                style: GoogleFonts.alike(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(170.0),
          child: Image.asset(
            "images/icon.jpeg",
            height: 1,
            width: 1,
            scale: 0.001,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Connexion",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        // centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                "Connectez vous !",
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
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Votre adresse E-Mail",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextFormField(
                  autocorrect: true,
                  enableSuggestions: true,
                  controller: email,
                  onTap: () {
                    _speak(" votre mail s'il  vous plait");
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      labelStyle: GoogleFonts.lato(color: Colors.black)),
                )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Votre mot de passe",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormField(
                autocorrect: true,
                enableSuggestions: true,
                obscuringCharacter: "*",
                controller: password,
                onTap: () {
                  _speak("s'il vous plait, votre mot de passe");
                },
                obscureText: !_obscureText,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _provider_password.change_is_assword();
                    },
                    child: Icon(
                      !_obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: GoogleFonts.lato(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 64,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          textStyle: TextStyle()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _isSubmitting
                            ? CircularProgressIndicator(
                                color: Colors.cyan,
                              )
                            : Text(
                                "Connexion".toUpperCase(),
                                style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                      onPressed: (() async {
                        try {
                          _provider.puttrue();
                          if (password.text.isEmpty ||
                              password.text.length < 8 ||
                              email.text.isEmpty ||
                              !email.text.contains("@")) {
                            _speak(" réessayez s'il vous plait");
                            _provider.putfalse();

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Tous les champs sont obligatoires. Veuillez vérifier si vous avez bien renseigné tous ces champs svp !",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
                          } else {
                            final result =
                                await _auth.signInWithEmailAndPassword(
                                    email.text.trim(), password.text.trim());

                            if (result != null) {
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(FirebaseAuth.instance.currentUser?.uid)
                                  .update({
                                "mdp": sha1
                                    .convert(utf8.encode(password.text.trim()))
                                    .toString()
                              });
                              _provider.putfalse();
                              _speak(
                                  "Vous avez été connecté. Veuillez patienter s'il vous plait pour la redirection. Merci");
                              email.clear();
                              password.clear();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Wrapper())));
                            } else {
                              _provider.putfalse();
                              _speak(
                                  "L'adresse mail ou le mot de passe saisi est incorrecte. Si vous avez oublié votre mot de passe , cliquez sur mot de passe oublié afin de le réinitialiser");

                              final snakbar = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "E-Mai ou mot de passe incorrect. Veuillez réessayez svp !",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                backgroundColor:
                                    Colors.redAccent.withOpacity(.8),
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(5),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snakbar);
                            }
                          }
                        } catch (e) {
                          _provider.putfalse();
                          /* _speak(
                              "Une erreur s'est produite. Vérifiez votre connexion internet et réessayez s'il vous plait");*/
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Une erreur inattendue s'est produite. Vérifiez votre connexion internet et réessayez svp!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
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
                        }
                      })),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 6,
                        color: Colors.white.withOpacity(.7),
                        style: BorderStyle.solid)),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextButton(
                      onPressed: (() {
                        _speak(
                            "Saisissez le mail utilisé pour créer le compte");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ResetPassword())));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Mot de passe oublié ?".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(
                  "Je n'ai pas encore de compte ",
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                height: 48,
                width: MediaQuery.of(context).size.width * 0.94,
                child: TextButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.shade900),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => RegisterPage())));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        "Créer un compte".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.alike(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 50,
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

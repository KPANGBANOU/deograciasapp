// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, use_build_context_synchronously, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/serac.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({
    key,
  }) : super(key: key);

  TextEditingController _email = TextEditingController();
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<Search>(context);
    affiche = _provider.val;
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
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Réinitiasation",
          style: GoogleFonts.alike(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
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
                "Réinitialisation de mot de passe",
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
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Adresse E-Mail",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  controller: _email,
                  onTap: () {
                    _speak("Saisissez le mail utilisé pour créer votre compte");
                  },
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                )),
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87),
                    onPressed: (() async {
                      _provider.puttrue();
                      try {
                        if (_email.text.isEmpty || !_email.text.contains("@")) {
                          _speak(
                              "L'adresse mail saisi est vide ou invalide.réessayez.Merci  ");
                          _provider.putfalse();

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "E-Mail vide ou invalide",
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
                          await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: _email.text.trim());
                          _provider.putfalse();
                          _email.clear();
                          _speak(
                              "Un e-mail vous a été envoyé via l'e-mail saisi. Veuillez consulter votre boite mail pour resaisir un nouveau mot de passe. Merci.");

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Un message a été envoyé à l'adresse e-mail " +
                                    _email.text +
                                    ". Veuillez consiulter votre boite e-mail",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            backgroundColor: Colors.indigo,
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        }
                        // ignore: empty_catches
                      } on FirebaseAuthException {
                        _provider.putfalse();
                        _speak(
                            "Cet adresse n'existe probablement pas. Vérifiez l'adresse e-mail et réessayez");

                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Adresse e-mail n'existe pas. Vérifiez et réessayez",
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
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: affiche
                          ? CircularProgressIndicator(
                              color: Colors.cyan,
                            )
                          : Text(
                              "Réinitialisation".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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

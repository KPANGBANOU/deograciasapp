// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, prefer_final_fields, must_be_immutable, no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

import 'interface/drawer.dart';
import 'interface/home.dart';
import 'modele/rapport.dart';
import 'provider/serac.dart';

class ValidateEmailReceptionRapport extends StatelessWidget {
  ValidateEmailReceptionRapport({
    Key? key,
    required this.email,
    required this.user_nom,
    required this.user_prenom,
    required this.user_uid,
    required this.code,
  }) : super(key: key);

  final String email;
  final String user_nom;
  final String user_prenom;
  final String user_uid;
  final int code;
  bool affice = false;
  int _code = 0;
  int len = 0;

  TextEditingController _code_saisi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _rapport = Provider.of<rapport>(context);
    final _affiche = Provider.of<Search>(context);
    len = email.length;
    affice = _affiche.val;
    return Scaffold(
      drawer: DrawerHome(),
      backgroundColor: Colors.green.shade900,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Validation d'email",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Un code a été envoyé à l'email " +
                    email.substring(0, 2) +
                    "************" +
                    email.substring(len - 8, len) +
                    "\n Veuillez saisir ce code",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _code_saisi,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 5,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Saisissez le code svp !",
                    hintStyle: TextStyle(color: Colors.black)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
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
                          await FirebaseFirestore.instance
                              .collection("rapports")
                              .doc(_rapport.uid)
                              .update({
                            "email": email,
                            "user_nom": user_nom,
                            "user_prenom": user_prenom,
                            "user_uid": user_uid,
                            "updated_at": DateTime.now()
                          });
                          _speak(
                              "le mail de reception de rapport a été modifié avec succès");
                          _affiche.putfalse();
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "le mail de reception de rapport a été modifié avec succès",
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => HomePage())));
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
                                "Une erreur s'est produite. Merci de vérifiez votre connection internet et réessayez!",
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
                                "Saisissez le code".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
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

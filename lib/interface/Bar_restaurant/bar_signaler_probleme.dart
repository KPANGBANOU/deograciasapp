// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_local_variable, no_leading_underscores_for_local_identifiers, unred_type_equality_checks, prefer_final_fields, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/provider/provider_affiche.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../base_donne/servicebasededonnees.dart';
import '../../services/user.dart';
import 'drawer_servant.dart';

class BarSignalerProbleme extends StatelessWidget {
  BarSignalerProbleme({key}) : super(key: key);

  TextEditingController _description = TextEditingController();
  String message = "";
  bool affiche = false;
  @override
  Widget build(BuildContext context) {
    final _service = Provider.of<serviceBD>(context);
    final _donnesUser = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<ProviderAffiche>(context);
    affiche = _provider.affiche;
    return Scaffold(
      drawer: servantdrawer(),
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        actions: [
          Image.asset(
            "images/icon.jpeg",
            scale: 4.5,
            height: 100,
            width: 100,
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Probème",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    image: DecorationImage(
                        image: AssetImage(
                          "images/resto.jfif",
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Problème rencontré ",
                textAlign: TextAlign.center,
                style: GoogleFonts.alike(color: Colors.white, fontSize: 24),
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
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Décrivez le problème svp",
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
                    const EdgeInsets.only(left: 25.0, right: 15, bottom: 10),
                child: TextField(
                    autocorrect: true,
                    enableSuggestions: true,
                    maxLines: 7,
                    controller: _description,
                    decoration: InputDecoration(
                        hintStyle: GoogleFonts.lato(color: Colors.black),
                        fillColor: Colors.white,
                        filled: true)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 15, top: 20, bottom: 70),
                child: SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      _provider.affiche_true();
                      try {
                        if (_description.text.isEmpty) {
                          _provider.affiche_false();
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Vous dévriez décrire svp le problème que vous rencontrez !",
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
                              .collection("problemes")
                              .add({
                            'user_uid': _donnesUser.uid,
                            'user_nom': _donnesUser.nom,
                            'user_prenom': _donnesUser.prenom,
                            'description': _description.text,
                            'created_at': DateTime.now(),
                            'numero_watsapp': _donnesUser.email,
                            'numero': _donnesUser.telephone
                          });
                          _description.clear();
                          _provider.affiche_false();
                          message = _donnesUser.prenom
                                  .toString()
                                  .toUpperCase() +
                              " , votre problème a té enregistré avec succès"
                                  .toUpperCase();
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                message,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
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
                      } catch (e) {
                        _provider.affiche_false();
                        message =
                            "Une erreur intattendue s'est produite pendant l'enregistrement du problème ! Réessayez svp !"
                                .toUpperCase();
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
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
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        textStyle: TextStyle(fontWeight: FontWeight.bold)),
                    child: affiche
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                  color: Colors.cyanAccent,
                                )),
                          )
                        : Text(
                            "Signalez le problème".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

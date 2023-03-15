// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, unused_local_variable, unred_type_equality_checks, no_leading_underscores_for_local_identifiers, prefer_final_fields, unused_field, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer.dart';
import 'package:deogracias/provider/provider_affiche.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../services/user.dart';

class CentreEnregistrerNouveauMateriel extends StatelessWidget {
  CentreEnregistrerNouveauMateriel({key}) : super(key: key);

  TextEditingController _nombre = TextEditingController();
  TextEditingController _nom = TextEditingController();
  String message = "";
  int nombre = 0;
  String nom = "";
  bool existe = false;
  bool affiche = false;
  @override
  Widget build(BuildContext context) {
    final _donnesUser = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<ProviderAffiche>(context);
    affiche = _provider.affiche;

    return Scaffold(
      drawer: DrawerHome(),
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Image.asset(
            "images/icon.jpeg",
            height: 60,
            width: 60,
            scale: 2.5,
          ),
        ],
        elevation: 0,
        title: Text(
          "Nouvel matériel",
          style: GoogleFonts.alike(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage("images/materiel_centre1.jfif"),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Matériel du centre informatique",
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
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nom du matériel",
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
                    const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
                child: TextField(
                    autocorrect: true,
                    enableSuggestions: true,
                    controller: _nom,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nombre initial du matériel",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.alike(
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
                  onTap: () {
                    _speak(
                        " saisir le nombre total de ce matériel qui existe dejà");
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _nombre,
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.lato(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10, top: 20, bottom: 70),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        _provider.affiche_true();

                        try {
                          nombre = _nombre.text.isNotEmpty
                              ? int.parse(_nombre.text)
                              : 0;
                          nom = _nom.text.isNotEmpty ? _nom.text : "";

                          if (_nom.text.isEmpty ||
                              _nombre.text.isEmpty ||
                              nombre <= 0) {
                            _speak(
                                "Tous les champs sont recquis. Vérifiez si vous avez bien renseigné les informations ");
                            _provider.affiche_false();
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Tous les champs sont obligatoires svp !",
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
                            final result = await FirebaseFirestore.instance
                                .collection("materiaux_centre")
                                .where("nom", isEqualTo: nom)
                                .get(); //verifier si le materiel existe deja

                            existe = result.docs.isEmpty;

                            if (existe) {
                              // si ca n'existe pas

                              await FirebaseFirestore.instance
                                  .collection("materiaux_centre")
                                  .add({
                                "nom": nom,
                                "nombre_initial": nombre,
                                "nombre_bon_etat": nombre,
                                "created_at": DateTime.now(),
                                "updated_at": DateTime.now()
                              });

                              _nom.clear();
                              _nombre.clear();
                              _provider.affiche_false();
                              _speak(
                                  "Le matériel a été ajouté avec succès. Merci");
                              message = "Le matériel a été ahouté avec succès !"
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
                                backgroundColor: Colors.black87,
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(5),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snakbar);
                            } else {
                              _provider.affiche_false();
                              _speak(
                                  "Ce matériel existe déjà. Veuillez modifier le nom et réessayer s'il vous plait. Merci. ");
                              message =
                                  "Le nom saisi est dejà utilisé. Modifiez le nom et réessayez s'il vous plait !"
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
                                backgroundColor:
                                    Colors.redAccent.withOpacity(.7),
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(5),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snakbar);
                            }
                          }
                        } catch (e) {
                          _provider.affiche_false();
                          _speak("Une erreur inattendue s'est produite ");
                          message =
                              "Une erreure inattendue s'est produite pendant l'enregistrement. Vérifiez votre connection internet et si le montant saisi n'est pas à virgule et réeessayez svp !"
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
                            backgroundColor: Colors.redAccent.withOpacity(.7),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown.shade900,
                          textStyle: TextStyle()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: affiche
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    )),
                              )
                            : Text(
                                "Enregistrez le matériel".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      )),
                ),
              ),
            ],
          )),
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

// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers, must_be_immutable, use_build_context_synchronously, deprecated_member_use, prefer_const_constructors_in_immutables, unused_local_variable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../provider/provider_creer_compte.dart';
import '../services/user.dart';
import 'drawer.dart';

class ProfilAdmin extends StatelessWidget {
  ProfilAdmin({key}) : super(key: key);

  String url = "";

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<providerCreerCompte>(context);
    url = _provider.url;
    File _imagefile;
    final _imagePicker = ImagePicker();

    return Scaffold(
      drawer: DrawerHome(),
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Image.asset(
            "images/icon.jpeg",
            height: 60,
            width: 60,
            scale: 2.5,
          ),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Mon profil",
          style: GoogleFonts.lato(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: 90,
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: Container(
                decoration: _user.photo_url.isEmpty
                    ? _user.sexe == "Masculin"
                        ? BoxDecoration(
                            image: DecorationImage(
                            image: AssetImage('images/homme.png'),
                            fit: BoxFit.cover,
                            scale: 2.5,
                          ))
                        : BoxDecoration(
                            image: DecorationImage(
                            image: AssetImage('images/femme.jpg'),
                            fit: BoxFit.cover,
                            scale: 2.5,
                          ))
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage(_user.photo_url),
                            fit: BoxFit.cover,
                            scale: 2.5)),
                child: Padding(
                  padding: EdgeInsets.only(top: 90.0, left: 90),
                  child: IconButton(
                      onPressed: (() async {
                        try {
                          final image = await _imagePicker.pickImage(
                              source: ImageSource.gallery,
                              maxHeight: 512,
                              maxWidth: 512);
                          String file_name = basename(image!.path);

                          final ref =
                              FirebaseStorage.instance.ref().child(file_name);
                          await ref.putFile(File(image.path));
                          ref.getDownloadURL().then((value) {
                            _provider.change_url(value);
                          });

                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(_user.uid)
                              .update({"photo_url": url.toString()});

                          _speak(
                              "Votre photo de profil a été mise à jour avec succès");

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Votre photo de profil a été mise à jour avec succès!",
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
                        } catch (e) {
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Une erreur inattendue s'est produite pendant cette opération. Vérifiez votre connection internet et réessayez !",
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
                        }
                      }),
                      icon: Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Nom".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _user.nom.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Prénom".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _user.prenom,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "E-Mail".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _user.email.toLowerCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Contact".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _user.telephone,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Date de naissance".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _user.date_inscription,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        textStyle: TextStyle()),
                    onPressed: (() {
                      _showMyDialog(
                          context,
                          _user.sexe,
                          _user.nom,
                          _user.prenom,
                          _user.telephone,
                          _user.date_naissance,
                          _user.uid);
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Modifiez votre profil".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(
    BuildContext context,
    String user_sexe,
    String user_nom,
    String user_prenom,
    String user_telephone,
    String user_date_naissance,
    String user_uid) async {
  TextEditingController _user_nom = TextEditingController();
  TextEditingController _user_prenom = TextEditingController();
  TextEditingController _user_telephone = TextEditingController();
  _user_nom.text = user_nom;
  _user_prenom.text = user_prenom;
  _user_telephone.text = user_telephone;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _user_nom,
                  decoration: InputDecoration(
                      hintText: "Saisissez votre nom svp !",
                      labelText: "Votre nom svp !"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _user_prenom,
                  decoration: InputDecoration(
                      hintText: "Saisissez votre prénom svp !",
                      labelText: "Votre prénom svp !"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _user_telephone,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      hintText: "Saisissez votre numéro svp !",
                      labelText: "Votre numéro svp !"),
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo, textStyle: TextStyle()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Confirmer'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      try {
                        if (_user_prenom.text.isEmpty ||
                            _user_nom.text.isEmpty ||
                            _user_telephone.text.isEmpty) {
                          _speak(
                              "Tous les champs n'ont pas été renseigné. Réessayez s'il vous plait ");
                        } else {
                          _speak("Veuillez patienter " + user_sexe == "Masculin"
                              ? "Monsieur "
                              : "Madame " +
                                  user_prenom +
                                  " car ceci prendra probablement un peu de temps ");
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user_uid)
                              .update({
                            "nom": _user_nom.text,
                            "prenom": _user_prenom.text,
                            "telephone": _user_telephone.text
                          });

                          _speak(user_sexe == "Masculin"
                              ? " Monsieur "
                              : " Madame " +
                                  user_prenom +
                                  ", vos informations ont été mise è jour avec succès ");
                        }

                        // ignore: empty_catches
                      } catch (e) {
                        _speak(
                            "Une erreur inattendue s'est produite. Vérifiez votre connection internet et réessayez s'il vous plait");
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.withOpacity(.7),
                        textStyle: TextStyle()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Annuler'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      );
    },
  );
}

Future _speak(String text) async {
  final FlutterTts _flutter_tts = FlutterTts();
  _flutter_tts.setLanguage("Fr");
  _flutter_tts.setSpeechRate(0.5);
  _flutter_tts.setVolume(0.5);
  _flutter_tts.setPitch(1.0);
  _flutter_tts.speak(text);
}

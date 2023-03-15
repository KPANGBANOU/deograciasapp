// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, must_be_immutable, prefer_final_fields, unused_field, avoid_print, avoid_function_literals_in_foreach_calls, unused_element, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/serac.dart';
import '../services/user.dart';
import 'drawer.dart';
import 'stream_accorder_droits_employes.dart';

class ListeUtilisateurs extends StatelessWidget {
  ListeUtilisateurs({key}) : super(key: key);

  TextEditingController _search_value = TextEditingController();

  bool affiche = false;
  String value_search = "";
  int nombre = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final _list_employes = Provider.of<List<donnesUtilisateur>>(context);
    final _search_provider = Provider.of<Search>(context);
    affiche = _search_provider.val;

    !affiche ? value_search = "" : value_search = _search_provider.searchvalue;
    _list_employes.forEach((element) {
      if (!element.admin && !element.deleted) {
        nombre++;
      }
    });
    if (_list_employes.isEmpty || nombre <= 0) {
      return Scaffold(
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
          centerTitle: true,
          elevation: 0.4,
          backgroundColor: Colors.white,
          title: Text(
            "Liste des employés",
            style: GoogleFonts.alike(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      drawer: DrawerHome(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: (() {
                _search_provider.afficher();
                print(affiche);
              }),
              icon: Icon(
                Icons.search_rounded,
                color: Colors.black,
                size: 20,
              )),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: affiche
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15,
                ),
                child: TextField(
                  onChanged: (value) {
                    _search_provider.rechercher(value);
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Recharchez ...",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true),
                ),
              )
            : Text(
                "Liste des employés",
                style: GoogleFonts.alike(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: ((context, index) {
              donnesUtilisateur _donnes = _list_employes[index];
              return !affiche
                  ? !_donnes.admin && !_donnes.deleted
                      ? ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        StreamAccorderDroitsEmployes(
                                          uid: _donnes.uid,
                                          user_password: user.mdp,
                                        ))));
                          },
                          trailing: IconButton(
                              onPressed: (() {
                                _showMyDialog(context, _donnes.nom,
                                    _donnes.prenom, _donnes.uid);
                              }),
                              icon: Icon(
                                Icons.delete,
                                color: Colors.black,
                              )),
                          leading: CircleAvatar(
                            backgroundColor: Colors.lightBlue.shade900,
                            child: Text(
                              "DG",
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(
                            _donnes.prenom.toString() +
                                " " +
                                _donnes.nom.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.alike(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container()
                  : _donnes.nom
                              .toLowerCase()
                              .contains(value_search.toLowerCase()) ||
                          _donnes.prenom
                              .toLowerCase()
                              .contains(value_search.toLowerCase())
                      ? !_donnes.admin && !_donnes.deleted
                          ? ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            StreamAccorderDroitsEmployes(
                                              uid: _donnes.uid,
                                              user_password: user.mdp,
                                            ))));
                              },
                              trailing: IconButton(
                                  onPressed: (() {
                                    _showMyDialog(context, _donnes.nom,
                                        _donnes.prenom, _donnes.uid);
                                  }),
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                  )),
                              leading: CircleAvatar(
                                backgroundColor: Colors.lightBlue.shade900,
                                child: Text(
                                  "DG",
                                  style: GoogleFonts.alike(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              title: Text(
                                _donnes.prenom.toString() +
                                    " " +
                                    _donnes.nom.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.alike(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : Container()
                      : Container();
            }),
            itemCount: _list_employes.length),
      ),
    );
  }
}

Future<void> _showMyDialog(
    BuildContext context, String nom, String prenom, String user_uid) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Etes vous sur ?".toUpperCase()),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("Vous etes sur le point de supprimer l'employé " +
                  prenom +
                  " " +
                  nom +
                  " de la base de données de cette entreprise"),
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
                      try {
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(user_uid)
                            .update({
                          "deleted": true,
                        });
                        _speak(
                            "L'utilisateur a été supprimé avec succès de la base de données ");
                        // Navigator.of(context).pop();
                        // ignore: empty_catches
                      } catch (e) {}
                      Navigator.of(context).pop();
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
                      _speak("Suppression de l'utilisateur annulée ");
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
